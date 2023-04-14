class CatsController < ApplicationController

    def index
        # @cats = Cat.all(params[:id])

    render json: {cat: "2"}
    end

end