module TabsHelper
  def add_active_class(path)
    'active' if current_page?(path)
  end
end

# ビューのクラスなどに関するものを裏側で処理する。
# helperはビューの拡張をしているものという認識でOK
# だからcurrent_pageを使える
