/* global Waves */

$(document).on('turbolinks:load', function () {
  Waves.attach('.wave', [ 'waves-circle', 'waves-float' ]);
  Waves.init();
});
