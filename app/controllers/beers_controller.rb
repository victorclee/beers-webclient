class BeersController < ApplicationController
  def index
    # @beers = Unirest.get("#{ENV["API_HOST"]}/api/v2/beers.json").body
    @beers = []
    Unirest.get("#{ENV["API_HOST"]}/api/v2/beers.json").body.each do |beer_hash|
      @beers << Beer.new(beer_hash)
    end

  end
  def show
    @beer = Unirest.get("#{ENV["API_HOST"]}/api/v2/beers/#{params[:id]}.json").body
  end
  def new
    
  end
  def create
    beer = Unirest.post(
                            "#{ENV["API_HOST"]}/api/v2/beers/#{params[:id]}.json",
                            headers: {
                                      "Accept" => "application/json"
                                      },
                            parameters: {
                                          name: params[:name],
                                          style: params[:style],
                                          alcohol: params[:alcohol]
                                          }
                            ).body
    redirect_to "/beers/#{beer["id"]}"
  end

end
