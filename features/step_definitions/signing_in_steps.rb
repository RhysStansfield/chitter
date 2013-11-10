Given(/^That I have an account but am not logged in$/) do
  expect(User.count).to eq 0
  User.create({
    email: 'bar@foo.com',
    password: 'passy',
    password_confirmation: 'passy',
    name: 'Rumple',
    username: 'Derp'
    })
  expect(User.count).to eq 1
  visit '/'
  page.should_not have_content 'Welcome'
end

When(/^I click the Log In link$/) do
  visit '/'
  click_link 'Sign In'
  expect(current_path).to eq '/session/new'
end

When(/^enter my username and password$/) do
  fill_in 'username', with: 'Derp'
  fill_in 'password', with: 'passy'
  click_button 'Sign In'
end

Then(/^I should see a welcome back message$/) do
  page.should have_content 'Welcome to Chitter Rumple'
end

When(/^enter my username and password incorrectly$/) do
  fill_in 'username', with: 'Bloink'
  fill_in 'password', with: 'Glavin'
  click_button 'Sign In'
end

Then(/^I should see an error message informing me so$/) do
  page.should have_content 'The email or password are incorrect'
end

Given(/^that I have an account and am logged in$/) do
  expect(User.count).to eq 0
  User.create({
    email: 'bar@foo.com',
    password: 'passy',
    password_confirmation: 'passy',
    name: 'Rumple',
    username: 'Derp'
    })
  expect(User.count).to eq 1
  visit '/session/new'
  fill_in 'username', with: 'Derp'
  fill_in 'password', with: 'passy'
  click_button 'Sign In'
  expect(current_path).to eq '/'
end

When(/^I visit the Log In page$/) do
  visit '/session/new'
end

Then(/^I should see a message telling me I'm already logged in$/) do
  page.should have_content 'You are already logged in!'
end