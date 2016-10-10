class Goal < ActiveRecord::Base
  validates :title, :details, :user_id, presence: true
  belongs_to :user
end
