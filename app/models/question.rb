class Question < ActiveRecord::Base
  has_many :alternatives, dependent: :destroy
  belongs_to :classification
  def to_s
  	"#{id}"
  end
end
