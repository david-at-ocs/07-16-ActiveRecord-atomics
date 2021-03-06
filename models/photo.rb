
class Photo < ActiveRecord::Base  
  validates :title, presence: true
  belongs_to :photographer
  has_and_belongs_to_many :albums

  def top_photo?
    if self.albums.length > 1
      return true
    else
      return false
    end
  end
  
end