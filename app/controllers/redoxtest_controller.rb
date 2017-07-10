class RedoxtestController < ApplicationController

  def index
    puts 'hit index controller'
    head :ok
    @querystring = request.env["QUERY_STRING"]
    @challenge = @querystring[10..-1]
    @verification = request.headers["HTTP_VERIFICATION_TOKEN"]
    if @verification == 'blockcare'
      render plain: @querystring
    end
  end

  def create
    render plain: 'curl post request'
  end

  def redox

  end
end
