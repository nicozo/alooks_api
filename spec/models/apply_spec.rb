require 'rails_helper'

RSpec.describe Apply, type: :model do
  describe "バリデーション検証" do
    it "全ての値が存在する場合、有効" do
      expect(build(:apply)).to be_valid
    end

    it "bodyが存在しない場合、無効" do
      apply = build(:apply, body: nil)

      apply.valid?
      expect(apply.errors[:body]).to include("を入力してください")
    end

    it "bodyが指定の文字数以上の場合、無効" do
      apply = build(:apply, body: SecureRandom.alphanumeric(26))

      apply.valid?
      expect(apply.errors[:body]).to include("は25文字以内で入力してください")
    end

    it "userがない場合、無効" do
      apply = build(:apply, user: nil)

      apply.valid?
      expect(apply.errors[:user]).to include("を入力してください")
    end

    it "roomがない場合、無効" do
      apply = build(:apply, room: nil, host_id: 1)

      apply.valid?
      expect(apply.errors[:room]).to include("を入力してください")
    end

    it "hostがない場合、無効" do
      apply = build(:apply, host_id: nil)

      apply.valid?
      expect(apply.errors[:host_id]).to include("を入力してください")
    end

    it "host_idとuserが同じ場合、無効" do
      current_user = create(:user)
      apply = build(:apply, host_id: current_user.id, user: current_user )

      apply.valid?
      expect(apply.errors[:base]).to include("作成した募集にはリクエストできません")
    end
  end
end
