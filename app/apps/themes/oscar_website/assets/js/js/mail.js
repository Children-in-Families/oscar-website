$(document).ready(function(){
  $form = $('#contactForm');
  return $form.submit(function() {
    var formData, email, message, name, subject;
    name = $('input#name').val();
    subject = $('input#subject').val();
    email = $('input#email').val();
    message = $('textarea#message').val();

    if(isValid(name, email, subject, message)) {
      return false;
    }

    if(name != "" || subject != "" || email != "" || message != ""){
      $('#sendMessage').attr('disabled','disabled');
      $('#sendMessage').val('Sending...')
    }

    formData = {
      name: name,
      email: email,
      subject: subject,
      message: message
    };

    $.ajax({
      type: 'POST',
      dataType: 'json',
      url: $form.attr('action'),
      data: formData,
      success: function() {
        $form[0].reset();
        $('#sendMessage').removeAttr('disabled');
        $('#sendMessage').val('Send Message')
        alert('Your message has been sent successfully. Thank you.');
        return false;
      },
      error: function() {
        $('#sendMessage').removeAttr('disabled');
        $('#sendMessage').val('Send Message')
        alert('Your message has not been sent. Please try again later!');
        return false;
      }
    });
    return false;
  });
});

function isEmpty(obj) {
  if(obj == "") {
    return true
  }
  return false;
}

function isValid(name, email, subject, sms) {
  var result = false;
  if(isEmpty(name)){
    $('input#name').addClass("is-invalid")
    $('label#text-name').removeClass('d-none')
    result = true;
  }else{
    $('input#name').removeClass("is-invalid")
    $('label#text-name').addClass('d-none')
    result = false;
  }

  if(isEmpty(email)){
    $('input#email').addClass("is-invalid")
    $('label#text-email').removeClass('d-none')
    result = true;
  }else{
    $('input#email').removeClass("is-invalid")
    $('label#text-email').addClass('d-none')
    result = false;
  }

  if(isEmpty(subject)){
    $('input#subject').addClass("is-invalid")
    $('label#text-subject').removeClass('d-none')
    result = true;
  }else{
    $('input#subject').removeClass("is-invalid")
    $('label#text-subject').addClass('d-none')
    result = false;
  }

  if(isEmpty(sms)){
    $('textarea#message').addClass("is-invalid")
    $('label#text-sms').removeClass('d-none')
    result = true;
  }else{
    $('textarea#message').removeClass("is-invalid")
    $('label#text-sms').addClass('d-none')
    result = false;
  }

  return result;
}




