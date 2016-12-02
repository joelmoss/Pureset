/* globals Vue */

$(document).on('turbolinks:load', function () {
  Vue.component('welcome', {
    template: '<div>Hello {{name}}!</div>',
    data: function () {
      return { name: 'joel' }
    }
  })

  const app = new Vue({
    el: '#welcome'
  })
})
