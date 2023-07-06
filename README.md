## Executing workflows

Now that we have defined our workflow and its jobs, we can use it:

### 1. Start background worker process

**Important**: The command to start background workers depends on the backend you chose for ActiveJob.
For example, in case of Sidekiq this would be:

```
bundle exec sidekiq -q gush
```

**[Click here to see backends section in official ActiveJob documentation about configuring backends](http://guides.rubyonrails.org/active_job_basics.html#backends)**

**Hint**: gush uses `gush` queue name by default. Keep that in mind, because some backends (like Sidekiq) will only run jobs from explicitly stated queues.


### 2. Create the workflow instance

```ruby
flow = PokemonWorkflow.new
```

### 3. Start the workflow

```ruby
flow.start!
```

Now Gush will start processing jobs in the background using ActiveJob and your chosen backend.

### 4. Monitor its progress:

```ruby
flow.reload
flow.status
#=> :running|:finished|:failed
```

`reload` is needed to see the latest status, since workflows are updated asynchronously.