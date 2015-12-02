defmodule Notes do

	def main(args) do
    args |> parse_args 
  end

  def parse_args(args) do
  options = OptionParser.parse(args)

	  case options do
	    {[new: head], tail, _} -> NewNotes.add([head|tail])
	    {[show: true], _, _} -> ShowNotes.display
  	end
  end
end
