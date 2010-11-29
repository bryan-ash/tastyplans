module ActiveFormHelper

  def link_to_remove_fields(name, builder)
    builder.hidden_field(:_destroy) +
      link_to_function(name, "remove_fields(this)")    
  end

  def link_to_add_fields(name, builder, association)
    new_model = builder.object.class.reflect_on_association(association).klass.new
    fields = builder.fields_for(association, new_model, :child_index => "new_#{association}") do |association_builder|
      render(association.to_s.singularize + "_fields", :builder => association_builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
