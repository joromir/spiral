module Spiral
  # Converts a given instance of Spiral::Matrix
  # into an array of elements crawled in a
  # clockwise spiral manner.
  class MatrixCrawler
    attr_reader :matrix

    def initialize(matrix)
      @matrix = matrix
    end

    def to_a
      temporary = matrix
      spiral = matrix.ring

      matrix.rows.count.times do
        spiral += temporary.submatrix.ring
        temporary = temporary.submatrix
      end

      spiral
    end
  end
end
