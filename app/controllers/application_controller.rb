class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    bakedGood = BakedGood.all.order("price DESC")
    #bakedGood.order(:price).to_json
    bakedGood.to_json
  end

  get '/baked_goods/most_expensive' do
    bakedGood = BakedGood.all.order("price DESC").first
    #bakedGood.order(:price).to_json
    bakedGood.to_json
  end

end
