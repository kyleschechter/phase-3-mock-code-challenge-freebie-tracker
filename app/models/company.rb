class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item, value)
    Freebie.create(
      item_name: item,
      value: value, 
      company_id: self.id, 
      dev_id: dev.id
      )
  end

  def self.oldest_company
    self.all.order(:founding_year)[0]
  end
end
