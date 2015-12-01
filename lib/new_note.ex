defmodule NewNote do
	
	def put_note do
 		url = "https://awesome-notes.firebaseio.com/notes.json"
    HTTPotion.put(url, [body: '{ "date": "2015-12-1", "note": "Hello,world!" }'])
    |> get_response_body
  end
    
  def get_response_body(response) do
  	%HTTPotion.Response{body: body} = response
    body
  end

end