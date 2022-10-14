require 'rails_helper'

RSpec.describe Clan, type: :model do
  describe "バリデーション検証" do
    let(:more_than_100_characters) { SecureRandom.alphanumeric(101) }

    it "全ての値が存在する場合、有効" do
      expect(build(:clan)).to be_valid
    end

    it "nameが存在しない場合、無効" do
      clan = build(:clan, name: nil)

      clan.valid?
      expect(clan.errors[:name]).to include("を入力してください")
    end

    it "nameが指定の文字数以上の場合、無効" do
      clan = build(:clan, name: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:name]).to include("は15文字以内で入力してください")
    end

    it "conceptが存在しない場合、無効" do
      clan = build(:clan, concept: nil)

      clan.valid?
      expect(clan.errors[:concept]).to include("を入力してください")
    end

    it "conceptが指定の文字数以上の場合、無効" do
      clan = build(:clan, concept: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:concept]).to include("は100文字以内で入力してください")
    end

    it "joining_processが存在しない場合、無効" do
      clan = build(:clan, joining_process: nil)

      clan.valid?
      expect(clan.errors[:joining_process]).to include("を入力してください")
    end

    it "joining_processが指定の文字数以上の場合、無効" do
      clan = build(:clan, joining_process: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:joining_process]).to include("は100文字以内で入力してください")
    end

    it "prohibited_mattersが存在しない場合、無効" do
      clan = build(:clan, prohibited_matters: nil)

      clan.valid?
      expect(clan.errors[:prohibited_matters]).to include("を入力してください")
    end

    it "prohibited_mattersが指定の文字数以上の場合、無効" do
      clan = build(:clan, prohibited_matters: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:prohibited_matters]).to include("は100文字以内で入力してください")
    end

    it "personalityが存在しない場合、無効" do
      clan = build(:clan, personality: nil)

      clan.valid?
      expect(clan.errors[:personality]).to include("を入力してください")
    end

    it "personalityが指定の文字数以上の場合、無効" do
      clan = build(:clan, personality: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:personality]).to include("は50文字以内で入力してください")
    end

    it "enrollmentが存在しない場合、無効" do
      clan = build(:clan, enrollment: nil)

      clan.valid?
      expect(clan.errors[:enrollment]).to include("を入力してください")
    end

    it "enrollmentが指定の文字数以上の場合、無効" do
      clan = build(:clan, enrollment: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:enrollment]).to include("は50文字以内で入力してください")
    end

    it "activity_timeが存在しない場合、無効" do
      clan = build(:clan, activity_time: nil)

      clan.valid?
      expect(clan.errors[:activity_time]).to include("を入力してください")
    end

    it "activity_timeが指定の文字数以上の場合、無効" do
      clan = build(:clan, activity_time: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:activity_time]).to include("は50文字以内で入力してください")
    end

    it "enrollment_ageが存在しない場合、無効" do
      clan = build(:clan, enrollment_age: nil)

      clan.valid?
      expect(clan.errors[:enrollment_age]).to include("を入力してください")
    end

    it "enrollment_ageが指定の文字数以上の場合、無効" do
      clan = build(:clan, enrollment_age: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:enrollment_age]).to include("は50文字以内で入力してください")
    end

    it "snipeが存在しない場合、無効" do
      clan = build(:clan, snipe: nil)

      clan.valid?
      expect(clan.errors[:snipe]).to include("を入力してください")
    end

    it "snipeが指定の文字数以上の場合、無効" do
      clan = build(:clan, snipe: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:snipe]).to include("は100文字以内で入力してください")
    end

    it "contact_meansが存在しない場合、無効" do
      clan = build(:clan, contact_means: nil)

      clan.valid?
      expect(clan.errors[:contact_means]).to include("を入力してください")
    end

    it "contact_meansが指定の文字数以上の場合、無効" do
      clan = build(:clan, contact_means: more_than_100_characters)

      clan.valid?
      expect(clan.errors[:contact_means]).to include("は50文字以内で入力してください")
    end

    it "userがない場合、無効" do
      clan = build(:clan, user: nil)

      clan.valid?
      expect(clan.errors[:user]).to include("を入力してください")
    end
  end

end
