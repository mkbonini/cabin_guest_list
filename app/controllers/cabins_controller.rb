class CabinsController < ApplicationController
    def index
        @cabins = Cabin.newest_first #all.order("created_at DESC") # move the logic to model
    end

    def show
        @cabin = Cabin.find(params[:id])
        #@count = @cabin.guests.count # move this to model
    end
end