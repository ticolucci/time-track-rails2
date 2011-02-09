class TasksEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :task_id, :integer
  end

  def self.down
    remove_column :entries, :task_id
  end
end
