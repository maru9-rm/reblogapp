class ArticlesController < ApplicationController
    # コントローラー名は複数形を使う
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
        # 空っぽのアーティクル、ガワを作成
    end

    def create
        @article = Article.new(article_params)
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
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          redirect_to article_path(@article), notice: '更新できました'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
    end

    
    private

    def article_params
        params.require(:article).permit(:title, :content)
    end
    # データを変更されても保存されないように保存できる内容を制限(ストロングパラメータ)
end