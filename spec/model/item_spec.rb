require "rails_helper"

describe Item, :type => :model do
  describe 'validation' do
    subject { FactoryGirl.build(:item) }

    it 'is valid if every attribute is valid' do
      expect(subject).to be_valid
    end
    it 'is invalid if seller dne' do
      subject.seller = nil
      expect(subject).to be_invalid
    end
    it 'is invalid if category dne' do
      subject.category = nil
      expect(subject).to be_invalid
    end
    it 'is invalid if status is not restricted value' do
      subject.status = 'random'
      expect(subject).to be_invalid
    end
  end

end