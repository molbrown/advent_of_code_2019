class FuelCounter
  def initialize(input)
		@modules = input
	end
	
	def fuel_total
		@modules.inject(0) {|sum, mass| sum + fuel_calculate(mass.to_f) }
	end

	def fuel_calculate(mass)
		(mass/3).to_i - 2
	end
end

puts FuelCounter.new(File.readlines('input')).fuel_total