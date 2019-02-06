require 'CutmeLib'

class CutmeController < ApplicationController
  @@lib = CutmeLib.new

  def index
    @short = params[:short]
    @full =  @@lib.getFull @short

    redirect_to @full
  end

end
