require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "バリデーション検証" do
    it "タイトル、プラットフォーム、ゲームモード、ランク帯、募集人数、募集時間がある場合、有効" do
      expect(build(:room)).to be_valid
    end

    it "タイトルがない場合、無効" do
      room = build(:room, title: nil)

      room.valid?
      expect(room.errors[:title]).to include("を入力してください")
    end

    it "パスワードが指定の文字数以上の場合、無効" do
      title = ('A'..'Z').to_a.shuffle[0..16].join
      room = build(:room, title: title)

      room.valid?
      expect(room.errors[:title]).to include("は15文字以内で入力してください")
    end

    it "募集人数がない場合、無効" do
      room = build(:room, recruitment_number: nil)

      room.valid?
      expect(room.errors[:recruitment_number]).to include("を入力してください")
    end

    it "投稿者がない場合、無効" do
      room = build(:room, user: nil)

      room.valid?
      expect(room.errors[:user]).to include("を入力してください")
    end
  end
end
