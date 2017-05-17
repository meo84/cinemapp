module LoginHelper
  def log_in_with(name, password)
    visit login_path
    fill_in 'Name', with: name
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
end
