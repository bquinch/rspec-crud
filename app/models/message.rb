class Message < ApplicationRecord
  MAILREGEX = /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/
  validates :subject, :content, :from, :name, presence: true
  validates :from, format: { with: MAILREGEX }
end
