class Email < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_UIC_EMAIL_REGEX = /\A[\w+\-.]+@uic\.edu/i
	validates :uic_email, format: { with: VALID_UIC_EMAIL_REGEX }, allow_nil: true
	validates :non_uic_email, format: { with:  /\A[\w+\-.]+@(^uic)\.[a-z]+\z/i }, allow_nil: true
  belongs_to :member
end
