# frozen_string_literal: true

module Helpers
  module Result
    def self.format_result(result)
      if result.success?
        "operation returned successful
        value: #{result.value}"
      else
        "operation returned fail
        value: #{result.errors}"
      end
    end
  end
end
