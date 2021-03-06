require 'rails_helper'

RSpec.describe 'User create', type: :feature do
  scenario 'User creation' do
    visit new_user_registration_path
    fill_in 'user_name',  with: 'mero'
    fill_in 'user_email',  with: 'mero@gmail.com'
    fill_in 'user_password',  with: 'password'
    fill_in 'user_password_confirmation',  with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('Welcome!')
  end
end
