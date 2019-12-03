class IntcodeComputer
  def initialize(sequence)
    @sequence = sequence
  end

  def noun_verb(result)
    pairs = (0..99).to_a.repeated_permutation(2).to_a
    find = pairs.select { |pair| run_pair(pair) == result }
  end

  def run_pair(pair)
    seq = @sequence.dup
    seq[1] = pair[0]
    seq[2] = pair[1]
    new_seq = compute(0, seq)
    new_seq[0]
  end

  def first_value
    compute(0)[0]
  end

  def compute(i, enum)
    while i < enum.length
      if enum[i] == 1
        enum[enum[i + 3]] = enum[enum[i + 1]] + enum[enum[i + 2]]
        i = i + 4
      elsif enum[i] == 2
        enum[enum[i + 3]] = enum[enum[i + 1]] * enum[enum[i + 2]]
        i = i + 4
      elsif enum[i] == 99
        return enum
      else
        raise "Cannot compute"
      end
    end
    enum
  end
end

array = File.readlines('input')[0].split(',').map(&:to_i)
puts IntcodeComputer.new(array).noun_verb(19690720)