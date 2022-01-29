class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :admins, through: :admin_customers
  has_many :reviews
  with_options presence: true do
    validates :admin_code
    validates :nickname
    validates :name
    validates :name_kana
    validates :birth_date
    validates :prefecture_id
    validates :city_block
  end
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :prefecture
end
