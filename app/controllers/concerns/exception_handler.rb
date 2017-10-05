module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing do |exception|
      flash[:error] = 'You need to select an alternative'
      redirect_back fallback_location: root_path
    end
  end
end
