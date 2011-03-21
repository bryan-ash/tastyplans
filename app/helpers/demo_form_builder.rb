class DemoFormBuilder < ActionView::Helpers::FormBuilder

  def text_area(method, options = {})
    add_demo_options(options)
    @template.text_area(@object_name, method, objectify_options(options))
  end

  def text_field(method, options = {})
    add_demo_options(options)
    @template.text_field(@object_name, method, objectify_options(options))
  end

  def add_demo_options(options)
    demo_warning = "Demo mode is active. Feel free to play, just be aware that you won't be allowed to save anything"
    options.merge!({:placeholder => demo_warning, :title => demo_warning}) if @template.demo_mode_active?
  end

end
