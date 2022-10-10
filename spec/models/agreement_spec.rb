require 'rails_helper'

RSpec.describe Agreement, type: :model do
  describe "バリデーション検証" do
    it "全ての値が存在する場合、有効" do
      expect(build(:agreement)).to be_valid
    end

    it "bodyが存在しない場合、無効" do
      agreement = build(:agreement, body: nil)

      agreement.valid?
      expect(agreement.errors[:body]).to include("を入力してください")
    end

    it "bodyが指定の文字数以上の場合、無効" do
      agreement = build(:agreement, body: SecureRandom.alphanumeric(26))

      agreement.valid?
      expect(agreement.errors[:body]).to include("は25文字以内で入力してください")
    end

    it "user_idがない場合、無効" do
      agreement = build(:agreement, user: nil)

      agreement.valid?
      expect(agreement.errors[:user]).to include("を入力してください")
    end

    it "room_idがない場合、無効" do
      agreement = build(:agreement, room: nil)

      agreement.valid?
      expect(agreement.errors[:room]).to include("を入力してください")
    end

    it "applicant_idがない場合、無効" do
      agreement = build(:agreement, applicant_id: nil)

      agreement.valid?
      expect(agreement.errors[:applicant_id]).to include("を入力してください")
    end

    it "applicant_idとroom_idが同じ場合、無効" do
      agreement = create(:agreement)
      agreement_copy = agreement.dup

      agreement_copy.valid?
      expect(agreement_copy.errors[:base]).to include("参加リクエスト承認済みです")
    end
  end
end
