
class Album < ActiveRecord::Base
  has_and_belongs_to_many :photos
  validates :title, presence: true



  
  # Takes hash of from input fields and
  # returns an array of Album objects
  def self.get_albums_to_add(params)
    results_as_objects = []
    x = 0
    
    while x <= params.keys.length do
      if /album/.match(params.keys[x])
        results_as_objects << self.find(params.values[x].to_i)
      end
      x+=1
    end
    return results_as_objects    
  end

end