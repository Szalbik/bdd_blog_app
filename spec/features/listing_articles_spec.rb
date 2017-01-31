require 'rails_helper'

RSpec.feature "Listing Articles" do
  before do
    @article1 = Article.create(title: "This is first article", description: "This is description of 1st article")
    @article2 = Article.create(title: "This is second article", description: "This is description of 2nd article")
  end

  scenario "A user list all articles" do
    visit root_path

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.description)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.description)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
end