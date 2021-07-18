class NotificationFromAdminJob < ApplicationJob
  queue_as :default

  def perform(msg)
    User.all.each do |user|
      NotificationFromAdminMailer.notify(user, msg).deliver_later
    end
  end
  # ジョブを作るときは必ずperformというメソッドを作ること(じゃないと動かない)
end
