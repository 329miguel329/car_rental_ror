$(function() {
  $('#flash').delay(500).fadeIn('normal', function() {
    $(this).delay(5500).fadeOut();
  });
});

window.sweetAlertConfirmConfig = {
  confirmButtonColor: '#26B99A',
};

function get_full_name(oParams) {
  return `<i class='fa fa-info-circle'></i>&nbsp; <b>${oParams.code}</b> ${oParams.name}`;
}

function get_full_name_user(oParams) {
  return `<i class='fa fa-user-circle'></i>&nbsp; <b>${oParams.identification}</b> ${oParams.first_name} ${oParams.last_name}`;
}

function get_full_name_passenger(oParams) {
  return `<i class='fa fa-user'></i>&nbsp; <b>${oParams.identification}</b> ${oParams.email}`;
}