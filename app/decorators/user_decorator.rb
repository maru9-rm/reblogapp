# frozen_string_literal: true

module UserDecorator
  def display_name
    profile&.nickname || email.split('@').first
    # &.ぼっち演算子 profileがnillじゃない場合だけnicknameという処理を行う。
    # ||以下はプロフィールが設定されてないときの処理
    # email.split('@').first は「起点」の「Eメール」を「分割したもの」の「最初」
  end

  def avatar_image
    if profile&.avatar&.attached? # プロフィールがnilじゃなくてavatarがnilじゃなければattachされてるか確認
      profile.avatar
    else
      'default-avatar.png'
    end
  end
end

# 今までクラスに書いていた「見た目」に関するメソッドなどはこちらにうつす！
