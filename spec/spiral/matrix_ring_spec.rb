require 'spec_helper'

RSpec.describe Spiral::MatrixRing do # rubocop:disable Metrics/BlockLength
  subject { described_class.new(matrix) }

  describe '#to_a' do # rubocop:disable Metrics/BlockLength
    context 'when matrix is 0x0' do
      let(:matrix) { Spiral::Matrix.new([]) }

      it 'returns the expected ring' do
        expect(subject.to_a).to eq([])
      end
    end

    context 'when matrix is 1x1' do
      let(:matrix) { Spiral::Matrix.new([[12]]) }

      it 'returns the expected ring' do
        expect(subject.to_a).to eq([12])
      end
    end

    context 'when matrix is 2x2' do
      let(:matrix) { Spiral::Matrix.new([[1, 13], [31, 2]]) }

      it 'returns the expected ring' do
        expect(subject.to_a).to eq([1, 13, 2, 31])
      end
    end

    context 'when matrix is 3x3' do
      let(:matrix) do
        input = [
          [12, 31, 66],
          [72, 10, 55],
          [0, -1, 4]
        ]
        Spiral::Matrix.new(input)
      end

      it 'returns the expected ring' do
        expect(subject.to_a).to eq([12, 31, 66, 55, 4, -1, 0, 72])
      end
    end
  end
end
