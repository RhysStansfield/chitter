require_relative 'spec_helper'

describe Post do

  let(:post) do 
    User.create({
          email: 'bar@foo.com',
          password: 'passy',
          password_confirmation: 'passy',
          name: 'Rumple',
          username: 'Derp'
          })
    Post.create(
      body: 'Amazing message!',
      user: User.first.username,
      time: Time.now)
  end

  it 'has a unique identifier' do
    expect(post.id).to be_a_kind_of Fixnum
  end

  it 'has a message' do
    expect(post.body).to eq 'Amazing message!'
  end

  it 'has a user' do
    expect(post.user).to eq 'Derp'
  end

  it 'has a timestamp' do
    expect(post.time).to be_a_kind_of DateTime
  end

end