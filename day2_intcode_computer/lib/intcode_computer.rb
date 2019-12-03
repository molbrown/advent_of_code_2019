class IntcodeComputer
  def initialize(sequence)
    @sequence = sequence
  end

  def first_value
    compute(0)[0]
  end

  def compute(i)
    sequence = @sequence
    while i < sequence.length
      if sequence[i] == 1
        sequence[sequence[i + 3]] = sequence[sequence[i + 1]] + sequence[sequence[i + 2]]
        i = i + 4
      elsif sequence[i] == 2
        sequence[sequence[i + 3]] = sequence[sequence[i + 1]] * sequence[sequence[i + 2]]
        i = i + 4
      elsif sequence[i] == 99
        return sequence
      else
        raise "Cannot compute"
      end
    end
    sequence
  end
end

array = File.readlines('input')[0].split(',').map(&:to_i)
puts IntcodeComputer.new(array).first_value