// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import $ from 'jquery';
window.jQuery = $;
window.$ = $;
import 'jquery-ujs';

import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

document.addEventListener('turbolinks:load', function() {
  flatpickr(".datepicker", {
    // オプションを設定
    dateFormat: "Y-m-d",
    // 他の設定...
  });
});


//= require data-confirm-modal
require('data-confirm-modal')