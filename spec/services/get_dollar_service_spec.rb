require 'rails_helper'

describe 'GetDollarService' do

  subject { Dollar.instance.real_value.to_s }

  it '#execute' do
    GetDollarService.execute
    expect(subject).to match /\d+[.,]\d+/
  end

end
