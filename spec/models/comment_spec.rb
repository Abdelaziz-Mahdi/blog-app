require 'rails_helper'

RSpec.describe Comment, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

  subject { Comment.new(post: first_post, author: first_user, text: 'This is my first comment') }
  before { subject.save }

  it 'should update comments counter' do
    expect(first_post.comments_counter).to eq(0)
    subject.update_comments_counter
    expect(first_post.comments_counter).to eq(1)
  end
end
