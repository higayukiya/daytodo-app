class Task < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :user, optional: true
    belongs_to :board
    has_many :comments, dependent: :destroy
end
