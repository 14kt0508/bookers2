class Book < ApplicationRecord
#1:N=user:book
	belongs_to :user #bookはuserに紐つける
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy


	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	#length: {maximum: 200}MAXで200文字制限
  	validates :title, presence: true, length: {maximum: 200}
  	validates :body, presence: true, length: {maximum: 200}

  	 def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
	 end

end
