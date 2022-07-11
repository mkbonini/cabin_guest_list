class CabinGuestsController < ApplicationController
    def index
        @cabin = Cabin.find(params[:id])
        #@guests = @cabin.guests # remove this from here and call in view
    end

    def new
        @cabin = Cabin.find(params[:id])
    end

    def create
        cabin = Cabin.find(params[:id])
        guest = cabin.guests.create(guest_params)
        redirect_to "/cabins/#{cabin.id}/guests"
    end

    private
    def guest_params
        params.permit(:first_name, :last_name, :invite, :plus_ones)
    end
end