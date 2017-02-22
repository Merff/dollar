require 'rails_helper'

feature 'admin page' do
  given!(:dollar) { Dollar.create(real_value: 60.0, force_time: DateTime.current) }

  context 'user update force data' do

    scenario 'set force time > current time' do
      date_time = DateTime.current + 1.hour
      visit '/admin'
      fill_in 'Force value', with: 20
      select date_time.year, from: 'dollar[force_time(1i)]'
      select date_time.strftime("%B"), from: 'dollar[force_time(2i)]'
      select date_time.day, from: 'dollar[force_time(3i)]'
      select date_time.hour, from: 'dollar[force_time(4i)]'
      select date_time.minute, from: 'dollar[force_time(5i)]'
      click_button 'Update Dollar'
      expect(page).to have_content '20.0 руб'
    end

    scenario 'set force time < current time' do
      date_time = DateTime.current - 1.hour
      visit '/admin'
      fill_in 'Force value', with: 20
      select date_time.year, from: 'dollar[force_time(1i)]'
      select date_time.strftime("%B"), from: 'dollar[force_time(2i)]'
      select date_time.day, from: 'dollar[force_time(3i)]'
      select date_time.hour, from: 'dollar[force_time(4i)]'
      select date_time.minute, from: 'dollar[force_time(5i)]'
      click_button 'Update Dollar'
      expect(page).to have_content '60.0 руб'
    end
  end

end