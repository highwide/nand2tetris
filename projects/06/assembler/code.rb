class Code
  def self.dest(mnemonic:)
    case mnemonic
    when nil
      return '000'
    when 'M'
      return '001'
    when 'D'
      return '010'
    when 'MD'
      return '011'
    when 'A'
      return '100'
    when 'AM'
      return '101'
    when 'AD'
      return '110'
    when 'AMD'
      return '111'
    else
      raise 'assertNever'
    end
  end

  COMP_WITH_MEMORY = {
    'M'   => '110000',
    '!M'  => '110001',
    '-M'  => '110011',
    'M+1' => '110111',
    'M-1' => '110010',
    'D+M' => '000010',
    'D-M' => '010011',
    'M-D' => '000111',
    'D&M' => '000000',
    'D!M' => '010101',
  }

  COMP_WITHOUT_MEMORY = {
    '0'   => '101010',
    '1'   => '111111',
    '-1'  => '111010',
    'D'   => '001100',
    'A'   => '110000',
    '!D'  => '001101',
    '!A'  => '110001',
    '-D'  => '001111',
    '-A'  => '110011',
    'D+1' => '011111',
    'A+1' => '110111',
    'D-1' => '001110',
    'A-1' => '110010',
    'D+A' => '000010',
    'D-A' => '010011',
    'A-D' => '000111',
    'D&A' => '000000',
    'D|A' => '010101',
  }

  def self.comp(mnemonic:)
    return "#{1}#{COMP_WITH_MEMORY[mnemonic]}" if mnemonic.include? 'M'

    "#{0}#{COMP_WITHOUT_MEMORY[mnemonic]}"
  end

  def self.jump(mnemonic:)
    case mnemonic
    when nil
      return '000'
    when 'JGT'
      return '001'
    when 'JEQ'
      return '010'
    when 'JGE'
      return '011'
    when 'JLT'
      return '100'
    when 'JNE'
      return '101'
    when 'JLE'
      return '110'
    when 'JMP'
      return '111'
    else
      raise 'assertNever'
    end
  end
end
