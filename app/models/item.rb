class Item < ApplicationRecord

  belongs_to :goal

  validates :item_value, presence: true, numericality: true

  scope :recent, -> { order(created_at: :desc).limit(5) }

  after_destroy :update_goal_current_value
  after_save :update_goal_current_value

  private

  def update_goal_current_value
    new_goal_value = goal.items.sum(:item_value)
    goal.update!(current_value: new_goal_value)
  end

end
