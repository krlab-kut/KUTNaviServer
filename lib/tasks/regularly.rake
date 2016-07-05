namespace :regularly do
  desc "congestion_infoの更新"

  task :update_congestion do
    logger = Logger.new('log/task.log')
    logger.debug "debug"
  end
end
