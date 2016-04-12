class Run < ActiveRecord::Base
  belongs_to :shoe
  belongs_to :runner
  
  validates :runner_id, presence: true
  validates :shoe_id, presence: true
  validates :run_date, presence: true
  validates :run_distance, presence: true
end