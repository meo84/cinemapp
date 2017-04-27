require 'spec_helper'

feature 'User logs in' do
  scenario 'with invalid name' do
    log_in_with 'invalid name', 'password'

    expect(page).to have_css('.alert')
    expect(page).to have_content('Invalid name/password combo')
    expect(page).to have_current_path(login_path)
  end

  scenario 'with invalid password' do
    log_in_with 'test', 'invalid_password'

    expect(page).to have_css('.alert')
    expect(page).to have_content('Invalid name/password combo')
    expect(page).to have_current_path(login_path)
  end

  let(:user) { FactoryGirl.create :user, name: ENV["ADMIN_USER"], password: ENV["ADMIN_PASSWORD"], password_confirmation: ENV["ADMIN_PASSWORD"] }

  scenario 'with valid credentials, then logs out' do
    log_in_with user.name, user.password

    expect(page).to have_current_path(movies_path)
    expect(page).to have_content('Log out')

    click_link 'Log out'

    expect(page).to have_current_path(movies_path)
    expect(page).not_to have_content('Log out')
  end

  def log_in_with(name, password)
    visit login_path
    fill_in 'Name', with: name
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
