require_relative '../../spec_helper'
require_relative '../../../lib/operations/base'
require_relative '../../../lib/operations/result'

describe Operations::Base do 
  subject {  ::Operations::Base.new({}) }

  describe '#success' do
    it 'should return a Operations::Result' do 
      result = subject.success({})
      expect(result).to be_kind_of(::Operations::Result)
    end
  end
  
  describe '#failure' do
    it 'should return a Operations::Result' do 
      result = subject.failure({})
      expect(result).to be_kind_of(::Operations::Result)
    end
  end

  describe '#call' do 
    it 'should thown NotImplementedError' do 
      expect { subject.call }.to raise_error(NotImplementedError)
    end
  end
end 