class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :following, null: false, foreign_key: { to_table: :users }
      t.references :follower, null: false, foreign_key: { to_table: :users }
      # foreign_key:でuserテーブルと紐づいていることを記述する
      t.timestamps
    end
  end
end
