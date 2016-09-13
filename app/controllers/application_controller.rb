class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :controller_name_with_namespace, :task_context, :project_context

  # The method `controller_name` is already available as part of Rails, but will remove any
  # namespace from the name. We want this, so this method includes the namespace.
  #
  # Example:
  #   Act::PracticeSessions => "act/practice_sessions"
  #
  # Returns the controller namespace and name as a path delimited String.
  def self.controller_name_with_namespace
    @controller_name_with_namespace ||= name.sub(/Controller$/, '').underscore
  end

  # Delegates to the class' controller_name_with_namespace.
  def controller_name_with_namespace
    self.class.controller_name_with_namespace
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def task_context
    @task_context ||= if instance_variable_defined?(:@project) && !@project.new_record?
                        @project
                      elsif instance_variable_defined?(:@organization) && !@organization.new_record?
                        @organization
                      elsif instance_variable_defined?(:@user) && !@user.new_record?
                        @user
                      elsif signed_in?
                        current_user
                      end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def project_context
    @project_context ||= if instance_variable_defined?(:@organization) && !@organization.new_record?
                           @organization
                         elsif instance_variable_defined?(:@user) && !@user.new_record?
                           @user
                         elsif signed_in?
                           current_user
                         end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit :username, :email, :password, :password_confirmation, :remember_me
      end
      devise_parameter_sanitizer.permit(:sign_in) do |u|
        u.permit :login, :username, :email, :password, :remember_me
      end
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit :username, :email, :password, :password_confirmation, :current_password
      end
    end
end
