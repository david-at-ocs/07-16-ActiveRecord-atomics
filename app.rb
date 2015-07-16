require "pry"
require "active_record"
require "sqlite3"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'photo_manager.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/photographer.rb"
# require_relative "models/photograph.rb"
# require_relative "models/album.rb"

unless ActiveRecord::Base.connection.table_exists?(:photographers)
  ActiveRecord::Base.connection.create_table :photographers do |t|
    t.string :name
    t.integer :age
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:photos)
  ActiveRecord::Base.connection.create_table :photos do |t|
    t.string :title
    t.string :link
    t.integer :photographer_id
  end
end

# unless ActiveRecord::Base.connection.table_exists?(:albums)
#   ActiveRecord::Base.connection.create_table :albums do |t|
#     t.string :name
#   end
# end

binding.pry