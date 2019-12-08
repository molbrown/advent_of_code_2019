class OrbitMap
  def initialize(input)
    @orbits = input
  end

  def route(a, b)
    a = path(a)
    b = path(b)
    intersect = a.find { |point| b.include?(point) }

    a.index(intersect) + b.index(intersect)
  end

  def path(step)
    path = []
    orbit_map = orbits
    while orbit_map[step]
      step = orbit_map[step]
      path << step
    end
    path
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

puts OrbitMap.new(File.readlines('input')).route('YOU', 'SAN')