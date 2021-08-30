class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item)
    self.freebies.any? {|free| free.item_name == item}
  end

  def give_away(dev, freebie)
    freebie.dev == self ? freebie.update(dev: dev) : puts "That's not yours to give away pal"
  end
end
