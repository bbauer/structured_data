// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require('datatables.net-bs4')

import 'bootstrap/dist/js/bootstrap';
import $ from 'jquery';
global.$ = jQuery;

$(document).ready( function () {
  $('.dtable').DataTable();

  $(".toggle").on("click",function(){
    $(this).parent().parent().find('.field-data').toggle();
  });

  // $(".comment-expand").on("click",function(){
  //  $(this).parent().parent().find('.schema-comment').toggle();
  // });
});
