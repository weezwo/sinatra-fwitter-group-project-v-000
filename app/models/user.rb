class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password
  def slug
    self.username.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").join(" ")
    self.where('lower(username) = ?', unslug).first
  end
end
