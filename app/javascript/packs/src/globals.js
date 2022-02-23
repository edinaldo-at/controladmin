import jquery from "jquery"
window.jQuery = jquery
window.$ = jquery

$(function() {

  //fecha notificação ao clicar no botão
  $('.close').on('click', function() {
    $(".alert").alert('close')
  })

  $('.open-spinner').on('click', function(){
    $( ".spinner" ).removeClass("visible-off")
  })

  //fecha notificação após 5s
  setTimeout(() => {
    $( ".spinner" ).addClass("visible-off")
    $(".alert").alert('close')
  },5000);
})
