Then(/^I should see "(.*?)"$/) do |arg1|
  puts current_path, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  puts arg1, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  puts find("h1#bomb_status").attributes, "??????????????????????????????"
  expect(find("h1#bomb_status")).to have_content(arg1)
end
