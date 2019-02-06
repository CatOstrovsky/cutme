class CutmeLib
  @@defaultRedirect = "/"

  def getFull(short)
   @shortLinkObject = Link.find_by(short: short, active: true)
   if @shortLinkObject
     @shortLinkObject.incrementView()
     @shortLinkObject.original
   else
     @@defaultRedirect
   end
  end


end
