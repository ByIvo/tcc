class Alternative < ActiveRecord::Base
  belongs_to :question

  def to_s
  	"#{title}"
  end
end
