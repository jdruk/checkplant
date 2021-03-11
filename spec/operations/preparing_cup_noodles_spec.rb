# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../models/hourglass'
require_relative '../../models/cup_noodles'
require_relative '../../operations/preparing_cup_noodles'

describe Operations::PreparingCupNoodles do
  subject do
    params = {
      cup_noodles: CupNoodles.new(preparation_time: 3),
      hourglass_one: Hourglass.new(duration_time: 7),
      hourglass_two: Hourglass.new(duration_time: 5)
    }
    ::Operations::PreparingCupNoodles.new(params)
  end

  describe '#call' do
    it 'call with params valids' do
      result = subject.call
      expect(result.success?).to be_truthy
      expect(result.value).to eq({ time_minimum: 10 })
    end

    it 'with invalid hourglasses for the preparation of noodles' do
      params = {
        cup_noodles: CupNoodles.new(preparation_time: 3),
        hourglass_one: Hourglass.new(duration_time: 10),
        hourglass_two: Hourglass.new(duration_time: 5)
      }
      result = ::Operations::PreparingCupNoodles.new(params).call
      expect(result.success?).to be_falsey
      expect(result.errors).to include('it is not possible to prepare the noodles with the current hourglasses')
    end

    it 'with invalid hourglasses' do
      params = {
        cup_noodles: CupNoodles.new(preparation_time: 3),
        hourglass_one: Hourglass.new,
        hourglass_two: Hourglass.new(duration_time: 5)
      }
      result = ::Operations::PreparingCupNoodles.new(params).call
      expect(result.success?).to be_falsey
      expect(result.errors).to include('the time of all objects must be greater than or equal to zero and not null')
    end
  end
end
