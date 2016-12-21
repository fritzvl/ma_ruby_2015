class ItemsController < ApplicationController
  def index
    @items = Item.all 
    @serialize_to_json = @items.to_json
    puts @serialize_to_json
    puts "#################################"
    @serialize_to_yaml = @items.to_yaml
    puts @serialize_to_yaml
  end

end
