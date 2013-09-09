var $ingredient_template_html = null;

function grab_ingredient_fields_template() {
  var ingredient_template = $("tr.ingredient").filter(":first").clone();
  $ingredient_template_html = ingredient_template.wrap("<div>").parent().html();
};

function hook_add_ingredient_action() {
  $("#add-ingredient").click(function(event) {
    event.preventDefault();
    var new_id = new Date().getTime();
    var regexp = new RegExp("0", "g");
    $("tr:last").after($ingredient_template_html.replace(regexp, new_id));
  });
};

function hook_remove_ingredient_action() {
  $(".remove-ingredient").each(function(){
    $(this).click(function(event) {
      event.preventDefault();
      $(this).closest("tr").hide();
    });
  });
};

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $("tr:last").after(content.replace(regexp, new_id));
}

$(document).ready(function () {
  if (!("autofocus" in document.createElement("input"))) {
    $(":text:visible:enabled:first").focus();
  }

  grab_ingredient_fields_template();
  hook_add_ingredient_action();
  hook_remove_ingredient_action();
});
