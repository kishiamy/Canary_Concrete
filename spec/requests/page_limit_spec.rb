require 'spec_helper'

describe "checking limit of main pages" do
  before do 
    @admin = FactoryGirl.create(:admin)
    7.times do |i|
      @page = FactoryGirl.create(:page)
    end
    login @admin
    visit pages_path
    click_on("New")
    fill_in "Title", :with => 8 
    click_on "Create page"
  end
  it 'count until 8' do
    page.should have_content("you can't create more main pages")
  end
end
