# Self clearing, because a second button click should remove it if the quote is good to go.
$('#notice').remove() if( $('#notice').length > 0 )

$('.zen').before("<%= escape_javascript(render partial: 'notice', locals: { duplicate: @is_duplicate } ) %>")
