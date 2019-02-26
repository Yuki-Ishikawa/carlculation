// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

// user#show用のJavaScriptを記述する
$(document).on('turbolinks:load',function(){
// 上記を記述することによって"body"の一番最後に読み込まれるのと同じ意味になる
	$('#tab-contents .tab[id != "tab1"]').hide();
	// idがtab-contentsである要素内からクラスがtabであり、id属性がtab1でない要素を隠す
	$('#tab-menu a').on('click', function() {
	  $("#tab-contents .tab").hide();
	  $("#tab-menu .active").removeClass("active");
	  $(this).addClass("active");
	  $($(this).attr("href")).show();
	  return false;
	});
});