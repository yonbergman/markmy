class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :blurbs

  def self.guest_account
    self.new(:guest_account => true,
             :name => 'Anonymous',
             :email => "#{SecureRandom.urlsafe_base64(10)}@example.com",
             :password => SecureRandom.urlsafe_base64(50))
  end

  def admin!
    update(admin: true)
  end

end
