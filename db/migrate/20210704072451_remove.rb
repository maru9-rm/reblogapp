class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :content, :text
  end
end

# 名前ミスったけどarticlesからcontentカラムを消すマイグレーションファイル
# rollback時にカラムを追加できるようにデータの型をtextに指定している

# migrationのup・downについて詳しくは上級Day1の最後の動画を参照！
