class Employee < ApplicationRecord
	 validates :name, presence:true, uniqueness:true
	 validates :willing_to_relocate, absence:true, on: :create
  belongs_to :city , optional: :true
  has_many :subordinates, class_name: "Employee",foreign_key: "manager_id"
 
  belongs_to :manager, class_name: "Employee", optional: :true
 has_attached_file :photo, :styles => { small: "300x300>", thumb: "100x100>" }
 validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
