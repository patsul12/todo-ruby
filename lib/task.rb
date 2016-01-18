class Task
  attr_accessor :description, :list_id

  def initialize(arguments)
    @description = arguments[:description]
    @list_id = arguments[:list_id]
  end

  def ==(task)
    self.description == task.description && self.list_id == task.list_id
  end

  def save
    DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id});")
  end

  def self.all
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each do |task|
      description = task["description"]
      list_id = task["list_id"].to_i
      tasks << Task.new({description: description, list_id: list_id})
    end
    tasks
  end
end
