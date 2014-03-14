class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blurbs

  def self.guest_account
    self.new(:guest_account => true,
             :email => "#{SecureRandom.urlsafe_base64(10)}@example.com",
             :password => SecureRandom.urlsafe_base64(50))
  end

  def name
    if guest_account?
      'Anonymous'
    else
      email.split('@').first
    end
  end
end
