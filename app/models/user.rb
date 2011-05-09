class User < ActiveRecord::Base
  validates_presence_of :name, :openid_url
  validates_uniqueness_of :openid_url
  
  def self.auth(identity_url)
    self.find_by_openid_url(identity_url)
  end
end
