namespace :test do
  desc 'Test classes source'
  Rake::TestTask.new(:classes) do |t|
    t.libs << 'test'
    t.pattern = 'test/classes/**/*_test.rb'
    t.verbose = true
  end
end

