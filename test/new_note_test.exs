defmodule NewNoteTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "convert list of strings to one string" do
  	list = ["wash", "horse", "and", "stuff"]
  	string = "wash horse and stuff"

  	assert NewNote.parse_note(list) == string 
  end

  test "get status code from http response" do
  	response = 
  	%HTTPotion.Response{body: "body",headers: ["headers"], status_code: 200}

  	assert NewNote.get_status_code(response) == 200
  end

  test "if request was successful, display success message" do
  	fun = fn -> assert NewNote.display(200) == :ok end

    assert capture_io(fun) == "Your note was saved.\n"
  end

  test "if request was unsuccessful, display error message" do
  	fun = fn -> assert NewNote.display(400) == :ok end
  	
    assert capture_io(fun) == "Something went wrong. Try again.\n"
  end

end