require 'rails_helper'

RSpec.feature "Show Article" do
  before do
    @article = Article.create(title: "This is an Article", description: "Lorem ipsum dolor sit amet")
  end

  scenario "A user shows an Article" do
    visit "/"

    click_link(@article.title)

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.description)

    expect(current_path).to eq(article_path(@article))
  end
end