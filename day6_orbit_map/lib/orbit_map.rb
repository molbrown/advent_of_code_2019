class OrbitMap
  def initialize(input)
    @orbits = input
  end

  def count
    count = 0
    orbit_map = orbits
    orbit_map.each do |b, _|
      while orbit_map[b]
        b = orbit_map[b]
        count += 1
      end
    end
    count
  end

  def orbits
    map = {}
    @orbits.each do |orbit|
      a,b = orbit.split(')')
      b = b.delete("\n")
      map[b] = a
    end
    map
  end

  def input
    @orbits
  end
end

puts OrbitMap.new(File.readlines('input')).count