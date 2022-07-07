class CabinsController < ApplicationController
    def index
        @cabins = Cabin.all.order("created_at DESC")
    end

    def show
        @cabin = Cabin.find(params[:id])
        # @count = Cabin.guests.count
    end
end