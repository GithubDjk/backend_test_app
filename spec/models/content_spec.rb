# spec/models/content_spec.rb

require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'validations' do
    it 'validates the presence of title' do
      content = Content.new(body: 'Sample Body')
      expect(content).not_to be_valid
      expect(content.errors[:title]).to include("can't be blank")
    end

    it 'validates the presence of body' do
      content = Content.new(title: 'Sample Title')
      expect(content).not_to be_valid
      expect(content.errors[:body]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
