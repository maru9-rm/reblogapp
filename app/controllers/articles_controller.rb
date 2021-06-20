class ArticlesController < ApplicationController
    # コントローラー名は複数形を使う
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
end