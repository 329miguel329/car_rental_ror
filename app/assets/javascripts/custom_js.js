$(function() {
  $('#flash').delay(500).fadeIn('normal', function() {
    $(this).delay(5500).fadeOut();
  });
});
window.sweetAlertConfirmConfig = {
  confirmButtonColor: '#26B99A',
};