require 'spec_helper'

feature 'User logs in' do

  let(:user) { FactoryGirl.create :user, password: 'simple_password', password_confirmation: 'simple_password' }

  scenario 'with invalid name' do
    log_in_with 'invalid name', 'password'

    expect(page).to have_css('.alert')
    expect(page).to have_content('Invalid name/password combo')
    expect(page).to have_current_path(login_path)
  end

  scenario 'with invalid password' do
    log_in_with user.name, 'invalid_password'

    expect(page).to have_css('.alert')
    expect(page).to have_content('Invalid name/password combo')
    expect(page).to have_current_path(login_path)
  end

  scenario 'with valid credentials, then logs out' do
    log_in_with user.name, user.password

    expect(page).to have_current_path(movies_path)
    expect(page).to have_content('Log out')

    click_link 'Log out'

    expect(page).to have_current_path(movies_path)
    expect(page).not_to have_content('Log out')
  end

end
