Given(/^I am a new user to the site$/) do
  visit '/'
end

When(/^I create an account$/) do
  click_link 'Sign Up'
  expect(current_path).to eq(new_user_registration_path)
  within('form') do
    fill_in 'Email', with: 'gunmetal69@msn.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
  end
end

Then(/^I should be successfully signed up$/) do
  expect(page).to have_content("Welcome! You have signed up successfully.")
end

Given(/^a login with "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  User.create!(email: arg1, password: arg2)
end

When(/^I login with "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  visit '/'
  click_link 'Sign In'
  expect(current_path).to eq(new_user_session_path)
  within('form') do
    fill_in 'Email', with: 'gunmetal69@msn.com'
    fill_in 'Password', with: 'password'
    click_on 'Log In'
  end
end

Then(/^I should be successfully signed in$/) do
  expect(page).to have_content("Signed in successfully.")
end
