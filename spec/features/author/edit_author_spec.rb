require 'rails_helper'

describe "Edit author page", type: :feature do
    context "with author named Alan Turing" do
        alan = FactoryBot.create :author

        it "should have text inputs for an author's first name, last name, and homepage" do
            visit edit_author_path(alan)
            expect(page).to have_field('author[first_name]')
            expect(page).to have_field('author[last_name]')
            expect(page).to have_field('author[homepage]')
        end

        it "should update correctly" do
            visit edit_author_path(alan)
            page.fill_in 'author[first_name]', with: 'Alania'
            find('input[type="submit"]').click

            alan.reload
            expect(alan.first_name).to eq 'Alania'
        end
    end
end