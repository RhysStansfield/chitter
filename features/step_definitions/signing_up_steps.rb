Given(/^I follow the "(.*?)" link$/) do |arg1|
  visit '/'
  click_link 'Sign Up'
  expect(current_path).to eq '/users/new'
end

When(/^I enter my details and press "(.*?)"$/) do |button|
  fill_in 'email', with: 'asd@asd.com'
  fill_in 'password', with: 'passy'
  fill_in 'name', with: 'Derpenheisen'
  fill_in 'username', with: 'Baggette'
  click_button button
end

Then(/^I should have an account on Chitter$/) do
  expect(User.count).to eq 1
end

Then(/^I should see a welcome message$/) do
  expect(current_path).to eq '/'
  page.should have_content 'Welcome to Chitter Derpenheisen'
end