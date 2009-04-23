class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates_presence_of  :title, :review
  validates_numericality_of :rating, :only_integer => true

  named_scope :approved,     lambda {|*args| {:conditions => "approved"}}   
  named_scope :not_approved, lambda {|*args| {:conditions => "not approved"}} 

end
