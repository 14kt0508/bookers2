class ApplicationController < ActionController::Base

	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
  protect_from_forgery with: :exception

  # # 前の画面に戻る
  # def return_back
  #   if request.referer
  #     redirect_to :back and return true
  #   elsif @request_from
  #     redirect_to @request_from and return true
  #   end
  # end


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
