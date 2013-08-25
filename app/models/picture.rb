class Picture < ActiveRecord::Base
  attr_accessible :image, :book_id

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }

  belongs_to :image, polymorphic: true
end