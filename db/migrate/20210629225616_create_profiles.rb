class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.text :introduction
      t.integer :gender
      # 性別は文字でなく数字で処理！表示する段階で「男性」とかに変えればOK
      t.date :birthday
      t.boolean :subscribed, default: false
      t.timestamps
    end
  end
end
