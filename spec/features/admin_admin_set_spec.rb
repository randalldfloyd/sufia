require 'spec_helper'

RSpec.describe "The admin sets, through the admin dashboard" do
  let(:user) { create :admin }

  before do
    create(:admin_set, title: ["A completely unique name"],
                       description: ["A substantial description"])
  end

  scenario do
    sign_in user
    visit '/admin'
    click_link "Administrative Sets"

    expect(page).to have_link "Create new administrative set"

    click_link "A completely unique name"

    expect(page).to have_content "A substantial description"
    expect(page).to have_content "Works in This Set"
  end
end
