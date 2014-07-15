class Retwet < ActiveRecord::Base
  belongs_to :user
  belongs_to :twet

  validates :content, :presence => true, :length => { :minimum => 2, :maximum => 140 }
  validates :user, :presence => true
end