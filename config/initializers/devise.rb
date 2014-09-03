Devise.setup do |config|
  require 'devise/orm/active_record'
  require 'openid/store/filesystem'

  config.omniauth :open_id, :name => 'google', :identifier => 'http://www.google.com/accounts/o8/id'
  config.secret_key = ENV['DEVISE_SECRET_KEY'] || '5e33c132ef77dbcdaf47153e7194ac51dd53b3adc8165221c35f1581902430f06b6ef3c92a733e0cc9ecf26818d6c110e2ae6eaaa3d43f0660786e9569ffaed8'
end
