require "bundler/gem_tasks"

desc "Run tests"
task :rspec do
  cmd = "bundle exec rspec && cd samples && bundle exec rspec"
  system(cmd) || raise("#{cmd} failed")
end

desc "View samples"
task :samples do
  system("cd samples/spec/dummy && bundle exec rails server")
end

task :default => :rspec
