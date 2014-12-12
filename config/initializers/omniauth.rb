Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1501983380090676'], ENV['4ba1d21073a3330a54374466484937de'],
    scope: 'public_profile', display: 'page', image_size: 'square'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['R1t4dMw8f8p9VKAguAWXDM1UV'], ENV['i5WRY9IGKIgfPGadNpbKdPF46vTsGoN0Zm6i2QsMC2Ca8hOMuL'], image_size: 'normal'
end
