class DurationToFloat < ActiveRecord::Migration
  def self.up
    change_column :entries, :duration, :float
  end

  def self.down
    change_column :entries, :duration, :integer
  end
end
