$('#notice').remove() if( $('#notice').length > 0 )

$('.zen').before("<%= escape_javascript(render partial: 'notice', locals: { duplicate: @is_duplicate } ) %>")
