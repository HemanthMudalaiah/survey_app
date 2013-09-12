class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :email, :survey_id
  belongs_to :question
  belongs_to :survey
  validates_presence_of :content
end
