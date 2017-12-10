class UserAccount < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:user_name]

  #Associations

  belongs_to :user_information
  accepts_nested_attributes_for :user_information
  belongs_to :account_balance
  belongs_to :account_interest
  has_many :source_accounts, class_name: 'Transaction', foreign_key: 'source_user_account_id'
  has_many :destination_accounts, class_name: 'Transaction', foreign_key: 'destination_user_account_id'
  has_and_belongs_to_many :roles, join_table: 'users_roles'

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def balance
    self.account_balance.balance.try(:to_i).presence || 0
  end

  def update_balance(amount)
    self.account_balance.balance = self.balance + amount
    save
  end

  def find_for_database_authentication warden_conditions
    #raise warden_conditions.inspect
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["user_name = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:user_name) || conditions.has_key?(:account_number)
      where(conditions.to_hash).first
    end
  end
end
