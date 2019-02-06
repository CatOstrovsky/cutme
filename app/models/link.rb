class Link < ApplicationRecord

  def incrementView
    update click_count: click_count + 1
  end

end
