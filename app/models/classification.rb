class Classification < ActiveRecord::Base
  belongs_to :father, class_name: "Classification", foreign_key: "father_id"
end
