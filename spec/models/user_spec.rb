require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new }

  before { subject.save }

  it 'should not validate name presence' do
    expect(subject).to_not be_valid
  end

  it 'should validate name presence' do
    subject.name = 'Tom'
    expect(subject).to be_valid
  end

  it 'should validate posts_counter greater_than_or_equal_to: 0' do
    expect(subject.posts_counter).to be >= 0
  end

  it 'should validate posts_counter numericality' do
    expect(subject.posts_counter).to be_a_kind_of(Integer)
  end

  it 'should return three most recent posts' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')
    expect(subject.three_most_recent_posts).to eq(subject.posts.order(created_at: :desc).limit(3))
  end
end
