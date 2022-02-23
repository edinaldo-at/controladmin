$(function() {
  $('#table-control').DataTable({
      "scrollY": '50vh',
      "scrollX": true
  });

  $( "#copy-pass" ).on( "click", function(event) {
    var copyText = $('#pass').val()

    copyToClipboard( copyText );
      $('#message').append("<span id='text' >Senha copiada</span>")
      setTimeout(() => {
        $('#text').remove();
      },4000);
    });

    function copyToClipboard(text) {
      var textArea = document.createElement( "textarea" );
      textArea.value = text;
      document.body.appendChild( textArea );       
      textArea.select();
   
      try {
         var successful = document.execCommand( 'copy' );
         var msg = successful ? 'successful' : 'unsuccessful';
         console.log('Copying text command was ' + msg);
      } catch (err) {
         console.log('Oops, unable to copy',err);
      }    
      document.body.removeChild( textArea );
   }
});