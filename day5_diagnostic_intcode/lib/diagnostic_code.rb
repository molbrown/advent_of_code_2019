class DiagnosticCode
  def initialize(sequence)
    @sequence = sequence
  end

  # Instructions:
  # 1  | 3 params | adds parameters 1, 2, stores at 3
  # 2  | 3 params | multiplies parameters 1, 2, stores at 3
  # 3  | 1 param  | takes an input, stores it at param address
  # 4  | 1 param  | outputs the value of its param
  # 99 | 0 (end)  | exit

  # Modes:
  # 0 | position mode  | interpret param as position of the value
  # 1 | immediate mode | interpret param as a value

  def diagnose(input)
    seq = @sequence.dup
    compute(input, 0, seq)
    return
  end

  def instruction(instruct)
    instruct.to_s.chars.last(2).join.to_i
  end

  def mode(position, i, enum)
    enum[i].to_s.split('')[-2-position].to_i == 0 ? enum[i + position] : (i + position)
  end

  def compute(input, i, enum)
    while i < enum.length
      if instruction(enum[i]) == 1
        enum[enum[i + 3]] = enum[(mode(1, i, enum))] + enum[(mode(2, i, enum))]
        i = i + 4
      elsif instruction(enum[i]) == 2
        enum[enum[i + 3]] = enum[(mode(1, i, enum))] * enum[(mode(2, i, enum))]
        i = i + 4
      elsif instruction(enum[i]) == 3
        enum[enum[i + 1]] = input
        i = i + 2
      elsif instruction(enum[i]) == 4
        puts enum[enum[i + 1]]
        i = i + 2
      elsif instruction(enum[i]) == 99
        return enum
      else
        raise "Cannot compute"
      end
    end
    enum
  end
end

array = File.readlines('input')[0].split(',').map(&:to_i)
puts DiagnosticCode.new(array).diagnose(1)