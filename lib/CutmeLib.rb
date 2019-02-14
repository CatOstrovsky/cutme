class CutmeLib
  @@defaultRedirect = "/"

  def getFull(short, request)
   @shortLinkObject = Link.find_by(short: short, active: true)
   if @shortLinkObject
     @shortLinkObject.incrementView request.referer
     @shortLinkObject.original
   else
     @@defaultRedirect
   end
  end


end
