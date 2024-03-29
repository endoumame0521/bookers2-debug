class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def self.search(search_params)
		if search_params[:method] == "forward_match"
			where("title LIKE?", "#{search_params[:word]}%")
		elsif search_params[:method] == "backward_match"
			where("title LIKE?", "%#{search_params[:word]}")
		elsif search_params[:method] == "perfect_match"
			where(title: "#{search_params[:word]}")
		elsif search_params[:method] == "partial_match"
			where("title LIKE?", "%#{search_params[:word]}%")
		else
			all
		end
	end
end
