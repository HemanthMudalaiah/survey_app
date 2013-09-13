class EmailList < ActiveRecord::Base
  attr_accessible :email_id, :survey_id
  belongs_to :survey
end
