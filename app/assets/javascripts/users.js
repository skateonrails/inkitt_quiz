//= require vendor/fingerprint2.min
/* global $, Fingerprint2 */

$(document).ready(function () {
  new Fingerprint2().get(function (result, components) {
    $('#device-fingerprint-hash').val(result);
  });
});
