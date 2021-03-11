require 'time'

require_relative '../spec_helper'
require_relative '../../models/cup_noodles'

describe CupNoodles do 
  describe '#be_valid?' do 
    it 'giving a noodle without the preparation time should not be valid' do 
      expect(subject).not_to be_valid
    end

    it 'giving a noodle with the preparation time should be valid' do 
      subject.preparation_time = Time.now
      expect(subject).to be_valid
    end
  end 
end