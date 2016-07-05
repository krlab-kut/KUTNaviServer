namespace :regularly do
  desc "congestion_infoの更新"

  task update_congestion: :environment do
  # taskdo
    logger = Logger.new('log/task.log')
    logger.debug "test"
    UsersController.sayHello
  end
end
