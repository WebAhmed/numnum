class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients,allow_destroy: true
  accepts_nested_attributes_for :directions,allow_destroy: true
  validates :title, :description, :image, presence: true
  has_attached_file :image, styles: { medium: "500x500#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
