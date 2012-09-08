Devise.setup do |config|
  require 'devise/orm/active_record'
  require 'openid/store/filesystem'

  config.omniauth :open_id, :name => 'google', :identifier => 'http://www.google.com/accounts/o8/id'
end
