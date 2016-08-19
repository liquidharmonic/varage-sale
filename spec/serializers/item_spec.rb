require "rails_helper"

describe ItemSerializer do
  describe '#to_json' do

    let(:item) { FactoryGirl.create(:item) }
    
    context 'item is banned' do
      let(:item) { FactoryGirl.create(:item, :banned) }
      it 'should not display published date or sellers name' do
        item_serialzer = ItemSerializer.new(item)
        expect(item_serialzer.published_date).to eql nil
        expect(item_serialzer.seller_name).to eql nil
      end
    end
    context 'item is not banned' do
      it 'should  display published date or sellers name' do
        item_serialzer = ItemSerializer.new(item)
        expect(item_serialzer.published_date).to be_present
        expect(item_serialzer.seller_name).to be_present
      end
    end

    it 'should convert price_in_cents to price in dollars' do
      item.update_attributes(price_in_cents: 50000)
      item_serialzer = ItemSerializer.new(item)
      expect(item_serialzer.price).to eql 500.00
    end
  end

end