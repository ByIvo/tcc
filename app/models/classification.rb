class Classification < ActiveRecord::Base
  belongs_to :father, class_name: "classification", foreign_key: "father_id"
end
