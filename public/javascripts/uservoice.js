$(document).ready(function () {
  $(".contact_us").bind("mouseover", function(){
    UserVoice.Popin.preload();
  });
  $(".contact_us").bind("click", function(){
    UserVoice.Popin.show();
    return false;
  });
});
var uservoiceOptions = {
  key: 'ohmabel',
  host: 'ohmabel.uservoice.com', 
  forum: '81175',
  lang: 'en',
  showTab: true,
  alignment: 'right',
  background_color:'#f00',
  text_color: 'white',
  hover_color: '#06C',
  lang: 'en'
};

function _loadUserVoice() {
  var s = document.createElement('script');
  s.setAttribute('type', 'text/javascript');
  s.setAttribute('src', ("https:" == document.location.protocol ? "https://" : "http://") + "cdn.uservoice.com/javascripts/widgets/tab.js");
  document.getElementsByTagName('head')[0].appendChild(s);
}
_loadSuper = window.onload;
window.onload = (typeof window.onload != 'function') ? _loadUserVoice : function() { _loadSuper(); _loadUserVoice(); };
