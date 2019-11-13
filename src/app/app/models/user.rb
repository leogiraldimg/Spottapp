class User < ApplicationRecord
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: true }
    validates :nickname, presence: true, length: {maximum: 30}, uniqueness: { case_sensitive: true }
    validates :first_name, presence: true, length: {maximum: 50}
    validates :last_name, presence: true, length: {maximum: 50}
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence: true, length: {minimum: 6}
    validates :birth_date, presence: true
    validates :city, presence: true
    validates :state, presence: true, length: {maximum: 2, minimum: 2}
    validates :country, presence: true

    has_many :spotted
    has_many :college
    has_many :like, dependent: :destroy
    has_many :comment, dependent: :destroy
    has_many :favorite_colleges
    has_many :favorites, through: :favorite_colleges, source: :college
    has_many :administrator
    has_many :college_whitelist
    has_many :favorite_spotteds
    has_many :notification, through: :favorite_spotteds, source: :spotted

end
