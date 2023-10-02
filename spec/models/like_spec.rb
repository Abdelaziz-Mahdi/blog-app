require 'rails_helper'

RSpec.describe Like, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

  subject { Like.new(post: first_post, author: first_user) }
  before { subject.save }

  it 'should update likes counter' do
    expect(first_post.likes_counter).to eq(0)
    subject.update_likes_counter
    expect(first_post.likes_counter).to eq(1)
  end
end
