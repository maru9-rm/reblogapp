namespace :notification do
  desc '利用者にメールを送付する'

  task :send_emails_from_admin, ['msg'] => :environment do |_task, args|
    msg = args['msg']
    if msg.present?
      NotificationFromAdminJob.perform_later(msg)
    else
      puts '送信できませんでした。メッセージを入力してくてださい。ex. rails notification:send_emails_from_admin\[こんにちは\]'
    end
  end
end

# 拡張子が.rbじゃなくて.rakeであることに注意！

# rakeタスクとはアプリケーションを起動せずともコマンドラインから実行できるタスク

# rails notification:send_emails_from_admin をターミナルで実行すれば上記タスクが実行される

# rake task 参考 https://qiita.com/Hijiri-K/items/d436d10d0e1ba6c573c0