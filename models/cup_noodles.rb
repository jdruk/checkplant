require 'active_model'

class CupNoodles
  include ActiveModel::Validations
  
  attr_accessor :preparation_time

  validates :preparation_time, presence: true
end