require 'httparty'
require 'watson-api-client'
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
    entry = Entry.new(entry_params)
    if entry.pain != nil && entry.diary != nil && entry.activity != nil && entry.doses != nil
      entry.confirmed = "yes"
    end
    if entry.confirmed = "yes"
      current_user.entries << entry
    end
    #analyze tone
    result = HTTParty.get("https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19&text=A%20word%20is%20dead%20when%20it%20is%20said,%20some%20say.%20Emily%20Dickinson", basic_auth: {username: '8c6b8182-d632-40c1-be29-1505163009f8', password: 'yhmdb5Z5vwOZ'})
    tones = result["document_tone"]["tone_categories"][0]["tones"]
    tones.each do |t|
      if t["tone_id"] == "anger"
        entry.anger = t["score"]
      elsif t["tone_id"] == "disgust"
        entry.disgust = t["score"]
      elsif t["tone_id"] == "fear"
        entry.fear = t["score"]
      elsif t["tone_id"] == "joy"
        entry.joy = t["score"]
      elsif t["tone_id"] == "sadness"
        entry.sadness = t["score"]
      end
    end
    entry.save
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
