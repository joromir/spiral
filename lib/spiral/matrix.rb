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
      MatrixRing.new(self).to_a
    end

    def submatrix
      return [] unless rows.size > 2

      rows[1..-2].map { |row| row[1..-2] }
    end
  end
end
