class User < ActiveRecord::Base
  class << self
    def from_omniauth(auth)
      provider = auth.provider
      uid = auth.uid
      info = auth.info.symbolize_keys!
      user = User.find_or_initialize_by(uid: uid, provider: provider)
      user.name = info.name
      user.avatar_url = info.image
      user.profile_url = info.urls.send(provider.capitalize.to_sym)
      user.save!
      user
# need to add score somehow...
    end
  end
 end
