module AccountConcerns
  extend ActiveSupport::Concern

  included do
    before_action :set_account
  end

  private

    def set_account
      if params.key?(:account_id)
        slug = Slug.find_by!(slug: "/#{params[:account_id]}")
        slug_name = slug.sluggable_type.downcase
        instance_variable_set "@#{slug_name}", slug.sluggable
        @account = slug.sluggable
      else
        @user, @account = current_user
      end
    end
end
