require 'consistency_fail/reporters/base'

module ConsistencyFail
  module Reporters
    class ValidatesPresenceOf < Base
      attr_reader :macro

      def initialize
        @macro = :validates_presence_of
      end
    end
  end
end
