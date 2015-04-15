require 'spec_helper'

feature "user browses the list of peeps" do

  before do
    Peep.create(:message => "Hello World!",
                :user => "Sebastien")
  end

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content "Welcome stranger"
  end
end
