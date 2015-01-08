Given(/^a login with "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  User.create!(email: arg1, password: arg2)
end

When(/^I provide my login and desired password$/) do
  visit '/'
  click_link 'Sign In'
  expect(current_path).to eq(new_user_session_path)
  within('form') do
    fill_in 'Email', :with => 'gunmetal69@msn.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log In'
  end
end

Then(/^I should be logged in$/) do
  expect(page).to have()
end


Given(/^I am a new user to the site$/) do
  pending # express the regexp above with the code you wish you had
end