require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "237704172943849", "08b5035de2dd95a1d35de860d47e5b39"
end

