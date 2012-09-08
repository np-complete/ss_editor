class User < ActiveRecord::Base
  devise :omniauthable

  validates_presence_of :name, :openid_url
  validates_uniqueness_of :openid_url

  has_many :stories
  has_many :faces

  def self.auth(identity_url)
    self.find_by_openid_url(identity_url)
  end
end
