require 'active_model'

class CupNoodles
  include ActiveModel::Validations
  
  attr_accessor :preparation_time

  validates :preparation_time, presence: true, numericality: { only_integer: true }

  def initialize(preparation_time: nil)
    @preparation_time = preparation_time
  end 
end