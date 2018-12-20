class Goal < ApplicationRecord

  belongs_to :user
  has_many :items

  validates :name, :goal_value, :unit_of_measure, presence: true

  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }

  validates :goal_value, numericality: { greater_than: 0 }

  validates :unit_of_measure, inclusion: { in: ['sets', '$', 'kg', 'km'] }

  accepts_nested_attributes_for :items

end
