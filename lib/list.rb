require 'pry'
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
end
