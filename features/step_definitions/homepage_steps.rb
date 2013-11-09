Given(/^that I visit the home page$/) do
  visit '/'
end

Then(/^I should see content "(.*?)"$/) do |content|
  page.should have_content content
end

Given(/^that I came to this site to read messages$/) do
  visit '/'
  page.should have_content 'Awesome post!'
end

Then(/^I should see all messages!$/) do
  page.should have_content 'Awesome post!'
  page.should have_content 'Sahwheat!'
end

Then(/^the names of the message posters$/) do
  page.should have_content 'Derp'
  page.should have_content 'Doink'
end
