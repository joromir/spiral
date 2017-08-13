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

    # TODO: refactor Matrix#ring
    def ring
      return [] if rows.empty?
      return rows[0] if rows.one?

      if rows.size % 2 == 0
        rows[0] + columns[-1][1..-1] + [rows[-1][0]]
      else
        rows[0] + columns[-1][1..-1]  + rows[-1][1..-2] + columns[0].reverse[0..-2]
      end
    end
  end
end
