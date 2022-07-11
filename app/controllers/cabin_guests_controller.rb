class CabinGuestsController < ApplicationController
    def index
        @cabin = Cabin.find(params[:id])
        #@guests = @cabin.guests # remove this from here and call in view
    end
end