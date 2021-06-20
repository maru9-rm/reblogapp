class ArticlesController < ApplicationController
    # コントローラー名は複数形を使う
    def index
        @articles = Article.first
    end
end