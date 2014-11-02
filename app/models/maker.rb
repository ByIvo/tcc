class Maker < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  belongs_to :division

  validates_uniqueness_of :identifier;
end
