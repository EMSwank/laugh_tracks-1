class Comedian < ActiveRecord::Base
  validates :name, presence: true
  validates :age, presence: true
  has_many :specials

  def self.average_age
    average(:age)
  end

  def total_specials
    specials.length
  end
  

end
