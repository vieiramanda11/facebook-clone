class ConfirmationController < Devise::ConfirmationController
    private

        def after_confirmation_path_for(resource_name, resource)
            sign_in(resourse)
            page_path
        end

end