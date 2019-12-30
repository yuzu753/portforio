require 'rails_helper'

RSpec.describe Recruitment, type: :model do
  describe '#Recruitment' do
    context '登録する' do
      it '正しく登録できる' do

        	user = FactoryBot.build(:user)
        	expect(user).to be_valid
          user.save

          recruitment = FactoryBot.build(:recruitment, user_id: user.id)
          expect(recruitment).to be_valid
          recruitment.save

          #テストデータの確認
          answered_enquete = Recruitment.find_by(user_id: user.id);

          expect(answered_enquete.user_id).to eq(user.id)
          expect(answered_enquete.title).to eq('助っ人募集＠多摩川河川敷')
          expect(answered_enquete.body).to eq('欠員が出たので募集中です')
          expect(answered_enquete.category).to eq('助っ人募集')
          expect(answered_enquete.area).to eq('東京都')
          expect(answered_enquete.address).to eq('東京都世田谷区多摩川１−１−１')
          expect(answered_enquete.recruitments_number).to eq(3)
      end
    end
  end

  describe 'バリデーション' do
    context '必須項目' do
      it 'タイトルが必須であること' do
        new_recruitment = Recruitment.new

        expect(new_recruitment).not_to be_valid
        expect(new_recruitment.errors[:title]).to include(I18n.t('errors.messages.blank'))
      end

      it '内容が必須であること' do
        new_recruitment = Recruitment.new

        expect(new_recruitment).not_to be_valid
        expect(new_recruitment.errors[:body]).to include(I18n.t('errors.messages.blank'))
      end

      it 'カテゴリーが必須であること' do
        new_recruitment = Recruitment.new

        expect(new_recruitment).not_to be_valid
        expect(new_recruitment.errors[:category]).to include(I18n.t('errors.messages.blank'))
      end

      it '登録できないこと' do
        new_recruitment = Recruitment.new
        expect(new_recruitment.save).to be_falsey
      end
    end
  end
end
