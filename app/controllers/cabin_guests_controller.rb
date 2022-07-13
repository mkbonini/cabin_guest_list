class CabinGuestsController < ApplicationController
    def index
        @cabin = Cabin.find(params[:id])

        if params[:sorted] == 'true'
            @guests = @cabin.sort_guests
        elsif params[:plus_one_count] != nil && params[:plus_one_count].to_i > 0
            @guests = @cabin.get_guest_list(params[:plus_one_count].to_i)
        else
            @guests = @cabin.guests
        end
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