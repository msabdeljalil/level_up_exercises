When(/^I visit the hompage$/) do
  visit root_path
end

Then(/^I should see links to login and signup$/) do
  expect(page).to have_content("Sign Up")
  expect(page).to have_content("Log In")
end