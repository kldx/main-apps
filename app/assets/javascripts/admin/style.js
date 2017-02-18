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

};

$(document).ready(ready);
$(document).on('page:load', ready);
