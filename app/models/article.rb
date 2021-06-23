class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    # validate(検証)　presence→入力されていないとだめ！

    def display_created_at
        I18n.l(self.created_at, format: :default)
        # この表記だと何やってるのかわかりにくいし、何度か使い回すので、DRY的にも変数化してしまう。
        # I18n　国際化するクラス
    end

end
