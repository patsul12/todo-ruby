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
end
