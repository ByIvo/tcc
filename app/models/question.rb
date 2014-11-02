class Question < ActiveRecord::Base
  has_many :alternatives
  belongs_to :classification
  def to_s
  	"#{id}"
  end
end
