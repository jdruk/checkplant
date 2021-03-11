# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../lib/operations/base'
require_relative '../../../lib/operations/result'

describe Operations::Result do
  subject { ::Operations::Result.new(true, value: { god_is_good: true }) }

  describe '#success?' do
    it 'should return true with value eq {god_is_good: true}' do
      expect(subject.success?).to be_truthy
      expect(subject.value).to eq({ god_is_good: true })
    end

    it 'should return false' do
      subject = ::Operations::Result.new(false, value: {})
      expect(subject.success?).to be_falsey
    end
  end

  describe '#failure?' do
    it 'should return false ' do
      expect(subject.failure?).to be_falsey
    end

    it "should return true and erros eq { name: 'not blank' }" do
      subject = ::Operations::Result.new(false, errors: { name: 'not blank' })
      expect(subject.failure?).to be_truthy
      expect(subject.errors).to eq({ name: 'not blank' })
    end
  end
end
