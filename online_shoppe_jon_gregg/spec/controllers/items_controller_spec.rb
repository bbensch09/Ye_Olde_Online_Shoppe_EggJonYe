require 'rails_helper'
RSpec.describe ItemsController, type: :controller do
  describe "index action" do

    before do
      @all_items = 3.times.map do |n|
        Item.create(name: "Dog #{n}", description: "ugly", price: 20.0, category_id: 1)
      end
    end

    it 'should load all items' do
      get :index
      expect(assigns[:items]).to eq @all_items
      expect(response.status).to eq 200
      expect(response).to have_rendered(:index)
    end
  end

  describe "#show" do
    before do
      @item = Item.create!(id: 1, name: "Dog", description: "ugly", price: 20.0, category_id: 1)
    end

    it 'should load item' do
      get :show, {"id"=>"1"}
      expect(assigns[:item]).to eq Item.find_by(name: "Dog")
      expect(response.status).to eq 200
      expect(response).to have_rendered(:show)
    end
  end

    describe "#new" do
      it 'should load form' do
      get :new
      expect(response.status).to eq 302
      # expect(response).to have_rendered(:new)
    end
  end

  describe "#edit" do
    before do
      @item = Item.create!(id: 10, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
    end

    it 'should load item to be edited' do
      get :edit, {"id"=>"10"}
      expect(assigns[:item]).to eq Item.find_by(name: "Dog")
      # expect(response.status).to eq 200
      # expect(response).to have_rendered(:edit)
    end
  end

  describe 'POST #create' do
    let(:attributes){ {name: "Alfred", description: "ugly", price: 20.0, category_id: 1}}
    it "provides correct response" do
      post :create, :item => attributes
      expect(response.status).to eq(302)
    end
  end

  describe 'PATCH #update' do
    before do
      @item = Item.create!(id: 10, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
    end
    # let(:name){ "Lord Alfred" }
    it "provides correct response" do
      patch :update, id: 10
      # expect(item.reload.name).to eq(item.title)
      expect(response.status).to eq(302)
    end
  end

  describe 'DELETE #destroy' do
    # it 'decrements items by one' do
    #   @item = Item.create!(id: 100, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
    #   expect {
    #     delete :destroy, id: 100
    #   }.to change{ Item.count }.by(-1)
    # end
    it 'redirects' do
      delete :destroy, id: 100
      expect(response.status).to eq(302)
    end
  end

end
