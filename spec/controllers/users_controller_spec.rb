require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe '正常系' do
		context 'ログイン中のユーザー' do
			before do
				@user = FactoryBot.create(:user)
				sign_in @user
			end

			it '#show 遷移出来る' do
				get :show, params: { id: @user.id }
				expect(response).to have_http_status(200)
			end

			it '#edit 遷移出来る' do
				get :edit, params: { id: @user.id}
				expect(response).to have_http_status(200)
			end

			it '#update 更新できる' do
				patch :update, params: { user: FactoryBot.attributes_for(:user), id: @user.id }
				expect(response).to redirect_to(user_path(@user.id))
				expect(flash[:user_update]).to eq "successfully updated"
			end

			it '#destroy 退会できる' do
				expect {delete :destroy, params: {id: @user.id}}.to change(User, :count).by(-1)
				expect(response).to redirect_to(root_path)
			end
		end
	end

	describe '異常系' do
		context '非ログインユーザー' do
			before do
				@user = FactoryBot.create(:user)
			end

			it '#show 遷移できない' do
				get :show, params: {id: @user.id}
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(new_user_session_path)
			end

			it '#edit 遷移できない' do
				get :edit, params: { id: @user.id}
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(new_user_session_path)
			end

			it '#update　更新できない' do
				patch :update,params: { user: FactoryBot.attributes_for(:user), id: @user.id }
				expect(response).to redirect_to(new_user_session_path)
			end

			it '#destroy 退会できない' do
				delete :destroy, params: { id: @user.id }
				expect{ delete :destroy, params: { id: @user.id }}.to_not change(User, :count)
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end
end
