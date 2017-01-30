require 'rails_helper'

RSpec.feature "Creating articles" do
  scenario "A user create a new article" do
    visit '/'

    click_link "New Article"

    fill_in "Title", with: "Creating blog"
    fill_in "Description", with: "Lorem ipsum dolor sit amet"

    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end
end