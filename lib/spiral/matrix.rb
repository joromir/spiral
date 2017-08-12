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
  end
end
