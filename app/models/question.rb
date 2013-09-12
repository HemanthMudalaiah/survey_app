class Question < ActiveRecord::Base
  attr_accessible :content, :mandatory, :qtype, :survey_id, :answers_attributes, :options_attributes
  serialize :content
  belongs_to :survey
  has_many :answers
  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :options, :allow_destroy => true
  validates_presence_of :content
  validates_presence_of :qtype
  #has_many :responses, :through => :answers
end
