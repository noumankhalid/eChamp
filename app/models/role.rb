class Role < ActiveRecord::Base
  has_many :roles_user
  has_many :users, :through => :roles_user
end
