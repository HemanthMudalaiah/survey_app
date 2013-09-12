class Option < ActiveRecord::Base
  attr_accessible :option, :question_id
  belongs_to :question
end
