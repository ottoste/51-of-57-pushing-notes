defmodule ShowNotesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  
  test "parse the response" do
    response = "{\"-K4YH0JE-zzNSJ7QUUlZ\":{\"note\":\"This is a note\",\"time\":\"2015-12-2\"}}"
    parsed = [{"-K4YH0JE-zzNSJ7QUUlZ", %{"note" => "This is a note", "time" => "2015-12-2"}}]

    assert ShowNotes.parse_response(response) == parsed
  end

  test "get map containing the note and the date" do
    tuple = {"-K4YH0JE-zzNSJ7QUUlZ", %{"note" => "This is a note", "time" => "2015-12-2"}}
    map = %{"note" => "This is a note", "time" => "2015-12-2"}

    assert ShowNotes.get_body(tuple) == map 
  end

  test "buil readable row (YYYY-MM-DD - 'Note')" do
    tuple = {"-K4YH0JE-zzNSJ7QUUlZ", %{"note" => "This is a note", "time" => "2015-12-2"}}
    readable_row = "2015-12-2 - This is a note"

    assert ShowNotes.build_rows(tuple) == readable_row
  end

  test "take list of tuples and return a list of readable rows" do
    tuples = [
      {"-K4YH0JE-zzNSJ7QUUlZ", %{"note" => "This is a note", "time" => "2015-12-2"}},
      {"-K4YH3DtlasyduM8bdgP", %{"note" => "This is another note", "time" => "2015-12-2"}}]
    readable_rows = [
      "2015-12-2 - This is a note",
      "2015-12-2 - This is another note"]

    assert ShowNotes.get_notes(tuples) == readable_rows
  end

  test "display notes in terminal" do
    list_of_notes = [
      "2015-12-2 - This is a note",
      "2015-12-2 - This is another note"]
    fun = fn -> assert ShowNotes.return_notes(list_of_notes) == :ok end

    assert capture_io(fun) == """
    2015-12-2 - This is a note
    2015-12-2 - This is another note
    """
  end
end
 
