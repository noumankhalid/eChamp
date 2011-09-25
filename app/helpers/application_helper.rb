module ApplicationHelper
  def is_admin
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

  def is_promoter
    if current_user
      pro_role = Role.find(:first, :conditions => ["name = ?", "Event Promoter"])
      if current_user.roles.include?(pro_role)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def is_customer
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
