require_relative './result'

module Operations
  class Base
    def initialize(params, context= {})
      @params = params 
      @context = context
    end

    def call 
      raise NotImplementedError
    end

    def success(value)
      Operations::Result.new true, value: value 
    end 

    def failure(errors)
      Operations::Result.new false, errors: errors 
    end 
  end
end