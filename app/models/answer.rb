class Answer < ApplicationRecord
  belongs_to :question
  validates :name,presence: true
  validates :content,presence: true,length: { minimum:5 }
end
