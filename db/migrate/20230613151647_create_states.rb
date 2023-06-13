class CreateStates < ActiveRecord::Migration[5.2]

  def change
    create_table :states do |t|
      t.string :statename
      t.string :townname

      t.timestamps
    end
  end

end


# Methods: #add_column, #add_index, #change_column, #change_table, #create_table, #drop_table, #remove_column, #remove_index, #rename_column

# Supported column types: :binary, :boolean, :date, :datetime, :decimal, :float, :integer, :string, :primary_key, :text, :timestamp, :time 
