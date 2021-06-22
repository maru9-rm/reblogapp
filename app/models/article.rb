class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    # validate(検証)　presence→入力されていないとだめ！


end
