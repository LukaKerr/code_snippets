class RegistrationsController < Devise::RegistrationsController

	def show
	  @user = User.find(params[:id])
	end

  def edit
    @snippets = current_user.snippets.order(params[:sort])
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :about, :website, :github, :languages, :picture)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :about, :website, :github, :languages, :picture)
  end

  def update_resource(resource, params)
    if resource.email != params[:email] || params[:password].present?
      super
    else
      params.delete(:current_password)
      resource.update_without_password(params)
    end
  end
end