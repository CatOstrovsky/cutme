class Link < ApplicationRecord

  def incrementView
    update click_count: click_count + 1
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
