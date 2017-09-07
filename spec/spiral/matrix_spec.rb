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
      let(:input_rows) do
        [
          [1, 2, 3, 4],
          [4, 3, 2, 1],
          [0, 7, 8, 9],
          [6, 5, 3, 2]
        ]
      end

      it 'returns the expected ring' do
        expected_ring = [1, 2, 3, 4, 1, 9, 2, 3, 5, 6, 0, 4]

        expect(subject.ring).to eq(expected_ring)
      end
    end

    context 'when matrix is 5x5' do
      let(:input_rows) do
        [
          [12, 13, 14, 15, 16],
          [17, 18, 19, 20, 21],
          [12, 13, 14, 15, 16],
          [17, 18, 19, 20, 21],
          [10, 20, 30, 40, 50]
        ]
      end

      it 'returns the expected ring' do
        expected_ring = [
          12,
          13,
          14,
          15,
          16,
          21,
          16,
          21,
          50,
          40,
          30,
          20,
          10,
          17,
          12,
          17
        ]

        expect(subject.ring).to eq(expected_ring)
      end
    end
  end

  describe '#submatrix' do
    context 'when a 0x0 matrix is given' do
      let(:input_rows) { [] }

      it 'returns the expected submatrix' do
        expect(subject.submatrix).to eq(Spiral::Matrix.new([]))
      end
    end

    context 'when a 1x1 matrix is given' do
      let(:input_rows) { [[666]] }

      it 'returns the expected submatrix' do
        expect(subject.submatrix).to eq(Spiral::Matrix.new([]))
      end
    end

    context 'when 2x2 matrix is given' do
      let(:input_rows) do
        [
          [66, 666],
          [12, 122]
        ]
      end

      it 'returns the expected submatrix' do
        expect(subject.submatrix).to eq(Spiral::Matrix.new([]))
      end
    end

    context 'when 3x3 matrix is given' do
      let(:input_rows) do
        [
          [1,     22,     33],
          [444,   5555,   6666],
          [77_777, 888_888, 9_999_999]
        ]
      end

      it 'returns the expected submatrix' do
        expect(subject.submatrix).to eq(Spiral::Matrix.new([[5555]]))
      end
    end

    context 'when 4x4 matrix is given' do
      let(:input_rows) do
        [
          [16, 15, 14, 13],
          [12, 13, 14, 15],
          [17, 18, 19, 20],
          [20, 19, 18, 13]
        ]
      end

      it 'returns the expected submatrix' do
        expected_submatrix_input = [
          [13, 14],
          [18, 19]
        ]

        expected_submatrix = Spiral::Matrix.new(expected_submatrix_input)

        expect(subject.submatrix).to eq(expected_submatrix)
      end
    end

    context 'when matrix 5x5 is given' do
      let(:input_rows) do
        [
          [0,    10,  100, 1000, -4],
          [1,    11,  111, 1111, -3],
          [2222, 222, 222, 2,    -2],
          [-1,   0,   666, 777,   2],
          [-1,   0,   686, 772,   9]
        ]
      end

      it 'returns the expeted submatrix' do
        expected_submatrix_input = [
          [11, 111, 1111],
          [222, 222, 2],
          [0, 666, 777]
        ]

        expected_submatrix = Spiral::Matrix.new(expected_submatrix_input)

        expect(subject.submatrix).to eq(expected_submatrix)
      end
    end
  end
end
