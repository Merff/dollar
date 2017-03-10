namespace :app do

  desc 'create and fill in Dollar'
  task setup: :environment do
    GetDollarService.execute
  end

end