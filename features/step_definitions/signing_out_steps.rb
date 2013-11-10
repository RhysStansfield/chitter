Given(/^that I am signed in$/) do
  page.should have_content 'Welcome to Chitter Derpenheisen'
  page.should_not have_content 'See you next time!'
end

When(/^I click Sign Out$/) do
  click_button 'Sign Out'
end

Then(/^I should no longer be signed in$/) do
  expect(current_path).to eq '/'
  page.should_not have_content 'Welcome to Chitter Derpenheisen'
  page.should have_content 'See you next time!'
end