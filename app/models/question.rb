class Question < ActiveRecord::Base
  has_many :alternatives

  def to_s
  	"#{id}"
  end
end
