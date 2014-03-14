class Blurb < ActiveRecord::Base

  TOKEN_LENGTH = 10

  after_initialize :set_default_values
  validates_presence_of :token, :text

  belongs_to :user

  IMAGES = [
    'https://farm6.staticflickr.com/5229/5614979258_f6b9a8b586_b.jpg',
    'https://farm4.staticflickr.com/3430/3263900493_3faeb0f582_b.jpg',
    'https://farm5.staticflickr.com/4053/4259151192_19a90b983b_b.jpg',
    'https://farm5.staticflickr.com/4053/4259151192_19a90b983b_b.jpg',
    'https://farm1.staticflickr.com/25/58379433_9ea61a0aeb_b.jpg',
    'https://farm9.staticflickr.com/8390/8531661067_fb09683a7c_b.jpg',
    'https://farm9.staticflickr.com/8096/8531811319_e961fc00a6_b.jpg',
    'https://farm9.staticflickr.com/8436/7914623918_9a2c4d2b24_b.jpg',
    'https://farm9.staticflickr.com/8385/8672407236_ba3dd0af1d_b.jpg',
    'https://farm2.staticflickr.com/1007/552926523_9fb50d67e2_b.jpg',
    'https://farm5.staticflickr.com/4091/5176259353_15cdf3f3e6_b.jpg',
    'https://farm9.staticflickr.com/8098/8440587393_52cd8deeae_b.jpg'
  ]

  def to_param
    self.token
  end

  def image
    IMAGES[id % IMAGES.length]
  end

  def username
    'Anonymous'
  end

  private

  def set_default_values
    self.token  ||= SecureRandom.urlsafe_base64(TOKEN_LENGTH)
    self.time   ||= DateTime.now
  end


end
