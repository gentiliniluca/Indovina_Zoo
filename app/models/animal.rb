class Animal < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  has_attached_file :audio
  #                  :url => "/assets/:class/:id/:attachment/:style.:extension",
  #                  :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"

  has_many :questions

  validates :name, presence: true, numericality: false
  validates :avatar, presence: true
  validates :audio, presence: true

end
