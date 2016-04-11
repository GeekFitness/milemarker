class Run < ActiveRecord::Base
  validates :runner_id, presence: true
  validates :shoe_id, presence: true
  validates :run_date, presence: true
  validates :miles, presence: true
end