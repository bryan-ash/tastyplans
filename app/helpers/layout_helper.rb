module LayoutHelper

  def actions
    @actions || {}
  end

  def define_actions(actions)
    @actions = actions
  end

end
