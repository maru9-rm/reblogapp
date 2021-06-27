# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  validates :title, presence: true
  # validate(検証) presence→入力されていないとだめ！
  validates :title, length: { minimum: 2, maximum: 100 }
  # length 字数制限を儲ける
  validates :content, presence: true
  validates :content, length: { minimum: 10 }

  validates :content, uniqueness: true
  # 内容が一意である(全く同じ内容のものがない)

  validates :title, format: { with: /\A(?!@)/ }
  # よく使うのはネットで検索かけたら出てくるのでググろう。
  # https://rubular.com/ 正規表現はこちらで確認しよう！


  belongs_to :user
  # マイグレーションファイルでデータベース上では関連づいたが、activerecord上では紐づいてないので、モデル上で関連づけを行う。
  # articles側はbelongs_toを設定する。

  def author_name
    user.display_name
    # userモデルに存在するdisplay_nameを持ってきてる
  end

  def display_created_at
    I18n.l(created_at, format: :default)
    # この表記だと何やってるのかわかりにくいし、何度か使い回すので、DRY的にも変数化してしまう。
    # I18n 国際化するクラス
  end

end
