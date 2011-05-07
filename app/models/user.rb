class User < ActiveRecord::Base
  validates_presence_of :name, :openid_url
  validates_uniqueness_of :openid_url
end
