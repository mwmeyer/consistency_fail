require 'consistency_fail/reporters/validates_uniqueness_of'
require 'consistency_fail/reporters/has_one'
require 'consistency_fail/reporters/polymorphic'
require 'consistency_fail/reporters/validates_presence_of'

module ConsistencyFail
  class Reporter
    def report_validates_uniqueness_problems(indexes_by_model)
      ConsistencyFail::Reporters::ValidatesUniquenessOf.new.report(indexes_by_model)
    end

    def report_has_one_problems(indexes_by_model)
      ConsistencyFail::Reporters::HasOne.new.report(indexes_by_model)
    end

    def report_polymorphic_problems(indexes_by_model)
      ConsistencyFail::Reporters::Polymorphic.new.report(indexes_by_model)
    end

    def report_validates_presence_of_problems(indexes_by_model)
      ConsistencyFail::Reporters::ValidatesPresenceOf.new.report(indexes_by_model)
    end
  end
end
