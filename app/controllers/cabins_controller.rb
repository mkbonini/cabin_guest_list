class CabinsController < ApplicationController
    def index
        @cabins = Cabin.all
    end

    def show
        @cabin = Cabin.find(params[:id])
    end
end