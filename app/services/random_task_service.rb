class RandomTaskService
  def perform
    ids = Task.ids
    10.times do
      #
      # We pass the user to the thread, this is good
      # habit for shared variables, in this case
      # it doesn't make much difference
      #
      Task.find(ids.sample).update title: Faker::Name.name, description: Faker::Name.name, completed: [true, false].sample
      # puts "Create thread #{task.id}"

      # Thread.new(task) do |t|
      #   begin
      #     t.update title: Faker::Name.name, description: Faker::Name.name, completed: [true, false].sample
      #     puts t.errors if t.errors.present?
      #     #
      #     # Do the API call here use `u` (not `user`)
      #     # to access the user instance
      #     #
      #     # We shouldn't need to use an evented HTTP library
      #     # Ruby threads will pass control when the IO happens
      #     # control will return to the thread sometime when
      #     # the scheduler decides, but 99% of the time
      #     # HTTP and network IO are the best thread optimized
      #     # thing you can do in Ruby.
      #     #
      #   rescue Exception => e
      #     puts e
      #     sleep 300
      #     retry
      #   end
      # end
    end
  end
end