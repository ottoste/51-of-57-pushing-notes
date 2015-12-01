defmodule Notes do

	def main(args) do
    args |> parse_args 
  end

  def parse_args(args) do
  options = OptionParser.parse(args)

	  case options do
	    {[new: note], _, _} -> IO.puts "Hello, #{note}! You're awesome!!"
	    {[show: true], _, _} -> IO.puts "This is help message"
  	end
  end
end
