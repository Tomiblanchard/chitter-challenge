module SessionHelpers

  def sign_up(username = "Tomi",
              email = "tomiblanchard@gmail.com",
              password = "password",
              password_confirmation = "password")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

  def create_peep(content)
    click_button 'Peep'
    fill_in 'content', :with => content
    click_on 'Post Peep'
  end

  def reply_peep(content)
    peeps = page.all('.peep')
    peeps.first.click_button 'Reply'
    fill_in 'content', :with => content
    click_button("Reply to Peep")
  end
end
