class Event < ApplicationRecord
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :notes
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :mileage
  validates_presence_of :income
end
