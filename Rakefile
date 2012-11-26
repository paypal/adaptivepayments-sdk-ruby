require "bundler/gem_tasks"

desc "Run tests"
task :rspec do
  system("bundle exec rspec && cd samples && bundle exec rspec")
end

desc "View samples"
task :samples do
  system("cd samples/spec/dummy && bundle exec rails server")
end

task :default => :rspec
