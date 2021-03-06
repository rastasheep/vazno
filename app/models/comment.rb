class Comment < ActiveRecord::Base

  include AnalyticScopes

  has_ancestry

  belongs_to :news
  belongs_to :user

  attr_accessible :user, :content, :parent_id

  validates :content, :presence => true

end
