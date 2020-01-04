require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#User/new' do
    context '登録する' do
       it '正しく登録できること )' do

      	user = User.new(
          name: '筒香',
          self_introduction: 'メジャーリーグ目指してます',
          email: 'test@test.com',
          password: 'testtest',
        )

        expect(user).to be_valid

        user.save

        #テストデータの確認
        answered_enquete = user;

        expect(answered_enquete.name).to eq('筒香')
        expect(answered_enquete.self_introduction).to eq('メジャーリーグ目指してます')
        expect(answered_enquete.email).to eq('test@test.com')
      end
    end
  end

  describe 'バリデーション' do
    context '必須項目' do
      it 'ユーザー名' do
        new_user = User.new

        expect(new_user).not_to be_valid
        expect(new_user.errors[:name]).to include(I18n.t('errors.messages.blank'))
      end

      it 'メールアドレスが必須であること' do
        new_user = User.new
        expect(new_user).not_to be_valid
        expect(new_user.errors[:email]).to include(I18n.t('errors.messages.blank'))
      end

      it '登録できないこと' do
        new_user = User.new
        expect(new_user.save).to be_falsey
      end
    end
  end
end
