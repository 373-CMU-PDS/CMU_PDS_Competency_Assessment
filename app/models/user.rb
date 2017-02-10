class User < ActiveRecord::Base
    before_save :encrypt_password
    after_save :clear_password

    attr_accessor :password, :password_confirmation

    EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :email, :presence => true, :uniqueness => true
    validates :password, :confirmation => true #password_confirmation attr
    validates_length_of :password, :in => 6..20, :on => :create

    scope :find_by_username, -> (username) { where("username = ?", username) }

    private
    # Since the actual password is never saved in the database,
    # these functions are called before/after saving to save the
    # encrypted version of the password.
    def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
      end
    end

    def clear_password
      self.password = nil
    end

end
