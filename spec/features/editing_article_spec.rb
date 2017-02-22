require 'rails_helper'

RSpec.feature "Editing an Article" do
  before do
    john = User.create(email: 'john@example.com', password: 'password')
    login_as(john)
    @article = Article.create(title: "Title one", description: "This is description of first article", user: john)
  end

  scenario 'A user updates an article' do
    visit '/'

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "This is title of first article"
    fill_in "Description", with: "This is description of first article"

    click_button "Update Article"

    expect(page).to have_content("Article was successfully updated")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario 'A user fails to update an article' do
    visit '/'

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Description", with: "This is description of first article"

    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(current_path).to eq(article_path(@article))
  end
end
