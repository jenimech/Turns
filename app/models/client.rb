class Client < ActiveRecord::Base
  has_one :profile, :as => :user
  accepts_nested_attributes_for :profile
end
