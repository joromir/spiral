require 'spec_helper'

RSpec.describe Spiral::Matrix do
  subject { described_class.new(input_rows) }

  describe '#rows' do
    context 'when [] is given' do
      let(:input_rows) { [] }

      it 'returns []' do
        expect(subject.rows).to eq([])
      end
    end

    context 'when [[1, 2], [3, 4]]' do
      let(:input_rows) { [[1, 2], [3, 4]] }

      it 'returns [[1, 2], [3, 4]]' do
        expect(subject.rows).to eq([[1, 2], [3, 4]])
      end
    end
  end

  describe '#columns' do
    context 'when [] is given' do
      let(:input_rows) { [] }

      it 'returns []' do
        expect(subject.columns).to eq([])
      end
    end

    context 'when [[1]] is given' do
      let(:input_rows) { [[1]] }

      it 'returns [[1]]' do
        expect(subject.columns).to eq([[1]])
      end
    end

    context 'when [[1, 2], [3, 4]] is given' do
      let(:input_rows) { [[1, 2], [3, 4]] }

      it 'returns [[1, 3], [2, 4]]' do
        expect(subject.columns).to eq([[1, 3], [2, 4]])
      end
    end

    context 'when [[12, 23, 34], [11, 22, 33], [31, 21, 11]]' do
      let(:input_rows) { [[12, 23, 34], [11, 22, 33], [31, 21, 11]] }

      it 'returns ' do
        transposed = [
          [12, 11, 31],
          [23, 22, 21],
          [34, 33, 11]
        ]

        expect(subject.columns).to eq(transposed)
      end
    end
  end

  describe '#ring' do
    context 'when rows are 0x0' do
      let(:input_rows) { [] }

      it 'returns []' do
        expect(subject.ring).to eq([])
      end
    end

    context 'when rows are 1x1' do
      let(:input_rows) { [[1]] }

      it 'returns [1]' do
        expect(subject.ring).to eq([1])
      end
    end

    context 'when matrix is 2x2' do
      let(:input_rows) do
        [
          [2, 4],
          [8, 10]
        ]
      end

      it 'returns the expected ring' do
        expect(subject.ring).to eq([2, 4, 10, 8])
      end
    end

    context 'when matrix is 3x3' do
      let(:input_rows) do
        [
          [11, 22, 33],
          [8, 18, 88],
          [6, 61, 661]
        ]
      end

      it 'returns the expected ring' do
        expected_ring = [11, 22, 33, 88, 661, 61, 6, 8]

        expect(subject.ring).to eq(expected_ring)
      end
    end

    context 'when given matrix is 4x4' do
      it 'returns the expected ring'
    end
  end

  describe '#submatrix' do
  end
end
