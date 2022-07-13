class CabinsController < ApplicationController
    def index
        @cabins = Cabin.newest_first
    end

    def show
        @cabin = Cabin.find(params[:id])
    end

    def new
    end

    def create
        cabin = Cabin.create(cabin_params)
        redirect_to "/cabins"
    end

    def edit
        @cabin = Cabin.find(params[:id])
    end

    def update
        cabin = Cabin.find(params[:id])
        cabin.update(cabin_params)
        redirect_to "/cabins/#{cabin.id}"
    end

    def destroy
        cabin = Cabin.find(params[:id])
        cabin.destroy
        redirect_to "/cabins"
    end
    private
    def cabin_params
        params.permit(:title, :co_ed, :max_guest_count)
    end
end