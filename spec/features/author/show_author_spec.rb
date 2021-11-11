require 'rails_helper'

describe "Show author page", type: :feature do
    context "with author named Alan Turing" do
        alan = FactoryBot.create :author
        it "should exist and have correct text" do
            visit author_path(alan)
            expect(page).to have_text('Alan Turing')
        end
    end
end
