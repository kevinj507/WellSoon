class EntriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries = current_user.entries
  end

  def new
    @entry = Entry.new
    @entry.confirmed = "no"
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.pain != nil && @entry.diary != nil && @entry.activity != nil && @entry.doses != nil
      @entry.confirmed = "yes"
    end
    if @entry.confirmed = "yes"
      current_user.entries << @entry
      current_user.entries.save
    end
    binding.pry
    redirect_to '/entries'
  end

  def remove
    Entry.destroy(params[:id])
    redirect_to '/entries'
  end

  def show
  end

  def progress
  end

  private
    def entry_params
      params.require(:entry).permit(:id, :pain, :diary, :activity, :doses, :medtype, :user_id, :created_at, :confirmed)
    end
end
