class Panel
  def initialize(cables)
    @cable1 = cables[0].split(',')
    @cable2 = cables[1].split(',')
    @cable_plot1 = [[0,0]]
    @cable_plot2 = [[0,0]]
  end

  def perform
    path1 = plot(@cable1, @cable_plot1)
    path2 = plot(@cable2, @cable_plot2)

    crosses = path1 & path2
    closest = crosses.min_by { |point| path1.index(point) + path2.index(point) }
    path1.index(closest) + path2.index(closest) + 2
  end

  def plot(cable, cable_plot)
    cable.each do |path|
      direction = path.chr
      distance = path.delete(direction).to_i
      distance.times do
        last_point = cable_plot.last
        next_point = last_point.dup
        case direction
        when 'U'
          next_point[1] = next_point[1] + 1
        when 'D'
          next_point[1] = next_point[1] - 1
        when 'R'
          next_point[0] = next_point[0] + 1
        when 'L'
          next_point[0] = next_point[0] - 1
        end
        cable_plot << next_point
      end
    end
    cable_plot.drop(1)
  end
end

puts Panel.new(File.readlines('input')).perform