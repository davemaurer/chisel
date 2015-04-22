require_relative './chisel'

input_file = File.read(ARGV[0])
output_file = (ARGV[1])

parser = Chisel.new(input_file, output_file)
parsed = parser.parse
File.write(output_file, parsed)

