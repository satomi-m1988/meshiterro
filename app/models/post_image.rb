class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :post_comments, dependent: :destroy#画像とコメントを関連付の記述
	has_many :favorites, dependent: :destroy

	validates :shop_name, presence: true
	validates :image, presence: true

	def favorited_by?(user)#この引数で渡されたユーザIDがfavoriteテーブルに存在するかどうかを確認している
		favorites.where(user_id: user.id).exists?
	end
end
