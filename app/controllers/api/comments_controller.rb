class Api::CommentsController < Api::ApplicationController
  def index
    article = Article.find(params[:article_id])
    comments = article.comments
    render json: comments
    # active serializerというgemを入れて、インスタンスをAPIに変えることでrendar jsonで表示できる
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    # if @comment.save
    #   redirect_to article_path(article), notice: 'コメントを追加'
    # else
    #   flash.now[:error] = '更新できませんでした'
    #   render :new
    # end
    # ajaxでコメントを処理することにしたので上記は不要になったのでコメントアウト
    @comment.save!

    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
