class RelationshipMailer < ApplicationMailer
    
    def new_follower(user, follower)
        @user = user
        @follower = follower
        mail to: user.email, subject: '【お知らせ】フォローされました'
    end
end

# コントローラー周りと同じでファイル名はスネーク、クラス名はキャメル。
# viewsに同名のフォルダを作成して、メソッド名のhamlファイルを作成し、そこにメールの内容を書く。