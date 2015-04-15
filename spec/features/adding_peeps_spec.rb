require 'spec_helper'
require_relative 'helpers/session'

feature 'user adds a new peep' do

  include SessionHelpers
    before(:each) do
      User.create(:username => "Tomi",
                  :email => "tomiblanchard@gmail.com",
                  :password => 'password',
                  :password_confirmation => 'password')
    end

  scenario "with correct credentials" do
    visit '/'
    sign_in('tomiblanchard@gmail.com', 'password')
    expect(page).to have_content("Welcome back")
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("Hello, this is my first tweet", "Tomi")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq("Hello, this is my first tweet")
  end

  def add_peep(message, user)
    within('#new-peep') do
      fill_in 'message', :with => message
      click_button 'Send peep'
    end
  end

end
