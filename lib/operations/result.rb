module Operations
  class Result
    attr_reader :value
    attr_reader :errors

    def initialize(success, value: nil, errors: nil)
      @success = success
      @value = value
      @errors = errors
    end

    def success?
      @success
    end

    def failure?
      !@success
    end
  end
end 