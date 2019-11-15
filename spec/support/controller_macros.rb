module ControllerMacros
    def login_user
        before(:each) do
            @request.env["devise mapping"] = Devise.mappings[:user]
            user = FactoryBot.build(:user)
            sign_in user
        end
    end
end