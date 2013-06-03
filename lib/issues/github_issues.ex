defmodule Issues.GithubIssues do

  alias HTTPotion.Response

  @user_agent  [ "User-agent": "Elixir malonso@gmail.com"]

  def fetch(user, project) do
   
    HTTPotion.start
    
    case HTTPotion.get(issues_url(user, project), @user_agent) do
      
      Response[body: body, status_code: status,  headers: _ ] when status in 200..299 -> { :ok, body } 	  
      Response[body: body, status_code: _ , headers: _ ] -> { :error, body }
    
    end
  end

  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end


end