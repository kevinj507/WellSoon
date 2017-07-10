class RedoxtestController < ApplicationController

  def index
    @querystring = request.env["QUERY_STRING"]
    @challenge = @querystring[10..-1]
    @verification = request.headers["HTTP_VERIFICATION_TOKEN"]
    if @verification == 'blockcare'
      render plain: @challenge
    end
  end

  def create
    render plain: 'curl post request'
  end

  def redox

  end
end
