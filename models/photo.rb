
class Photo < ActiveRecord::Base  
  validates :title, presence: true
  belongs_to :photographer
  has_and_belongs_to_many :albums

  def self.top_photo?(photo)
    if photo.albums.length > 1
      return true
    else
      return false
    end
  end
  
end