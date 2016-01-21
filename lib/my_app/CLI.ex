defmodule MyApp.CLI do
  @script_path Path.absname("./scr.bash")
  @options [strict: [name: :binary], aliases: [n: :name]]

  def main(arguments) do
    { parsed, _argv, _errors } = OptionParser.parse(arguments, @options)
    { result, _exit_code } = System.cmd(@script_path, [parsed[:name]])
    result
    |> String.strip
    |> IO.puts
  end
end
