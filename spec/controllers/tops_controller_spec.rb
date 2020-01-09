require 'rails_helper'

RSpec.describe TopsController, type: :controller do
	describe '正常系' do
		context '全ユーザー' do
			it '#top 遷移できる' do
				get :top
				expect(response).to have_http_status(200)
			end
		end
	end
end
