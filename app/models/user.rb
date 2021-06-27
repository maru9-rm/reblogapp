# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  # マイグレーションファイルでデータベース上では関連づいたが、activerecord上では紐づいてないので、モデル上で関連づけを行う。
  # articles側はbelongs_toを設定する。
  # dependent: :destroy userが削除された時に配下?のarticleも削除される、というオプション


  def has_written?(article)
    articles.exists?(id: article.id)
    # exists?条件に合うやつがあるかないかを判別するメソッド
  end

  def display_name
    self.email.split('@').first
    # 「起点」の「Eメール」を「分割したもの」の「最初」
  end


end
