require_relative '../spec_helper'
require_relative '../../lib/operations/result'
require_relative '../../helpers/result'

describe '::Helpers::Result' do 
  describe '.format_result' do 
    subject {  ::Helpers::Result }

    it 'format result with status success eq true' do 
      result =  ::Operations::Result.new(true, value: {god_is_good: true})
      value = subject.format_result(result)
      expect(value).to include('successful')
    end

    it 'format result with status success eq false' do 
      result = ::Operations::Result.new(false, errors: { name: 'not blank'})
      value = subject.format_result(result)
      expect(value).to include('fail')
    end
  end
end