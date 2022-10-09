require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test validation' do
    it 'ユーザー名、メールアドレス、パスワードがある場合、有効' do
      expect(build(:user)).to be_valid
    end

    it "ユーザー名がない場合、無効" do
      user = build(:user, name: nil)

      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスがない場合、無効" do
      user = build(:user, email: nil)

      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したメールアドレスの場合、無効" do
      user = create(:user)
      new_user = build(:user, email: user.email)

      new_user.valid?
      expect(new_user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードがない場合、無効" do
      user = build(:user, password: nil, password_confirmation: nil)

      user.valid?
      expect(user.errors[:password]).to include("は3文字以上で入力してください")
    end
  end
end
