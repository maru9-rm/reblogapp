module ArticleDecorator
  def author_name
    user.display_name
    # userモデルに存在するdisplay_nameを持ってきてる
  end

  def display_created_at
    I18n.l(created_at, format: :default)
    # この表記だと何やってるのかわかりにくいし、何度か使い回すので、DRY的にも変数化してしまう。
    # I18n 国際化するクラス
  end

  def like_count
    likes.count
  end
  # countメソッド 数えることができる。
end
