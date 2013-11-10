require_relative 'spec_helper'

describe User do

  context 'the users info' do

    let (:peep) do
      User.create(
        email: 'bar@foo.com',
        password: 'passy',
        password_confirmation: 'passy',
        name: 'Rumple',
        username: 'Derp',
        posts: [Post.create(body: 'Awesome post!',
          user: 'Derp',
          username: 'Diddly',
          time: Time.now
          )]
        )
    end

    it 'has a unique identifier' do
      expect(peep.id).to be_a_kind_of Fixnum
    end

    it 'has a name' do
      expect(peep.name).to eq 'Rumple'
    end

    it 'has a username' do
      expect(peep.username).to eq 'Derp'
    end

    it 'can have a post assosciated with it' do
      expect(peep.posts.first.body).to eq 'Awesome post!'
    end

  end

end