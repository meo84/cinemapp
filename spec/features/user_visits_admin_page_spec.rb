require 'spec_helper'

feature 'User visits admin page' do

  let(:simple_user) { FactoryGirl.create :user, password: 'simple_password', password_confirmation: 'simple_password' }
  let(:admin_user) { FactoryGirl.create :user, :admin, name: 'admin_user', password: 'admin_password', password_confirmation: 'admin_password' }

  before(:each) { 3.times do
    FactoryGirl.create(:movie_with_event, attendees_count: 10)
    FactoryGirl.create(:director_with_movies, movies_count: 2)
  end
  }

  scenario 'logged in without admin rights' do
    log_in_with simple_user.name, simple_user.password
    visit new_movie_path

    expect(page).to have_current_path(root_path)
  end

  scenario 'logged in with admin rights' do
    log_in_with admin_user.name, admin_user.password
    visit new_movie_path

    expect(page).to have_current_path(new_movie_path)
  end

end
