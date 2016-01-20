describe Item do
    # Basic validations
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:category_id) }
    # Associations
    it { should belong_to(:category) }
    it { should have_many(:users).through(:shopping_carts) }
end


describe Item do
  it "creates an item" do
    expect(Item.create(name: "Dog", description: "ugly", price: 20.0, category_id: 1)).to be_valid
  end
end

describe "responds to its methods" do
  let(:item){Item.create(name: "Dog", description: "ugly", price: 20.0, category_id: 1)}
  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(item).to respond_to(:talk) }
    end
    context "#method talk" do
      it { expect(item.talk).to eq("Woof") }
    end
  end
end








