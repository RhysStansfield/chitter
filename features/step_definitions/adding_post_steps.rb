Given(/^that I have an account$/) do
  visit '/'
  click_link 'Sign Up'
  fill_in 'email', with: 'asd@asd.com'
  fill_in 'password', with: 'passy'
  fill_in 'name', with: 'Derpenheisen'
  fill_in 'username', with: 'Baggette'
  click_button 'Sign Me Up!'
end

Given(/^am logged in$/) do
  expect(User.count).to eq 1
end

When(/^I click the Add Post button$/) do
  click_link 'Add Post'
  expect(current_path).to eq '/add_post'
end

When(/^write a post and click Post$/) do
  expect(Post.count).to eq 2
  fill_in 'message', with: 'A new post, cool!'
  click_button 'Share'
  expect(Post.count).to eq 3
end

Then(/^my post should be on the home page$/) do
  page.should have_content 'A new post, cool!'
  page.should have_content 'Baggette'
end