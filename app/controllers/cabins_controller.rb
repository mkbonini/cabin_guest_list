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

    private
    def cabin_params
        params.permit(:title, :co_ed, :max_guest_count)
    end

end