class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_images, dependent: :destroy#ユーザのテーブルと画像のテーブルを関連付けた記述
  has_many :post_comments, dependent: :destroy#ユーザーとコメントを関連付けた記述
  has_many :favorites, dependent: :destroy#いいねとユーザを関連付
  attachment :profile_image#プロフィール画像を挿入できるようにする記述’refile特有の書き方'
end
