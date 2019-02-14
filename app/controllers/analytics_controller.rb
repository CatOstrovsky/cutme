require 'CutmeLib'

class AnalyticsController < ApplicationController
  @@lib = CutmeLib.new

  def index
    @link = @@lib.getLink params[:link_id]
  end

end
