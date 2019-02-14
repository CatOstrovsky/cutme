require 'CutmeLib'

class CutmeController < ApplicationController
  @@lib = CutmeLib.new


  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def index
    @short = params[:short]
    @full =  @@lib.getFull @short, request, mobile_device?
  end

end
