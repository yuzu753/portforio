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
end
