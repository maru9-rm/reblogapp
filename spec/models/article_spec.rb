require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }
  # どっちでも使えるようにここで変数定義
  # createでfactory_botでuserデータを作成
  # create(:user, email:'test@test.jp') みたいな感じで一部指定することもできる


  context 'タイトルと内容が入力されている場合' do
    let!(:article) { build(:article, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context 'タイトルの文字が一文字の場合' do
    let!(:article) { build(:article, title: Faker::Lorem.characters(number: 1), user: user) }

    before do
      article.save
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end

#  it '' do
#  end
# が基本の形式。''内に確認する内容を書く。do から end の間に実際の処理を書く。
# 上記の場合はユーザーのダミーデータを作成→そのユーザーから記事のダミーデータを作成。
# Faker::Loremは適当な文字列を作成してくれるやつ
# expect 予期する
# be_valid 保存できる状態か確認する つまり、記事が有効であることを期待するメソッド
# rspecではletで変数を定義する この場合はbeforeいらない

    # before do
    #   user = User.create!({
    #     email: 'test@example.com',
    #     password: 'password'
    #   })
    #   @article = user.articles.build({
    #     title: Faker::Lorem.characters(number: 10),
    #     content: Faker::Lorem.characters(number: 300)
    #   })
    # end

