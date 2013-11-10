Given(/^I follow the "(.*?)" link$/) do |link|
  visit '/'
  click_link link
  expect(current_path).to eq '/users/new'
end

When(/^I enter my details and press "(.*?)"$/) do |button|
  fill_in 'email', with: 'asd@asd.com'
  fill_in 'password', with: 'passy'
  fill_in 'password_confirmation', with: 'passy'
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

When(/^I enter my details but put differet passwords in and press "(.*?)"$/) do |button|
  fill_in 'email', with: 'asd@asd.com'
  fill_in 'password', with: 'passy'
  fill_in 'password_confirmation', with: 'parg'
  fill_in 'name', with: 'Derpenheisen'
  fill_in 'username', with: 'Baggette'
  click_button button
end

Then(/^I should see an error message$/) do
  expect(current_path).to eq '/users'
  page.should have_content "Sorry, your passwords don't match!"
end

When(/^I enter an email or username that already exists on the system$/) do
  expect(User.count).to eq 0
  User.create({
    email: 'bar@foo.com',
    password: 'passy',
    password_confirmation: 'passy',
    name: 'Rumple',
    username: 'Derp'
    })
  expect(User.count).to eq 1
  visit '/users/new'
  fill_in 'email', with: 'bar@foo.com'
  fill_in 'password', with: 'passy'
  fill_in 'password_confirmation', with: 'parg'
  fill_in 'name', with: 'Derpenheisen'
  fill_in 'username', with: 'Derp'
  click_button 'Sign Me Up!'
  expect(User.count).to eq 1
end

Then(/^I should see an error message telling me so$/) do
  page.should have_content "Sorry, that email is already taken!"
  page.should have_content "Sorry, that username is already taken!"
end

