require 'rails_helper'
RSpec.describe ApplicationController, type: :controller do
  let(:admin) { User.create!(username:"EggJon", email:"e@me.com", first_name:"egg", last_name:"jon", password_digest:"scrambled")}
  let(:non_admin) { User.create!(username:"Jon", email:"j@me.com", first_name:"jegg", last_name:"jjon", password_digest:"jon")}

  describe CategoriesController do
    describe "Test user authorization" do
      it "gives admin status to admin" do
        needs to be tested
      end
    end
  end
end


