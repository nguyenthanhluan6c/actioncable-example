namespace :random do
  desc 'Random task'
  task :tasks => :environment do
    puts "Create thread"
    Thread.new do |t|
      puts "loop"
      loop do
        RandomTaskService.new.perform
        puts "sleep"
        sleep 0.2
      end
    end
    sleep 600
  end
end