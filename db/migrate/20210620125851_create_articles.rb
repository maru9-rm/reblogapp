class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false # references :user でユーザーと関連づけする
      t.string :title, null: false
      t.text :content, null: false # null: false 空欄は認めない！validationはActiveRecord側の規制。こっちはデータベース側の規制。
      t.timestamps
    end
  end
end

# データベースはGitで管理できない！データベースはmigrateを実行することでしか変更しない。
# mingrationファイルはあくまで設計図である。
# rails db:rollback でデータベースを消せる。
# migrationファイルは上から順に実行される。ので、順番変えたければ名前を変更して順番を変えよう。
