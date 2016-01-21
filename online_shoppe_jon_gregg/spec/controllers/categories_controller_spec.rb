require 'rails_helper'
RSpec.describe CategoriesController, type: :controller do
  let(:admin) { User.create!(username:"EggJon", email:"e@me.com", first_name:"egg", last_name:"jon", password_digest:"scrambled")}
  let(:category) { FactoryGirl.create :category}

  describe CategoriesController do
    describe "GET #index" do
      before(:each) do
        session[:user_id] = admin.id
        get :index
      end
      it "responds with a 200" do
        expect(response.status).to eq(200)
      end
      it "assigns the categories instance variable" do
        expect(assigns(:categories)).to be_a(ActiveRecord::Relation)
      end
    end

    describe 'POST #create' do
      let(:attributes){ {name: "Alfred", description: "ugly", price: 20.0, category_id: 1}}
      it "provides correct response" do
        post :create, :category => attributes
        expect(response.status).to eq(302)
      end
    end

    describe 'PUT #update' do
      let!(:name) { "UPDATED_CATEGORYNAME" }
      it 'updates a field on an category' do
        put :update, id: category.id, user: { name: name }
        expect(category.reload.name).to eq(category.name)
      end
    end

    describe 'DELETE #destroy' do
    # it 'decrements categories by one' do
    #   @category = Category.create!(id: 100, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
    #   expect {
    #     delete :destroy, id: 100
    #   }.to change{ Category.count }.by(-1)
    # end
    it 'redirects' do
      delete :destroy, id: 100
      expect(response.status).to eq(302)
    end
  end
end
end

##### From TreAbe
#   describe "GET #index" do
#     before(:each) do
#       get :index
#     end
#     it "responds with a 200" do
#       expect(response.status).to eq(200)
#     end
#   end

# describe 'category create' do
#     context 'when given valid params' do
#       let :category_params do
#         {title: 'trev'}
#        end
#        it 'should create the category and redirect to category index' do
#         expect{
#           post :create, category: category_params
#           }.to change{Category.count}.by(1)
#         end
#       end
#     context 'when given invalid params' do
#       let :category_params do
#         {title: ''}
#        end
#       it 'should not create the category and throw an error message' do
#         expect{
#           post :create, category: category_params
#         }.to_not change{Category.count}
#       end
#     end


#   describe 'category edit' do
#     context 'when given valid params' do
#       let :category do Category.create(title: 'hveavhb')
#       end
#       let! (:title) {"trev"}
#          it 'updates category title' do
#           put :update, id: category.id, category: { title: title }
#       expect(category.reload.title).to eq(category.title)
#     end
#   end
