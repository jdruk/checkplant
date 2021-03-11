require_relative '../spec_helper'
require_relative '../../models/hourglass'

describe Hourglass do 
  describe '#be_valid?' do 
    it 'giving a hourglass without the duration time should not be valid' do 
      expect(subject).not_to be_valid
    end

    it 'giving a hourglass with the duration time should be valid' do 
      subject.duration_time= Time.now
      expect(subject).to be_valid
    end
  end 
end