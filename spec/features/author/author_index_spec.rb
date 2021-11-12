require 'rails_helper'

describe "Author page", type: :feature do
    it "should exists at 'authors_path' and have a link" do
        visit authors_path
        expect(page).to have_text 'Name'
        expect(page).to have_text 'Homepage'
        expect(page).to have_link 'New', href: new_author_path
    end
end