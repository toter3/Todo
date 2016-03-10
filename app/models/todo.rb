class Todo < ActiveRecord::Base
    
    scope :getall, lambda{ order("todos.updated_at DESC")}
    
    scope :search, lambda{|query|
        where(["header LIKE ?","%#{query}%"])}
    
end
