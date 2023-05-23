class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :task_type, presence: true
end
