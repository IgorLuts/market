require 'rails_helper'

RSpec.describe Visitor, type: :model do
  it { should validate_presence_of :email }
  it { should allow_value('user@example.com').for(:email ) }
end