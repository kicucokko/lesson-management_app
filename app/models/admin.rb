class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :customers, through: :admin_customers
  #//自動生成コード
  generate_public_uid column: :public_uid
    validates :unique_code, presence: true, on: :update
    validates :unique_code, format: { with: /\A[a-z0-9]+\z/i }, on: :update
    validates :unique_code, length: { minimum: 5, maximum: 12 }, on: :update
  #自動生成コード//
  with_options presence: true do
    validates :nickname
    validates :name
    validates :name_kana
    validates :birth_date
    validates :prefecture_id
    validates :city_block
  end
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :prefecture
  has_many :reviews
end
