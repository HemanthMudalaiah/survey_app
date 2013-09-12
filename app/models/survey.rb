class Survey < ActiveRecord::Base
  attr_accessible :name, :questions_attributes
  has_many :questions, :dependent => :destroy
  has_many :answers
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? } , :allow_destroy => true
  validates_presence_of :name
end
