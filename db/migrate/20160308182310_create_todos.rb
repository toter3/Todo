class CreateTodos < ActiveRecord::Migration
  def up
    create_table :todos do |t|
        
        t.string "header", :limit => 25, :null => false
        t.text "content", :limit => 250
        t.boolean "done", :default => false, :null => false
     
      t.timestamps
    end
  end
  
    def down
        drop_table :todos
    end
end
