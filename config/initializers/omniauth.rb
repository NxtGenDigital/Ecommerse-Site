OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '959141287443504', 'b428449ea0ed821e1981a927b054727f'
end