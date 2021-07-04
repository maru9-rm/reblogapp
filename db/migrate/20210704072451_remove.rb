class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :content, :text
  end
end

# 名前ミスったけどarticlesからcontentカラムを消すマイグレーションファイル
# rollback時にカラムを追加できるようにtextタイプであることを記述