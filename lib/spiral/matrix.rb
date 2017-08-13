module Spiral
  # Spiral::Matrix.new expects an array of arrays.
  # Each component represents a row of the matrix.
  # Spiral::Matrix is designed to hold data for a
  # square matrix - the number of rows is equal to
  # the number of columns.
  class Matrix
    attr_reader :rows

    def initialize(rows = [])
      @rows = rows
    end

    def columns
      return rows if rows.empty? || rows.one?

      rows.reduce { |acc, row| acc.zip(row).map(&:flatten) }
    end

    def ring
      return [] if rows.empty?
      return rows.first if rows.one?

      north + east + south + west
    end

    def even?
      rows.size % 2 == 0
    end

    private

    def north
      rows[0]
    end

    def east
      columns[-1][1..-1]
    end

    def south
      position = even? ? 0 : 1

      rows[-1][position..-2]
    end

    def west
      return [] if even?

      columns[0].reverse[0..-2]
    end
  end
end
