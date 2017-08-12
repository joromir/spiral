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
  end

  describe '#ring' do
  end

  describe '#submatrix' do
  end
end
