namespace :twitter do
  desc "Nuke User and Tweet data"
  task :clear => :environment do
    User.destroy_all
    Tweet.destroy_all
  end

  desc "Create :user_count fake users with lorem"
  task :lorem, [:user_count] => :environment do |t, args|
    puts "About to create #{args[:user_count]}"
    FactoryGirl.create_list :user_with_tweets, args[:user_count].to_i
  end
  desc "Search twitter for query, returning :limit results"
  task :search, [:query, :limit] => :environment do |t, args|
    puts "Searching Twitter for #{args[:query]}"
    puts "Returning only #{args[:limit]} tweets"
end
end