class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients, :dependent => :destroy
  has_many :directions, :dependent => :destroy
  accepts_nested_attributes_for :ingredients,allow_destroy: true
  accepts_nested_attributes_for :directions,allow_destroy: true
  validates :title, :description, :image, presence: true
  has_attached_file :image, styles: { medium: "500x500#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
