Given(/^I have not created a bomb$/) do
  visit create_bomb_path
end

When(/^I create a bomb$/) do
  click_link "Create Bomb"
end

Then(/^I expect a bomb to have been created$/) do
  pending # express the regexp above with the code you wish you had
  # How do check the session for presence of a bomb?
end