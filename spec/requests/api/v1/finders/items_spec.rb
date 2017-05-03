require 'rails_helper'

describe "Items API" do

  let(:date) {"2014-03-27T14:54:02.000Z"}

  context "find by" do
    let!(:item_1) { create(:item) }
    let!(:item_2) { create(:item, unit_price: 3544)}

    it "id" do
      id = item_1.id

      get '/api/v1/items/find', params:{ id: id }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_1.id
      expect(item['name']).to eq item_1.name
    end

    it "name" do
      name = item_1.name

      get '/api/v1/items/find', params:{ name: name }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_1.id
      expect(item['name']).to eq item_1.name

    end

    it "description" do
      description = item_2.description

      get '/api/v1/items/find', params:{ description: description }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_2.id
      expect(item['description']).to eq item_2.description
    end

    it "unit_price" do
      unit_price = item_2.unit_price / 100.to_f

      get '/api/v1/items/find', params:{ unit_price: unit_price }

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_2.id
      expect(item['price']).to eq (unit_price).to_s
    end

    xit "created_at" do
      created_at = item_1.created_at

      get '/api/v1/items/find', params:{ created_at: created_at }
      # byebug
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_1.id
      expect(item['created_at']).to eq item_1.created_at
    end
    xit "updated_at"

    it "merchant_id" do
      merchant_id = item_1.merchant_id

      get '/api/v1/items/find', params:{ merchant_id: merchant_id }
      # byebug
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_1.id
      expect(item['merchant_id']).to eq item_1.merchant_id
    end
  end
end
