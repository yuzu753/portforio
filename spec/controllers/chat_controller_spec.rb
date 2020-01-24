require 'rails_helper'

RSpec.describe ChatController, type: :controller do
    describe "正常系" do
        context "ログイン中のユーザー" do
            before do
                # ユーザーのログイン
                @user = FactoryBot.create(:user)
                sign_in @user
                #チャットルームの作成
                @chat = FactoryBot.create(:chat_room)
                @chat_user = FactoryBot.create(:chat_room_user, chat_room_id: @chat.id, user_id: @user.id)
            end

            it "#index 遷移できる" do
                get :index
                expect(response).to have_http_status(200)
            end

            it "#show 遷移できる" do
                get :show, params: { id: @chat.id }
                expect(response).to have_http_status(200)
            end
        end
    end

    describe "異常系" do
        context "非ログイン中のユーザー" do
            before do
                #ユーザー、チャットルームの作成ログインはしない
                @user = FactoryBot.create(:user)
                @chat = FactoryBot.create(:chat_room)
                @chat_user = FactoryBot.create(:chat_room_user, chat_room_id: @chat.id, user_id: @user.id)
            end
            it "#index 遷移できない" do
                get :index
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(user_session_path)
            end

            it "#show 遷移できない" do
                get :show, params: { id: @chat.id }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(user_session_path)
            end
        end

        context "ログイン中他のユーザー同士のチャット" do
            before do
                #ユーザー、チャットルームの作成
                @user = FactoryBot.create(:user)
                @chat = FactoryBot.create(:chat_room)
                @chat_user = FactoryBot.create(:chat_room_user, chat_room_id: @chat.id, user_id: @user.id)
                #別のユーザー
                @new_user = User.new(
                    name: '今永',
                    email: 'imanaga@gmail.com',
                    password: '111111',
                )
                @new_user.save
                sign_in @new_user
            end
        end
    end
end
