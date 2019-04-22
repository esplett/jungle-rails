require 'rails_helper'

RSpec.describe Product, type: :model do

  it "is valid with valid attributes" do
    @category = Category.new
    @category.name = 'Electronics'
    @category.save
    @product = Product.new
    @product.name = 'Mouse'
    @product.price = 4.99
    @product.quantity = 6
    @product.category_id = @category.id
    expect(@product).to be_valid
  end 

  describe 'Validations' do
    it 'is not valid without a name' do
      @category = Category.new
      @category.name = 'Electronics'
      @category.save!
      @product = Product.new
      @product.name = nil
      @product.price = 4.99
      @product.quantity = 6
      @product.category_id = @category.id
      expect(@product).to_not be_valid
    end
    it 'is not valid without a price' do
      @category = Category.new
      @category.name = 'Electronics'
      @category.save!
      @product = Product.new
      @product.price = nil
      @product.name = 'Mouse'
      @product.quantity = 6
      @product.category_id = @category.id
      expect(@product).to_not be_valid
    end
    it 'is not valid without a quantity' do
      @category = Category.new
      @category.name = 'Electronics'
      @category.save!
      @product = Product.new
      @product.quantity = nil
      @product.price = 4.99
      @product.name = 'Mouse'
      @product.category_id = @category.id
      expect(@product).to_not be_valid
    end
    it 'is not valid without a category' do
      @product = Product.new
      expect(@product).to_not be_valid
    end

    it 'Category is valid and will save' do
      @category = Category.new
      @category.name = 'Electronics'
      @category.save
      expect(@category).to be_valid
    end 
  end

end


 
