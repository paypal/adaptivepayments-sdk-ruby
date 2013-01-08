require "bundler/gem_tasks"

desc "Run tests"
task :rspec do
  if RUBY_VERSION >= "1.9.3"
    cmd = "bundle exec rspec && cd samples && bundle exec rspec"
  else
    cmd = "bundle exec rspec"
  end
  system(cmd) || raise("#{cmd} failed")
end

desc "View samples"
task :samples do
  system("cd samples/spec/dummy && bundle exec rails server")
end

task :default => :rspec
