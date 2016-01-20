require 'rails_helper'

describe "the category views for any user", :type => :feature do
  let!(:category) {FactoryGirl.create :category}

  context "category information" do
    it "shows a category list view with all categories" do
      visit categories_path
      expect(page).to have_content(category.name)
    end

    it "shows the category page for a particular category" do
      visit categories_path(category)
      expect(page).to have_content(category.name)
    end
  end
end

describe "category creation/update/delete functionality for admins" do
  let!(:category) {FactoryGirl.create :category}
  let!(:admin) {FactoryGirl.create :admin}
  before(:each) do
    visit new_user_session_path
    fill_in 'user_email', :with => admin.email
    fill_in 'user_password', :with => admin.password
    click_button 'Log in'
  end

  context "category creation" do
    it "creates a new category" do
      visit new_category_path
      fill_in 'category[name]', with: category.name
      click_on 'Create or Update Category'
      expect(page).to have_content category.name
    end
  end

  describe "category update" do
    before(:each) do
      visit edit_category_path(category)
    end
    it "updates an existing category" do
      new_name = "Kitchenware"
      fill_in 'category[name]', with: new_name
      click_on 'Create or Update Category'
      expect(page).to have_content new_name
    end
  end

  describe "category deletion" do
    before(:each) do
      visit edit_category_path(category)
    end
    it "has a button to delete the category" do
      click_on 'Destroy'
      expect(page).to_not have_content(category.name)
    end
  end


end
