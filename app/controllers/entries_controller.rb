class EntriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @test = 'hello'
  end
end
