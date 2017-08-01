class CreateTasks < ActiveRecord::Migration[5.1]
  
def change
    
create_table :tasks do |t|
      
t.string :title
      
t.text :description

t.string :project_name    
t.string :implementer 
t.string :status

   
t.timestamps
    

end
  
end

end
