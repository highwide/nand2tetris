require './parser.rb'
require './code.rb'

puts 'Enter a target path of file to assemble: '
path = gets.chomp
parser = Parser.new(path: path)

output = []

loop do
  case parser.command_type
  when Parser::A_COMMAND
    prefix = "0"
    # TODO consider symbol
    begin
      value = parser.symbol.to_i.to_s(2).rjust(15, '0')
    rescue => e
      binding.irb
    end

    output << "#{prefix}#{value}"
  when Parser::C_COMMAND
    prefix = "111"
    command = [
      Code.comp(mnemonic: parser.comp),
      Code.dest(mnemonic: parser.dest),
      Code.jump(mnemonic: parser.jump)
    ].join

    output << "#{prefix}#{command}"
  when Parser::L_COMMAND
  end

  break unless parser.has_more_commands?
  parser.advance
end

File.open("#{File.dirname(path)}/highwide_#{File.basename(path, ".asm")}.hack", "w") do |file|
  file.write(output.join("\n"))
end

