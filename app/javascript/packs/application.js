// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
function changeTab(tabName) {
  document.getElementById("add_new_book").classList.add('tablinks');
  document.getElementById("add_new_book").classList.remove('tab_button_active');
  document.getElementById("add_new_author").classList.add('tablinks');
  document.getElementById("add_new_author").classList.remove('tab_button_active');
  document.getElementById("add_new_publication").classList.add('tablinks');
  document.getElementById("add_new_publication").classList.remove('tab_button_active');

  if (tabName == 'book') {
    document.getElementById("add_new_book").classList.remove('tablinks');
    document.getElementById("add_new_book").classList.add('tab_button_active');
  } else if (tabName == 'author') {
    document.getElementById("add_new_author").classList.remove('tablinks');
    document.getElementById("add_new_author").classList.add('tab_button_active');
  } else if (tabName == 'publication') {
    document.getElementById("add_new_publication").classList.remove('tablinks');
    document.getElementById("add_new_publication").classList.add('tab_button_active');
  }
}

function hideOtherTabContent() {
  var tabContent = document.getElementsByClassName('tab_content');

  for (var i = 0; i < tabContent.length; i++) {
    tabContent[i].style.display = 'none';
  }
}

window.onload = function () {
  hideOtherTabContent();
  var add_new_book = document.getElementById('add_new_book');

  if (add_new_book) {
    add_new_book.onclick = function () {
      changeTab('book');
      hideOtherTabContent();
      document.getElementsByClassName('book')[0].style.display = 'block';
    };
  }

  var add_new_author = document.getElementById('add_new_author');

  if (add_new_author) {
    add_new_author.onclick = function () {
      changeTab('author');
      hideOtherTabContent();
      document.getElementsByClassName('author')[0].style.display = 'block';
    };
  }

  var add_new_publications = document.getElementById('add_new_publication');

  if (add_new_publications) {
    add_new_publications.onclick = function () {
      changeTab('publication');
      hideOtherTabContent();
      document.getElementsByClassName('publication')[0].style.display = 'block';
    };
  }

  var new_author = document.getElementById('new_author');

  if (new_author) {
    new_author.onclick = function () {
      location.href = '/writers/new';
    };
  }

  var show_author = document.getElementById('show_author');

  if (show_author) {
    show_author.onclick = function () {
      location.href = '/writers';
    };
  }

  var new_book = document.getElementById('new_book');

  if (new_book) {
    new_book.onclick = function () {
      location.href = '/books/new';
    };
  }

  var show_book = document.getElementById('show_book');
  if (show_book) {
    show_book.onclick = function () {
      location.href = '/books';
    };
  }

  var new_publication = document.getElementById('new_publication');

  if (new_publication) {
    new_publication.onclick = function () {
      location.href = '/publications/new';
    };
  }

  var show_publication = document.getElementById('show_publication');
  if (show_publication) {
    show_publication.onclick = function () {
      location.href = '/publications';
    };
  }

  var search_button = document.getElementById('search_button');

  if (search_button) {
    search_button.onclick = function () {
      var xhr = new XMLHttpRequest();

      xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
          window.location.href = '/search?key=' + document.getElementById('search').value.trim()
        }
      };

      xhr.open('GET', '/search?key=' + document.getElementById('search').value.trim());
      xhr.send();
    };
  }
};