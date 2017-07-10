class RedoxtestController < ApplicationController

  def index
    head :ok
    @querystring = request.env["QUERY_STRING"]
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
