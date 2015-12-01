defmodule Notes do

	def main(args) do
    args |> parse_args 
  end

  def parse_args(args) do
  options = OptionParser.parse(args)

	  case options do
	    {[new: head], tail, _} -> NewNote.add([head|tail])
	    {[show: true], _, _} -> nil
  	end
  end
end
