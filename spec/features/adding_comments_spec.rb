require 'rails_helper'

RSpec.feature "Adding comments to Article" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    @fred = User.create!(email: "fred@example.com", password: "password")
    @article = Article.create!(title: "Title one", description: "Body of article one", user: @john)
  end

  scenario "Permit a sign in user to write a comment" do
    login_as(@fred)

    visit "/"

    click_link @article.title

    fill_in "New Comment", with: "An awesome article"
    click_button "Add Comment"

    expect(page).to have_content("Comment has been created.")
    expect(page).to have_content("An awesome article")
    expect(current_path).to eq(article_path(@article.id))
  end
end