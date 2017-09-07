require 'spec_helper'

RSpec.describe Spiral::MatrixCrawler do
  describe '#to_a' do
    subject(:crawler) { described_class.new(matrix) }

    context 'when matrix is 1x1' do
      let(:matrix) do
        Spiral::Matrix.new([[5]])
      end

      it 'returns the expected sequence' do
        expect(crawler.to_a).to eq [5]
      end
    end

    context 'when matrix is 2x2' do
      let(:matrix) do
        Spiral::Matrix.new([[66, 12], [34, 10]])
      end

      it 'returns the expected sequence' do
        expect(crawler.to_a).to eq [66, 12, 10, 34]
      end
    end

    context 'when matrix is 3x3' do
      let(:matrix) do
        Spiral::Matrix.new([
          [43, 32, 21],
          [55, 90, 12],
          [80, 23, 41]
        ])
      end

      it 'returns the expected sequence' do
        expect(crawler.to_a).to eq [43, 32, 21, 12, 41, 23, 80, 55, 90]
      end
    end

    context 'when matrix is 4x4' do
      let(:matrix) do
        Spiral::Matrix.new([
          [43, 32, 21, 88],
          [55, 90, 12, 99],
          [80, 23, 41, 12],
          [52, 91, 11, 95]
        ])
      end

      it 'returns the expected sequence' do
        sequence = [
          43, 32, 21, 88, 99,
          12, 95, 11, 91, 52,
          80, 55, 90, 12, 41, 23
        ]

        expect(crawler.to_a).to eq sequence
      end
    end

    context 'when matrix is 5x5' do
      let(:matrix) do
        Spiral::Matrix.new([
          [43, 32, 21, 88, 7],
          [55, 90, 12, 99, 0],
          [80, 23, 41, 12, 2],
          [52, 91, 11, 95, 8],
          [12, 32, 43, 54, 6]
        ])
      end

      it 'returns the expected sequence' do
        sequence = [
          43, 32, 21, 88, 7, 0, 2, 8, 6, 54, 43, 32, 12, 52, 80, 55,
          90, 12, 99, 12, 95, 11, 91, 23, 41
        ]

        expect(crawler.to_a).to eq sequence
      end
    end
  end
end
