class User < ApplicationRecord
    attr_accessor :remember_token
    validates :name, presence: true, length: { maximum: 30 }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    has_many :diaries, dependent: :destroy

    # 文字列のハッシュ値を返す
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # ランダムなトークン
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # ユーザーをデータベースに記憶する
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # ログイン情報を破棄
    def forget
        update_attribute(:remember_digest, nil)
    end
end
