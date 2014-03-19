class Blurb < ActiveRecord::Base

  TOKEN_LENGTH = 10
  COLORS = %w(#173D5F #1F3D0E #470909 #376672 #340E49 #828627 #68213B #313C35)

  after_initialize :set_default_values
  validates_presence_of :token, :text

  belongs_to :user

  def to_param
    self.token
  end

  def username
    user.try(:name).presence || 'Anonymous'
  end

  def mood
    @_mood ||= image_list.mood_for_url(image_url)
  end

  def mood=(mood)
    self.image_url = image_list.random_image(mood)
  end

  def color
    COLORS[id % COLORS.length]
  end

  private

  def set_default_values
    self.image_url ||= image_list.random_image
    self.token  ||= SecureRandom.urlsafe_base64(TOKEN_LENGTH)
    self.time   ||= DateTime.now
  end

  def image_list
    @_images ||= Images.new
  end

end
