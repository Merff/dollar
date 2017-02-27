namespace :app do

  desc 'create and fill Dollar'
  task setup: :environment do
    Rake::Task['get_the_dollar'].invoke
  end

end