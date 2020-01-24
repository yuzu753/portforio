require 'rails_helper'

RSpec.describe RecruitmentsController, type: :controller do
    describe '正常系' do
        context 'ログイン中のユーザー' do
            before do
                # ユーザーのログイン
                @user = FactoryBot.create(:user)
                sign_in @user
                # 投稿の作成
                @recruitment = FactoryBot.build(:recruitment, user_id: @user.id)
                @recruitment.save
            end

            it '#index 遷移出来る' do
                get :index
                expect(response).to have_http_status(200)
            end

            it '#show 遷移出来る' do
                get :show, params: { id: @recruitment.id }
                expect(response).to have_http_status(200)
            end

            it '#edit 遷移出来る' do
                get :edit, params: { id: @recruitment.id}
                expect(response).to have_http_status(200)
            end

            # it '#update 更新できる' do
            #     patch :update, params: { recruitment: FactoryBot.attributes_for(:recruitment), id: @recruitment.id }
            #     expect(response).to redirect_to(recruitment_path(@recruitment.id))
            #     expect(flash[:user_update]).to eq "投稿を更新しました"
            # end

            it '#new 遷移出来る' do
                get :new
                expect(response).to have_http_status(200)
            end

            # it '#create 投稿ができる' do
            #   recruitment_params = FactoryBot.attributes_for(:recruitment)
            #   post :create, params: { recruitment_params, user_id: @user.id }, xhr: true
            #   expect(response).to have_http_status(200)
            # end

            it '#destroy 投稿を削除できる' do
                expect {delete :destroy, params: {id: @recruitment.id}}.to change(Recruitment, :count).by(-1)
                expect(response).to redirect_to(recruitments_path)
            end
        end
    end

    describe '異常系' do
        context '非ログインユーザー' do
            before do
                @user = FactoryBot.create(:user)
                @recruitment = FactoryBot.build(:recruitment, user_id: @user.id)
                @recruitment.save
            end

            it '#index 遷移できない' do
                get :index
                expect(response).to have_http_status(302)
            end

            it '#show 遷移できない' do
                get :show, params: { id: @recruitment.id }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(user_session_path)
            end

            it '#edit 遷移できない' do
                get :edit, params: { id: @recruitment.id }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(user_session_path)
            end

            it '#new 遷移できない' do
                get :new, params: { id: @recruitment.id }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(user_session_path)
            end

            it '#destroy 投稿を削除できない' do
                delete :destroy, params: { id: @recruitment.id }
                expect{ delete :destroy, params: { id: @recruitment.id }}.to_not change(Recruitment, :count)
                expect(response).to redirect_to(user_session_path)
            end
        end

        context 'ログイン中他ユーザーの投稿について' do
            before do
                @user = FactoryBot.create(:user)
                @recruitment = FactoryBot.build(:recruitment, user_id: @user.id)
                @recruitment.save
                @new_user = User.new(
                    name: '今永',
                    email: 'imanaga@gmail.com',
                    password: '111111',
                )
                @new_user.save
                sign_in @new_user
            end

            it '#edit 遷移できない' do
                get :edit, params: { id: @recruitment.id }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(recruitments_path)
            end
        end
    end
end
