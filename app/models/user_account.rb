class UserAccount < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:user_name]

  def ability
    @ability ||= Ability.new(self)
  end
  delegate :can?, :cannot?, to: :ability

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
    add_zero_balance if self.account_balance.nil?
    self.account_balance.balance.try(:to_i).presence || 0
  end

  def add_zero_balance
    self.account_balance = AccountBalance.create(balance: 0)
    save!
  end

  def update_balance(amount, action)
    p "updating balance for #{amount}"
    final_amount = 0
    case action
      when :credit
        final_amount = self.balance + amount
      when :debit
        final_amount = self.balance - amount
    end
    self.account_balance.balance = final_amount
    self.account_balance.save!
    save!
  end

  def admin?
    roles.include?(Role.admin)
  end

  def manager?
    roles.include?(Role.manager)
  end

  def account_holder?
    roles.include?(Role.account_holder)
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
