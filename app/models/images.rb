class Images
  COLORS = %w(#173D5F #1F3D0E #470909 #376672 #340E49 #828627 #68213B #313C35)

  attr_reader :data

  def self.moods
    self.new.moods
  end

  def initialize
    @data = Hashie::Mash.new(YAML.load_file('config/images.yml')).images
  end

  def moods
    data.keys.sort
  end

  def all_images
    data.values.flatten
  end

  def random_image(mood = nil)
    arr = data[mood].presence || all_images
    arr.sample
  end

  def mood_for_url(image_url)
    found = data.find {|mood, images| images.include? image_url}
    found and found.first
  end

  def color_for_url(image_url)
    COLORS[image_url.hash % COLORS.length]
  end

  def inspect
    counts = Hash[data.map{|mood, images| [mood, images.size]}]
    "#<Images:#0x%08x #{counts}>" % object_id
  end
end
