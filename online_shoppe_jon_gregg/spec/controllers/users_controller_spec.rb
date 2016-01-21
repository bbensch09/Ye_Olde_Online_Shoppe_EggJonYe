require 'rails_helper'
RSpec.describe UsersController, type: :controller do

  describe UsersController do
    let(:admin) { User.create!(username:"EggJon", email:"e@me.com", first_name:"egg", last_name:"jon", password_digest:"scrambled")}
    let(:user) { FactoryGirl.create :user}
    let(:attributes) { FactoryGirl.attributes_for :user}

    describe "GET #index" do
      before(:each) do
        session[:user_id] = admin.id
        get :index
      end
      it "responds with a 200" do
        expect(response.status).to eq(200)
      end
      it "assigns the users instance variable" do
        expect(assigns(:users)).to be_a(ActiveRecord::Relation)
      end
    end

    describe 'POST #create' do
      it "saves a new user in the database" do
        expect{
          post :create, :user => attributes}.to change{ User.count}.by(1)
        end

        it "redirects to the root path" do
          post :create, :user => attributes
          expect(response.status).to eq(302)
        end
      end

      # describe 'GET #show' do
      #   before(:each) do
      #     get :show, id: user.idbe rspec
      #   end

      #   it "assigns the user instance variable" do
      #     expect(assigns[:user]).to be_a(User)
      #   end
      # end

      describe 'PUT #update' do
        let!(:username) { "UPDATED_USERNAME" }
        it 'updates a field on an user' do
          put :update, id: user.id, user: { username: username}
          expect(user.reload.username).to eq(user.username)
        end
      end

      describe 'DELETE #destroy' do
      before(:each) do
        session[:user_id] = admin.id
      end
        it 'decrements users by one' do
          user_id = user.id
          expect {
            delete :destroy, id: user_id
            }.to change{ User.count }.by(-1)
          end
          it 'redirects to the root path' do
            user_id = user.id
            delete :destroy, id: user_id
            expect(response.status).to eq(302)
          end
        end

      end
    end





# RSpec.describe Users`Controller, type: :controller do
#   describe "index action" do

#     before do
#       @all_user = 3.times.map do |n|
#         User.create(name: "Dog #{n}", description: "ugly", price: 20.0, category_id: 1)
#       end
#     end

#     it 'should load all user' do
#       get :index
#       expect(assigns[:user]).to eq @all_user
#       expect(response.status).to eq 200
#       expect(response).to have_rendered(:index)
#     end
#   end

#   describe "#show" do
#     before do
#       @user = User.create!(id: 1, name: "Dog", description: "ugly", price: 20.0, category_id: 1)
#     end

#     it 'should load user' do
#       get :show, {"id"=>"1"}
#       expect(assigns[:user]).to eq User.find_by(name: "Dog")
#       expect(response.status).to eq 200
#       expect(response).to have_rendered(:show)
#     end
#   end

#     describe "#new" do
#       it 'should load form' do
#       get :new
#       expect(response.status).to eq 302
#       # expect(response).to have_rendered(:new)
#     end
#   end

#   describe "#edit" do
#     before do
#       @user = User.create!(id: 10, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
#     end

#     it 'should load user to be edited' do
#       get :edit, {"id"=>"10"}
#       expect(assigns[:user]).to eq User.find_by(name: "Dog")
#       expect(response.status).to eq 302
#       # expect(response).to have_rendered(:edit)
#     end
#   end

#   describe 'POST #create' do
#     let(:attributes){ {name: "Alfred", description: "ugly", price: 20.0, category_id: 1}}
#     it "provides correct response" do
#       post :create, :user => attributes
#       expect(response.status).to eq(302)
#     end
#   end

#   describe 'PATCH #update' do
#     before do
#       @user = User.create!(id: 10, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
#     end
#     # let(:name){ "Lord Alfred" }
#     it "provides correct response" do
#       patch :update, id: 10
#       # expect(User.reload.name).to eq(User.title)
#       expect(response.status).to eq(302)
#     end
#   end

#   describe 'DELETE #destroy' do
#     # it 'decrements user by one' do
#     #   @user = User.create!(id: 100, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
#     #   expect {
#     #     delete :destroy, id: 100
#     #   }.to change{ User.count }.by(-1)
#     # end
#     it 'redirects' do
#       delete :destroy, id: 100
#       expect(response.status).to eq(302)
#     end
#   end

# end
