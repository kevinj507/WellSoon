require 'httparty'
require 'watson-api-client'
require 'uri'
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
    text = URI.encode(entry.diary)
    result = HTTParty.get("https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19&text=" + text, basic_auth: {username: '8c6b8182-d632-40c1-be29-1505163009f8', password: 'yhmdb5Z5vwOZ'})
    tones = result["document_tone"]["tone_categories"][0]["tones"]
    total = 0.0
    if Entry.last == nil
      entry.panger = 0.0
      entry.pdisgust = 0.0
      entry.pfear = 0.0
      entry.psadness = 0.0
      entry.pjoy = 0.0
    else
      entry.panger = Entry.last.anger
      entry.pdisgust = Entry.last.disgust
      entry.pfear = Entry.last.fear
      entry.psadness = Entry.last.sadness
      entry.pjoy = Entry.last.joy
    end

    tones.each do |t|
      if t["tone_id"] == "anger"
        entry.anger = t["score"]
        total = total + entry.anger
      elsif t["tone_id"] == "disgust"
        entry.disgust = t["score"]
        total = total + entry.disgust
      elsif t["tone_id"] == "fear"
        entry.fear = t["score"]
        total = total + entry.fear
      elsif t["tone_id"] == "joy"
        entry.joy = t["score"]
        total = total + entry.joy
      elsif t["tone_id"] == "sadness"
        entry.sadness = t["score"]
        total = total + entry.sadness
      end
    end
    entry.anger = (entry.anger / total) * 100
    entry.fear = (entry.fear / total) * 100
    entry.sadness = (entry.sadness / total) * 100
    entry.joy = (entry.joy / total) * 100
    entry.disgust = (entry.disgust / total) * 100
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
