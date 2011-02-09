class Task < ActiveRecord::Base
    attr_accessible :description, :user_id
    
    belongs_to :user
    has_many :entries
end
