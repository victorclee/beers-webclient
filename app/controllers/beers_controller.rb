class BeersController < ApplicationController
  def index
    @beers = Unirest.get("localhost:3000/api/v2/beers.json").body
  end
  def show
    @beer = Unirest.get("localhost:3000/api/v2/beers/#{params[:id]}.json").body
  end
  def new
    
  end
  def create
    beer = Unirest.post(
                            "localhost:3000/api/v2/beers.json?name=#{params[:name]}&style=#{params[:style]}&alcohol=#{params[:alcohol]}",
                            headers: {
                                      "Accept" => "application/json"
                                      }
                            ).body
    redirect_to "/beers/#{beer["id"]}"
  end

end
