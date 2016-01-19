require 'spec_helper'

describe List do
  describe '.all' do
    it 'is empty at first' do
      expect(List.all()).to(eq([]))
    end
  end

  describe '#name' do
    it 'lets you give it a name' do
      test_list = List.new({name: 'Epicodus stuff', id: nil})
      expect(test_list.name).to(eq('Epicodus stuff'))
    end
  end

  describe '#id' do
    it 'sets its ID when you save it' do
      test_list = List.new({name: 'Epicodus stuff', id: nil})
      test_list.save
      expect(test_list.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe '#==' do
    it 'is the same list if it has the same name' do
      list1 = List.new({name: 'Epicodus Stuff', id: nil})
      list2 = List.new({name: 'Epicodus Stuff', id: nil})
      expect(list1).to(eq(list2))
    end
  end

  describe '#save' do
    it 'adds a list to the array of saved lists' do
      test_list = List.new({name: 'Epicodus Stuff', id: nil})
      test_list.save
      expect(List.all).to(eq([test_list]))
    end
  end

  describe '.find' do
    it 'returns a list by its ID' do
      test_list = List.new({name: 'Epicodus stuff', id: nil})
      test_list.save
      test_list2 = List.new({name: 'Home stuff', id: nil})
      test_list2.save
      expect(List.find(test_list2.id)).to(eq(test_list2))
    end
  end

  describe '#tasks' do
    it 'returns an array of tasks for that list' do
      test_list = List.new({name: 'Epicodus stuff', id: nil})
      test_list.save
      test_task = Task.new({description: "learn SQL", list_id: test_list.id})
      test_task.save
      test_task2 = Task.new({description: "Review Ruby", list_id: test_list.id})
      test_task2.save
      expect(test_list.tasks).to(eq([test_task,test_task2]))
    end
  end
end
