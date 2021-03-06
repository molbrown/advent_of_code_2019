class DiagnosticCode
  def initialize(sequence)
    @sequence = sequence
  end

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
        enum[enum[i + 3]] = enum[mode(1, i, enum)] + enum[mode(2, i, enum)]
        i = i + 4
      elsif instruction(enum[i]) == 2
        enum[enum[i + 3]] = enum[mode(1, i, enum)] * enum[mode(2, i, enum)]
        i = i + 4
      elsif instruction(enum[i]) == 3
        enum[enum[i + 1]] = input
        i = i + 2
      elsif instruction(enum[i]) == 4
        puts enum[enum[i + 1]]
        i = i + 2
      elsif instruction(enum[i]) == 5
        i = enum[mode(1, i, enum)] != 0 ? enum[mode(2, i, enum)] : (i + 3)
      elsif instruction(enum[i]) == 6
        i = enum[mode(1, i, enum)] == 0 ? enum[mode(2, i, enum)] : (i + 3)
      elsif instruction(enum[i]) == 7
        enum[enum[i + 3]] = enum[mode(1, i, enum)] < enum[mode(2, i, enum)] ? 1 : 0
        i = i + 4
      elsif instruction(enum[i]) == 8
        enum[enum[i + 3]] = enum[mode(1, i, enum)] == enum[mode(2, i, enum)] ? 1 : 0
        i = i + 4
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
puts DiagnosticCode.new(array).diagnose(5)