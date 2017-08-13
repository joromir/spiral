module Spiral
  # Spiral::Matrix.new expects an array of arrays.
  # Each component from the input is expected to represent
  # a row of the matrix.
  # Keep in mind that we consider only the case of
  # square matrix.
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
      rows.size.even?
    end

    private

    def north
      rows[0]
    end

    def east
      columns.last[1..-1]
    end

    def south
      position = even? ? 0 : 1

      rows.last[position..-2].reverse
    end

    def west
      return [] if even? && rows.size == 2

      position = even? && rows.size != 2 ? 1 : 0

      columns.first.reverse[position..-2]
    end
  end
end
