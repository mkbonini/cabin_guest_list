class GuestsController < ApplicationController
    def index
        @guests = Guest.invite_only
    end

    def show
        @guest = Guest.find(params[:id])
    end

    def edit
        @guest = Guest.find(params[:id])
    end

    def update
        guest = Guest.find(params[:id])
        guest.update(guest_params)
        redirect_to "/guests/#{guest.id}"
    end

    private
    def guest_params
        params.permit(:first_name, :last_name, :invite, :plus_ones)
    end
end