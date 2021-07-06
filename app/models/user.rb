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

  has_one :profile, dependent: :destroy
  # 1対1の関係なのでmanyじゃなくてoneだし、単数系を使う
  has_many :likes, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :favorite_articles, through: :likes, source: :article
  # likesという中間テーブルを通して(through)、article(source)を取れる。

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  # relaltionshipsという中間テーブルを持ってくる設定。テーブルの名前が違うので、外部キーやクラスをちゃんと書く。
  has_many :followings, through: :following_relationships, source: :following
  # relationshiopsという中間テーブルをまたいでデータを取得するためthroughやsourceを設定。

  # 上記と同様今度はfollower情報を取得する準備↓
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  delegate :birthday, :age, :gender, to: :profile, allow_nil: true
  # profileからbirthdayとageとgenderをとってきてnillでもオッケーにする。という記述。これにてぼっち演算子を使わなくてもよくなる。

  def follow!(user)
    user_id = get_user_id(user)
    following_relationships.create!(following_id: user_id)
    # following_relationshipsテーブルに新たなデータを作ります。その際のfollowing_idは引数のユーザーのidです。みたいな感じ？
  end

  def unfollow!(user)
    user_id = get_user_id(user)
    relation = following_relationships.find_by!(following_id: user_id)
    relation.destroy!
  end

  def has_followed?(user)
    following_relationships.exists?(following_id: user.id)
  end

  def has_written?(article)
    articles.exists?(id: article.id)
    # exists?条件に合うやつがあるかないかを判別するメソッド
  end

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  def display_name
    profile&.nickname || email.split('@').first
    # &.ぼっち演算子 profileがnillじゃない場合だけnicknameという処理を行う。
    # ||以下はプロフィールが設定されてないときの処理
    # email.split('@').first は「起点」の「Eメール」を「分割したもの」の「最初」
  end

  # def birthday
  #   profile&.birthday
  # end

  # def gender
  #   profile&.gender
  # end

  def prepare_profile
    profile || build_profile
  end

  def avatar_image
    if profile&.avatar&.attached? # プロフィールがnilじゃなくてavatarがnilじゃなければattachされてるか確認
      profile.avatar
    else
      'default-avatar.png'
    end
  end

  private
  def get_user_id(user)
    if user.is_a?(User) # is_a? は()内で指定したクラスのインスタンスであるか確認するメソッド
      user.id
    else
      user
    end
  end
end
