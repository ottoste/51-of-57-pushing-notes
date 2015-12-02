defmodule ShowNotes do

	def display do
		request_notes
		|> parse_response
		|> get_notes
		|> return_notes
	end
	
	def request_notes do
 		url = "https://awesome-notes.firebaseio.com/notes.json"
    HTTPotion.get(url)
    |> get_response_body
  end
    
  defp get_response_body(response) do
  	%HTTPotion.Response{body: body} = response
    body
  end

  def parse_response(json) do
		Poison.Parser.parse!(json)
		|> Map.to_list
	end

	def get_notes(map_of_notes) do
		map_of_notes
		|> Enum.map(fn(x) -> build_rows(x) end)
	end

	def get_body(tuple) do
		tuple
		|> Tuple.to_list
		|> Enum.at(1)
	end

	def build_rows(tuple) do
		%{"note" => note, "time" => date} = get_body(tuple)
		Enum.join([date, note], " - ")
	end

	def return_notes(list_of_notes) do
		list_of_notes
		|> Enum.each(fn(x) -> IO.puts(x) end)
	end
end