class Grid
  attr_reader :cells, :width, :height

  def initialize(width, height)

    @width = width
    @height = height
    @cells = []
    height.times do |x|
      width.times do |y|
        @cells.push(Cell.new(x, y))
      end
    end
  end

  def cells_in_row(row)
    cells.select{|c| c.x == row}.sort_by(&:y)
  end

  def cells_in_column(column)
    cells.select{|c| c.y == column}.sort_by(&:x)
  end
end
