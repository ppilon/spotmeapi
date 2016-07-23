module Authenticable

  # Devise methods overwrites
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end
  def current_admin
    @current_admin ||= Admin.find_by(auth_token: request.headers['Authorization'])
  end
  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present? || current_admin.present?
  end
  def user_signed_in?
    current_user.present?
  end
  def admin_signed_in?
    current_admin.present?
  end
end