class User < ApplicationRecord
  has_secure_password

  enum :role, { unapproved: 1, admin: 10 }

  def self.[](username)
    find_by!(username: username)
  end
end
