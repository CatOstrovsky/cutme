class Link < ApplicationRecord
  has_many :clicks, dependent: :destroy

  def incrementView(referer, ismobile)
    self.clicks.create(refer: referer, device_type: ismobile ? "mobile" : "pc")
  end

  before_create do
    self.short = generateUniqueShort
  end

  private
  def generateUniqueShort
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    (0...15).map { o[rand(o.length)] }.join
  end
end
