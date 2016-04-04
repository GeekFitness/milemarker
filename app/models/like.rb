class Like < ActiveRecord::Base
  belongs_to :runner
  belongs_to :shoe
  
  validates_uniqueness_of :runner, scope: :shoe
end