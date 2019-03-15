class ConsistencyFail::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/consistency_fail.rake'
  end
end
