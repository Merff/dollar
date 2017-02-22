require 'rails_helper'

RSpec.describe Dollar, type: :model do
  
  context '#instance' do

    it 'return first Dollar object' do
      dollar = Dollar.create(force_time: DateTime.current)
      expect(Dollar.instance).to eq dollar
    end

    it 'create new Dollar if Dollars empty' do
      Dollar.instance
      expect(Dollar.count).to eq 1
    end
  end

end
