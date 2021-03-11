# frozen_string_literal: true

require_relative '../lib/operations/base'

module Operations
  class PreparingCupNoodles < ::Operations::Base
    def call
      validates!
      cup_noodle_with_time_of_hourglasses
      success(time_minimum: time_minimum)
    rescue ArgumentError => e
      failure(e.message)
    end

    private

    def validates!
      return if @params[:cup_noodles].valid? && @params[:hourglass_one].valid? && @params[:hourglass_two].valid?

      raise ArgumentError, 'the time of all objects must be greater than or equal to zero and not null'
    end

    # DESCRIÇÃO DO PROBLEMA DIZ (ampulhetas tem tempo maiores que o tempo do miojo),
    # por isso não faço um if para checar se alguma ampulheta bate com o tempo do miojo
    def time_minimum
      hourglass_major, hourglass_minor = hourglass_ordener
      minimum_preparation_time(major: hourglass_major, minor: hourglass_minor)
    end

    def hourglass_ordener
      hourglass_major = @params[:hourglass_one].duration_time
      hourglass_minor = @params[:hourglass_two].duration_time
      hourglass_major, hourglass_minor = hourglass_minor, hourglass_major if hourglass_minor > hourglass_major
      [hourglass_major, hourglass_minor]
    end

    def cup_noodle_with_time_of_hourglasses
      hourglass_major, hourglass_minor = hourglass_ordener
      time = time_minimum - hourglass_major
      return if @params[:cup_noodles].preparation_time == time

      raise ArgumentError, 'it is not possible to prepare the noodles with the current hourglasses'
    end

    def minimum_preparation_time(major: 0, minor: 0)
      minor * (major - minor)
    end
  end
end
