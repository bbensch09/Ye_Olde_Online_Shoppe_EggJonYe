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
  describe "show action" do

    before do
      @all_items = 3.times.map do |n|
        Item.create(name: "Dog #{n}", description: "ugly", price: 20.0, category_id: 1)
      end
    end

    it 'should load item' do
      get :show
      expect(assigns[:items]).to eq @all_items
      expect(response.status).to eq 200
      expect(response).to have_rendered(:index)
    end
  end
end
