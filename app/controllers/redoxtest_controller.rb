class RedoxtestController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @querystring = request.env["QUERY_STRING"]
    @challenge = @querystring[10..-1]
    @verification = request.headers["HTTP_VERIFICATION_TOKEN"]
    if @verification == 'blockcare'
      render plain: @challenge
    end
  end

  def create
    @jsonobj = request.params["Meta"]["DataModel"]
  end

  def redox

  end
end
