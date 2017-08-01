class Task < ApplicationRecord
validates :title, uniqueness: true,
presence: true
validates :description, presence: true
end
