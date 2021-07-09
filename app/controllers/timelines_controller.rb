class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    @articles = Article.where(user_id: user_ids)
  end
end

# pluck 一部のみを取り出す処理をする。この場合はidだけを配列として取得する。
# ということで今user_idsはidを配列として持ってる。
# それをwhereで検索かけてる。複数ある場合はorで検索がかかる。
