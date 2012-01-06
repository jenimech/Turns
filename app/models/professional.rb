class Professional < ActiveRecord::Base
  has_one :profile, :as => :user, :dependent => :destroy
  has_many :turns, :dependent => :destroy
  accepts_nested_attributes_for :profile

  def full_name
    profile.full_name
  end
end
