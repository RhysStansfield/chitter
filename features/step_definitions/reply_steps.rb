Given(/^there is a post I want to reply to$/) do
  click_button 'Sign Out'
  page.should have_content 'See you next time!'
  visit '/'
  click_link 'Sign Up'
  fill_in 'email', with: 'blah@blah.com'
  fill_in 'password', with: 'passy'
  fill_in 'password_confirmation', with: 'passy'
  fill_in 'name', with: 'Goink'
  fill_in 'username', with: 'Gark'
  click_button 'Sign Me Up!'
  click_link 'New Peep'
  fill_in 'message', with: 'A deeply insightful and reply-worthy post'
  click_button 'Peep'
  expect(current_path).to eq '/'
  click_button 'Sign Out'
  click_link 'Sign In'
  fill_in 'username', with: 'Baggette'
  fill_in 'password', with: 'passy'
  click_button 'Sign In'
  expect(current_path).to eq '/'
  page.should have_content 'Welcome to Chitter Derpenheisen'
end

When(/^I click the reply button on a peep and post a response$/) do
  puts 'SLIME ALERT!'
  # click_button('Reply').in Post.first
end