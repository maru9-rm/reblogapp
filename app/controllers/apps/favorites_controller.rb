class Apps::FavoritesController < Apps::ApplicationController
  before_action :authenticate_user!

  def index
    @articles = current_user.favorite_articles # has_many favorite_atriclesだから取れる。
  end
end
