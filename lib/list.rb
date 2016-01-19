class List
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def save
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first[:id].to_i
  end

  def ==(list)
    self.name == list.name
  end

  def self.all
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each do |list|
      name = list["name"]
      id = list["id"].to_i
      lists << List.new({name: name, id: id})
    end
    lists
  end

  def self.find(id)
    List.all.each do |list|
      if list.id == id
        return list
      end
    end
  end

  def tasks
    list_tasks = []
    tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id}")
    tasks.each do |task|
      description = task['description']
      list_id = task['list_id'].to_i
      id = task['id'].to_i
      list_tasks << Task.new({description: description, list_id: list_id, id: id})
    end
    list_tasks
  end

  def delete
    DB.exec("DELETE FROM lists WHERE id = #{self.id}")
  end
end
