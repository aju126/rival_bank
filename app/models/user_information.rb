class UserInformation < ActiveRecord::Base
  has_many :user_accounts
  has_many :user_documents
  has_many :documents, through: :user_documents
  accepts_nested_attributes_for :user_accounts
  accepts_nested_attributes_for :user_documents

  after_save :expire
  after_update :expire

  def expire
    UserInformation.expire_memcache(:email_category)
  end

  def self.expire_memcache(key)
    Rails.cache.delete(key)
  end

  scope :email_category, -> {

    Rails.cache.fetch(:email_category) { UserInformation.emails_from_db }
  }

  def self.emails_from_db
    emails = Hash.new
    self.all.pluck(:email).each do |email|
      e = UserInformation.strip_mail(email)
      emails.key?(e) ? emails[e] = emails[e] + 1 : emails[e] = 1
    end
    emails
  end

  def self.strip_mail(str)
    length = str.length
    at = str.index('@')
    return at.nil? ? str : str[at+1, length]
  end

end
