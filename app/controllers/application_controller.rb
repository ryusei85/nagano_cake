class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception


    def after_sign_in_path_for(resource)
        products_path(resource)
    end

    def after_sign_out_path_for(resource)
        root_path(resource)
    end

private
  #セッションの作成
  def current_end_user
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    current_end_user = EndUser.find_by(id: session[:cart_id])
    # Cart情報が存在しない場合、@current_cartを作成
    current_end_user = EndUser.create unless current_end_user
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:end_user_id] = current_end_user.id
    # Cart情報を返却
    current_end_user
  end
end

