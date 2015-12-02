defmodule NewNotes do

	def add(command_line_note) do
		command_line_note
		|> parse_note
		|> put_note
		|> get_status_code
		|> display
	end

	def parse_note(command_line_note) do
		Enum.join(command_line_note, " ")
	end

  def add_time do
    time_tuple = Timex.DateFormat.format(Timex.Date.now,"{YYYY}-{M}-{D}")
    {:ok, time} = time_tuple
    time
  end
	
	def put_note(note) do
    time = add_time
 		url = "https://awesome-notes.firebaseio.com/notes.json"
    HTTPotion.post(url, [body: '{ "time": "#{time}" , "note": "#{note}" }'])
  end
    
  def get_status_code(response) do
  	%HTTPotion.Response{status_code: status} = response
    status
  end

  def display(status) do
  	cond do
  		status == 200 -> success_message
  		true -> error_message
  	end
  end

  defp success_message do
  	IO.puts("Your note was saved.")
  end

  defp error_message do
  	IO.puts("Something went wrong. Try again.")
  end
end