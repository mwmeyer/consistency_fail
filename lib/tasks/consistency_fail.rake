require 'consistency_fail'

namespace :consistency_fail do
  task :run => :environment do
    ConsistencyFail.run
  end
end
