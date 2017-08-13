module Spiral
  class MatrixRing
    attr_reader :matrix, :rows, :columns

    def initialize(matrix)
      @matrix  = matrix
      @rows    = matrix.rows
      @columns = matrix.columns
    end

    def to_a
      return [] if rows.empty?
      return rows.first if rows.one?

      north + east + south + west
    end

    def even?
      rows.size.even?
    end

    private

    def north
      rows.first
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
