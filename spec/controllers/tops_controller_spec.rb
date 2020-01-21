require 'rails_helper'

RSpec.describe TopsController, type: :controller do
	describe '正常系' do
		context 'ログイン中のユーザー' do
			before do
				@user = FactoryBot.create(:user)
				sign_in @user
			end
			it '#top 遷移できる' do
				get :top
				expect(response).to have_http_status(200)
			end
		end
		context '非ログインユーザー' do
			it '#top 遷移できる' do
				get :top
				expect(response).to have_http_status(200)
			end
		end
	end
end
