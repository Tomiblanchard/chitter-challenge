require 'spec_helper'

describe Peep do

  context 'Demonstration of how datamapper works' do

    date = DateTime.now

    it 'should be created and then retrieved from the database' do
      expect(Peep.count).to eq(0)
      Peep.create(content: "This is the first chitter peep",
                  created_at: date)
      peep = Peep.first
      expect(peep.content).to eq "This is the first chitter peep"
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end
