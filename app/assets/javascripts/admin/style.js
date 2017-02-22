var ready;
ready = function() {

  /* Add here all your JS customizations */
  // datatable
  (function( $ ) {
  	'use strict';

  	var datatableInit = function() {
  		$('#datatable-kldx').dataTable();
  	};
  	$(function() {
  		datatableInit();
  	});

  }).apply( this, [ jQuery ]);

  // toggle field form in article form
  $(document).ready(function() {
    if($("#article_sponsored").is(":checked"))
      $('#featured').hide();

    $('#article_sponsored').change(function(){
      if(this.checked)
        $('#featured').hide();
      else
        $('#featured').show();
    });
  });

  // toggle field form in article form
  $(document).ready(function() {
    if($("#article_featured").is(":checked"))
      $('#sponsored_article').hide();

    $('#article_featured').change(function(){
      if(this.checked)
        $('#sponsored_article').hide();
      else
        $('#sponsored_article').show();
    });
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);
