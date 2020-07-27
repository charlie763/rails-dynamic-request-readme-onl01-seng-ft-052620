require 'rails_helper'

describe 'navigate' do
  before do
    @post = Post.create(title: "My Post", description: "My post desc")
  end

  it 'loads the show page' do
    visit "/posts/#{@post.id}"
    expect(page.status_code).to eq(200)
  end

  it 'shows the page of a given post by id and displays title in h1 tag' do
    visit "/posts/#{@post.id}"
    expect(page).to have_css('h1', text: @post.title)
  end

  it 'displays the description of the post in a p tag' do
    visit "/posts/#{@post.id}"
    expect(page).to have_css('p', text: @post.description)
  end
end