require 'rails_helper'

RSpec.describe Recruitment, type: :model do
    describe '#Recruitment' do
    context '登録する' do
       it '正しく登録できること )' do

      	recruitment = Recruitment.new(
      	  user_id: 1,
          title: '助っ人募集＠多摩川河川敷',
          body: '欠員が出たので募集中です',
          category: 3,
          area: 13,
          address: '東京都世田谷区多摩川１−１−１',
          recruitments_number: 3,
        )

        expect(recruitment).to be_valid

        recruitment.save

        #テストデータの確認
        answered_enquete = recruitment;

        expect(answered_enquete.user_id).to eq(1)
        expect(answered_enquete.title).to eq('助っ人募集＠多摩川河川敷')
        expect(answered_enquete.body).to eq('欠員が出たので募集中です')
        expect(answered_enquete.category).to eq(3)
        expect(answered_enquete.area).to eq(13)
        expect(answered_enquete.address).to eq('東京都世田谷区多摩川１−１−１')
        expect(answered_enquete.recruitments_number).to eq(3)
      end
    end
  end
end
