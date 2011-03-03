module LayoutHelper

  def can_invite?
    current_user.try(:can_invite?)
  end

end
