class ApplicationController < ActionController::Base

	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。


  private

 	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #sign_upの際にnameのデータ操作を許可。追加したカラム。
  	end

	def after_sign_in_path_for(resource)
    user_path (current_user) # ログイン後に遷移するpathを設定
  	end

#sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  	def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  	end

end