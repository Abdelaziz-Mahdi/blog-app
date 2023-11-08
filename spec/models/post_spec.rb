require 'rails_helper'

RSpec.describe Post, type: :model do
  default_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.new(author: default_user) }

  before { subject.save }

  it 'should not validate title presence' do
    expect(subject).to_not be_valid
  end

  it 'should validate title presence' do
    subject.title = 'Hello'
    expect(subject).to be_valid
  end

  it 'should validate title length' do
    subject.title = 'Hello'
    expect(subject.title.length).to be <= 250
  end
  it 'should validate comments_counter greater_than_or_equal_to: 0' do
    expect(subject.comments_counter).to be >= 0
  end

  it 'should validate comments_counter numericality' do
    expect(subject.comments_counter).to be_a_kind_of(Integer)
  end

  it 'should validate likes_counter greater_than_or_equal_to: 0' do
    expect(subject.likes_counter).to be >= 0
  end

  it 'should validate likes_counter numericality' do
    expect(subject.likes_counter).to be_a_kind_of(Integer)
  end

  it 'should return five most recent comments' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Comment.create(author: first_user, post: first_post, text: 'This is my first comment')
    Comment.create(author: first_user, post: first_post, text: 'This is my second comment')
    Comment.create(author: first_user, post: first_post, text: 'This is my third comment')
    Comment.create(author: first_user, post: first_post, text: 'This is my fourth comment')
    Comment.create(author: first_user, post: first_post, text: 'This is my fifth comment')
    Comment.create(author: first_user, post: first_post, text: 'This is my sixth comment')
    expect(subject.last_five_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
  end

  it "update_posts_counter should update author's posts_counter" do
    user = User.create(name: 'User 1')
    Post.create(title: 'Post 1', author: user)
    Post.create(title: 'Post 2', author: user)
    Post.create(title: 'Post 3', author: user)
    Post.create(title: 'Post 4', author: user)
    Post.create(title: 'Post 5', author: user)
    expect(user.posts_counter).to eq(5)
  end
end
