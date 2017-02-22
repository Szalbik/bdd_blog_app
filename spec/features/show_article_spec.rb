require 'rails_helper'

RSpec.feature "Show Article" do
  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    @fred = User.create(email: 'fred@example.com', password: 'password')
    @article = Article.create(title: "This is an Article", description: "Lorem ipsum dolor sit amet", user: @john)
  end

  scenario "to non-signed in user hides Edit/Delete links" do
    visit "/"
    click_link(@article.title)
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.description)
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "to non-owner in user hides Edit/Delete links" do
    login_as(@fred)
    visit "/"
    click_link(@article.title)
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.description)
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "to signed in owner show Edit/Delete links" do
    login_as(@john)
    visit "/"
    click_link(@article.title)
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.description)
    expect(current_path).to eq(article_path(@article))
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end
end