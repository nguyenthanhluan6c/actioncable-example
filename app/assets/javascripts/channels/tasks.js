//= require cable
//= require_self

(function() {
    // Subscrive to the class name of the channel
    App.tasks = App.cable.subscriptions.create('ApplicationCable::TasksChannel', {
        /**
         * Whenever this channel pushes content, it is received here
         */
        received: function(task) {
            debugger
            var $tasks = $('.tasks');
            var $task = $('[data-task-id="' + task.id + '"]', $tasks);
            if ($task.length > 0) {
                // Existing Task
                switch (task.status) {
                    case 'saved':
                        $task.replaceWith(task.html);
                        break;

                    case 'deleted':
                        $task.remove();
                        break;
                }
            } else {
                // New Task
                $tasks.append(task.html);
            }
        }
    });
}).call(this);