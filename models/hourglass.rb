# frozen_string_literal: true

require 'active_model'

class Hourglass
  include ActiveModel::Validations

  attr_accessor :duration_time

  validates :duration_time, presence: true, numericality: { only_integer: true }

  def initialize(duration_time: nil)
    @duration_time = duration_time
  end
end
