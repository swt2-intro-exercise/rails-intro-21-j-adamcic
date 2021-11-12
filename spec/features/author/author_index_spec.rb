require 'rails_helper'

describe "Author page", type: :feature do
    it "should exists at 'authors_path'" do
        visit authors_path
        expect(page).to have_text 'Name'
        expect(page).to have_text 'Homepage'
    end

    context "with author named Alan Turing" do
        alan = FactoryBot.create :author
        it "should have links to new, show, edit and destroy" do
            visit authors_path
            expect(page).to have_link 'New', href: new_author_path
            expect(page).to have_link 'Show', href: author_path(alan)
            expect(page).to have_link 'Edit', href: edit_author_path(alan)
            expect(page).to have_selector(:css, "a[data-method='delete'][href='/authors/%d']" % [alan.id])
        end

        it "should destroy correctly" do
            visit authors_path
            author_count_before = Author.count
            delete_link = find(:css, "a[data-method='delete'][href='/authors/%d']" % [alan.id])
            delete_link.click
            author_count_after = Author.count
            expect(author_count_after).to eq(author_count_before-1)
        end
    end
end