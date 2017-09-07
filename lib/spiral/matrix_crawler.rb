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
      return matrix.ring if matrix.atomic?

      matrix.ring + MatrixCrawler.new(matrix.submatrix).to_a
    end
  end
end
