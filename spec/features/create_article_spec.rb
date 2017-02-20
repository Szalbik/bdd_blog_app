require 'rails_helper'

RSpec.feature "Creating articles" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "A user create a new article" do
    visit '/'

    click_link "New Article"

    fill_in "Title", with: "Creating blog"
    fill_in "Description", with: "Lorem ipsum dolor sit amet"

    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by: #{@john.email}")
    expect(Article.last.user).to eq(@john)
  end

  scenario "A user fails to create new article" do
    visit '/'

    click_link "New Article"

    fill_in "Title", with: ""
    fill_in "Description", with: ""

    click_button "Create Article"

    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end