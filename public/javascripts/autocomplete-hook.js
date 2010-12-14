jQuery(function($){

  $('input.autocomplete').each(function(){
    var input = $(this);
    input.autocomplete(input.attr('data-autocomplete-url'),{
      matchContains:1,     //also match inside of strings when caching
      removeInitialValue:0 //when first applying $.autocomplete
    });
  }); 
});
