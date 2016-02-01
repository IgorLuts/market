require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to :category }
  it { should have_many :comments }
  it { should have_many :product_tags }
  it { should have_many :tags }

  it { should validate_presence_of :category }
  it { should validate_presence_of :tags }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :image }
  it { should validate_presence_of :price }


end
