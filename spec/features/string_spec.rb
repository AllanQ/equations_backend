require_relative '../../lib/string'

describe String do
  describe '#numeric?' do
    it 'return true with number' do
      expect('0'.numeric?).to eq(true)
    end

    it 'return false with empty string' do
      expect(''.numeric?).to eq(false)
    end
  end
end
