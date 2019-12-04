class Password
  def initialize(lower, upper)
    @lower_limit = lower
    @upper_limit = upper
  end

  def find
    digit_match & never_decrease
  end

  def digit_match
    inside_range.select do |num|
      characters = num.split(//)

      counts = Hash.new(0)
      characters.each { |char| counts[char] += 1 }

      counts.any? { |k, v| v == 2 }
    end
  end

  def never_decrease
    inside_range.select do |num|
      characters = num.split(//)
      characters.sort == characters
    end
  end

  def inside_range
    (@lower_limit..@upper_limit).to_a.map(&:to_s)
  end

end

puts Password.new(240920, 789857).find.count