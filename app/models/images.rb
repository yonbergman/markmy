class Images
  attr_reader :data

  def self.moods
    self.new.moods
  end

  def initialize
    @data = Hashie::Mash.new(YAML.load_file('config/images.yml')).images
  end

  def moods
    data.keys
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

  def inspect
    counts = Hash[data.map{|mood, images| [mood, images.size]}]
    "#<Images:#0x%08x #{counts}>" % object_id
  end
end
