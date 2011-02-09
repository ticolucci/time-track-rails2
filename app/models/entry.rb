class Entry < ActiveRecord::Base
  belongs_to :task
  
  before_create :validate_begin_date_to_sum
  
  def validate_begin_date_to_sum
    entries_from_same_user = Entry.find_all_by_task_id self.task_id
    entry_with_same_begin = entries_from_same_user.detect {|e| e.begin == self.begin}
    if entry_with_same_begin
      self.duration += entry_with_same_begin.duration
      entry_with_same_begin.destroy
    end
  end
  
  def <=> other
    self.begin <=> other.begin
  end
end
