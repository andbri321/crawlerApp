require 'rails_helper'
require 'support/factory_bot'

describe SessionsController, type: :controller do
    context "create token" do
        it 'request create and return 200 (credential valid)' do
            user = create(:user)
            get(:create, params: { "auth": {"email": user.email, "password": user.password }} )
            
            expect(response).to have_http_status(200)
        end

        it 'request create and return 204 (credential invalid)' do
            user = create(:user)
            get(:create, params: { "auth": {"email": user.email, "password": "#{user.password}123" }} )

            expect(response).to have_http_status(204)
        end
    end
end