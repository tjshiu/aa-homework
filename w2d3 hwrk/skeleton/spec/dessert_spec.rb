require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  let(:chef) { double("chef", name: "tiff") }
  let(:brownie) {Dessert.new("brownie", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    context 'none-integer quantity given' do
      subject(:brownie) {Dessert.new("brownie", "a ton", chef)}
      it "raises an argument error when given a non-integer quantity" do
        expect {brownie.quantity}.to raise_error(ArgumentError)
      end
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("coffee")
      expect(brownie.ingredients).to include('coffee')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      brownie.add_ingredient(1)
      brownie.add_ingredient(2)
      brownie.add_ingredient(3)
      brownie.add_ingredient(4)
      brownie.add_ingredient(5)
      expect(brownie.mix!).to_not eq([1, 2, 3, 4, 5])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(1)
      expect(brownie.quantity).to eq(9)
    end

    it "raises an error if the amount is greater than the quantity" do
      # brownie.eat(20)
      expect { brownie.eat(20) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tiff the Great Baker")
      expect(brownie.serve).to eq("Chef Tiff the Great Baker has made 10 brownies!")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
