require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many :shopping_cart_items }

  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :adress }
  it { should validate_presence_of :phone }

end
