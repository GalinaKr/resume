// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("jquery")
require("@fortawesome/fontawesome-free/js/all")
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap")

import 'src/stylesheets/application'
const images = require.context('../images', true)

import $ from "jquery"
document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
})

import 'images/icons8-search-659.png';
import 'images/bg-user-img.png';
