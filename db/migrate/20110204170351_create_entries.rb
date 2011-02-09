class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.date :begin
      t.integer :duration

      t.timestamps
    end
    
    remove_column :tasks, :begin
    remove_column :tasks, :duration
  end

  def self.down
    add_column :tasks, :begin, :date
    add_column :tasks, :duration, :integer
  
    drop_table :entries
  end
end
