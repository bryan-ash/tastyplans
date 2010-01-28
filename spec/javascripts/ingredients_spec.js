require("spec_helper.js");
require("jquery.livequery.js");
require("jquery.focused.js");

Screw.Unit(function(){
  describe("Ingredients", function(){
    describe("form", function(){
      it("gives name field focus when loaded", function(){
        expect($.focused()).to(equal, $("#ingredient_name"));
      });
    });
  });
});
