class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :is_admin?
  helper_method :is_promoter?
  
  def check_permissions
    authorize! :create, :resource
  end
  
  def after_sign_in_path_for(resource_or_scope)
    home_path = "/home"
    respond_to?(home_path, true) ? send(root_path) : home_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end



  def is_admin?
    if current_user
      admin_role = Role.find(:first, :conditions => ["name = ?", "Admin"])
      if current_user.roles.include?(admin_role)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def is_promoter?
    if current_user
      pro_role = Role.find(:first, :conditions => ["name = ?", "EventPromoter"])
      if current_user.roles.include?(pro_role)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def is_customer?
    if current_user
      customer_role = Role.find(:first, :conditions => ["name = ?", "Customer"])
      if current_user.roles.include?(customer_role)
        return true
      else
        return false
      end
    else
      return false
    end
  end

end