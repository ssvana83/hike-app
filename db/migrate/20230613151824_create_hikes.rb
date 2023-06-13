class CreateHikes < ActiveRecord::Migration[5.2]

    def change
      create_table :hikes do |t|
        t.string :name
        t.integer :length
        t.integer :difficulty_level
        t.integer :estimated_time
        t.belongs_to :state
        # this creates integer column automatically, this will also index right away
  
        t.timestamps
      end
    end

end
