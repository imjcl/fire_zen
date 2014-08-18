$("#submit_zen_form").each ->
  console.log( $(this).children('input:text').val('') )

# COPIED FROM FROM_NEW_ZEN.JS.COFFEE
#$('#notice-modal').remove() if( $('#notice-modal').length > 0 )

$('.zen').before("<%= escape_javascript(render partial: 'notice', locals: { duplicate: @is_duplicate  } ) %>")