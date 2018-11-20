class ItemsController < ApplicationController
    before_action :find_items, only: [:show, :edit, :update, :destroy]
    
    def index
        @item = Item.all.order(:position)
    end

    def sort
        params[:item].each_with_index do |id, index|
            Item.where(id: id).update_all(position: index + 1)
        end

        head :ok
    end

    def show 
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)

        if @item.save
            redirect_to @item, notice: 'Successfully created new item'
        else
            render 'new'
        end
    end

    def edit 
    end

    def update 
        if @item.update(item_params)
            redirect_to @item
        else
            render 'edit'
        end
    end

    def destroy 
        @item.destroy
        redirect_to root_path, notice: 'Successfully deleted item'
    end

    private

    def item_params
        params.require(:item).permit(:title, strains_attributes: [:id, :name, :price, :thc, :cbd, :genotype, :_destroy])
    end


    def find_items
        @item = Item.find(params[:id])
    end
end
