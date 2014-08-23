class Story < ActiveRecord::Base
  belongs_to :person
  belongs_to :park
  validates :story, presence: true
end