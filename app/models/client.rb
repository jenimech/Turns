class Client < ActiveRecord::Base
  has_one :profile, :as => :user, :dependent => :destroy
  accepts_nested_attributes_for :profile
end
