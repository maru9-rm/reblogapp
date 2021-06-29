class ArticlesController < ApplicationController
  # コントローラー名は複数形を使う
  # ビューの中で値を定義したりもできるけど、ビューは表示部分のみに限定し、値の定義などはできるだけ裏側（コントローラー）に書くべし。

  before_action :set_article, only: [:show]
  # DRY don't repeat yourself
  # 同じコードを何度も書かないというルール @article = ~~ というコードが三箇所出てきていたので、beforeアクションでまとめてやっちゃう。
  # set_articleはprivateで設定。
  # onlyで使用するアクションを指定する。

  before_action :authenticate_user!, only: %i[new create edit update destroy]
  # []の中のアクションはログインしてないと使えない！という記述

  def index
    @articles = Article.all
  end

  def show
    @comments = @article.comments
    # set_articleで@articleを取得しているから@articleが使える
  end

  def new
    @article = current_user.articles.build
    # 空っぽのアーティクル、ガワを作成
    # current_userでログインしているユーザーを取れる
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '保存できたよ'
    # notice: でフラッシュメッセージにテキスト(ハッシュ)を持たせてリクエストを送ることができる。
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
      # この場合はレンダーなので、URLにリクエストを送るわけではないため、その場ですぐフラッシュを表示させるためにflash.nowで！
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    # @はつける必要ない。なぜならビューで使うわけじゃないから。
    article.destroy!
    # データを渡すわけじゃないので失敗するわけない、失敗したときはアプリがおかしいので例外が発生するように！をつける
    redirect_to root_path, notice: '削除に成功しました'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
  # データを変更されても保存されないように保存できる内容を制限(ストロングパラメータ)

  def set_article
    @article = Article.find(params[:id])
    # 何度も使うコードは定義して使い回す！
  end
end
