class Task < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :user, optional: true
    belongs_to :board
end
