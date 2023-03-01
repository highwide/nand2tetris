class Parser
  A_COMMAND = :a_command
  C_COMMAND = :c_command
  L_COMMAND = :l_command

  class UnexpectedCommandError < StandardError; end

  def initialize(path:)
    File.open(path) do |file|
      @lines = file.each_line(chomp: true)
                .map { |l| l.gsub(/\s/, '') }
                .reject { |l| l == '' || l[0..1] == '//' }
                .to_a
    end

    @line_count = 0
    @line = @lines[@line_count]
  end

  def has_more_commands?
    return false if @lines.count == @line_count + 1

    true
  end

  def advance
    @line_count += 1
    @line = @lines[@line_count]
  end

  def command_type
    return A_COMMAND if @line[0] == '@'
    return C_COMMAND
    L_COMMAND
  end

  def symbol
    case command_type
    when A_COMMAND
      return @line.match(/@(.+)/).to_a[1]
    when L_COMMAND
      return @line.match(/\((.+)\)/).to_a[1]
    else
      raise UnexpectedCommandError("symbol for command: #{command_type}")
    end
  end

  def dest
    raise UnexpectedCommandError("dest for command: #{command_type}") if command_type != C_COMMAND

    @line.match(/(.+)=/).to_a[1]
  end

  def comp
    raise UnexpectedCommandError("comp for command: #{command_type}") if command_type != C_COMMAND

    @line.match(/(?:.+\=)?([^;]+)(?:;.+)?/).to_a[1]
  end

  def jump
    raise UnexpectedCommandError("jump for command: #{command_type}") if command_type != C_COMMAND

    @line.match(/(?:.+;)(.+)/).to_a[1]
  end
end
