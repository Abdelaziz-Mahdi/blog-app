require 'rails_helper'

RSpec.describe 'test root page to have list of users', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'shows the username of all users' do
    visit root_path

    expect(page).to have_content('Tom')
    expect(page).to have_content('Lilly')
  end
end
