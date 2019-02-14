class CutmeLib
  @@defaultRedirect = "/"


  def getFull(short, request, ismobile)
   @shortLinkObject = getLink short
   if @shortLinkObject
     @shortLinkObject.incrementView request.referer, ismobile
     @shortLinkObject.original
   else
     @@defaultRedirect
   end
  end


  def getLink(link_name)
    Link.find_by(short: link_name, active: true)
  end
end
