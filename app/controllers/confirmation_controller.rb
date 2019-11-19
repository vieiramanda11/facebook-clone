# frozen_string_literal: true

class ConfirmationController < Devise::ConfirmationController
  private

  def after_confirmation_path_for(_resource_name, _resource)
    sign_in(resourse)
    page_path
  end
end
