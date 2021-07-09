# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
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
  has_one_attached :eyecatch
  # 画像を持たせるための設定

  has_rich_text :content
  # actiontextを導入したので、それを使う設定。よって既存のcontentのカラムが不要になるので削除する。
  # 削除の仕方 以下をターミナルで実行してマイグレーションファイルを作る
  # rails g migration RemoveContentFromArticles

  validates :title, presence: true
  # validate(検証) presence→入力されていないとだめ！
  validates :title, length: { minimum: 2, maximum: 100 }
  # length 字数制限を儲ける

  validates :content, presence: true
  # validates :content, length: { minimum: 10 }

  # validates :content, uniqueness: true
  # 内容が一意である(全く同じ内容のものがない)

  validates :title, format: { with: /\A(?!@)/ }
  # よく使うのはネットで検索かけたら出てくるのでググろう。
  # https://rubular.com/ 正規表現はこちらで確認しよう！

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  belongs_to :user
  # マイグレーションファイルでデータベース上では関連づいたが、activerecord上では紐づいてないので、モデル上で関連づけを行う。
  # articles側はbelongs_toを設定する。
end
