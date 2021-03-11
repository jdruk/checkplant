require 'active_model'

class Hourglass
  include ActiveModel::Validations
  
  attr_accessor :duration_time

  validates :duration_time, presence: true
end