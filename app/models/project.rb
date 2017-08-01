class Project < ApplicationRecord 
validates :name, presence: true, uniqueness: true
validates :summary, presence: true
validates :start_date, presence: true 
validates :end_date, presence: true

validate :start_date_cannot_be_in_the_past
validate :end_date_must_be_after_start_date

 def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

def end_date_must_be_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end
