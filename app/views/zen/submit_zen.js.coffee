$(':input', '#submit_zen_form')
  .not(':submit')
  .val('')

# COPIED FROM FROM_NEW_ZEN.JS.COFFEE

$('.zen').before("<%= escape_javascript(render partial: 'notice', locals: { duplicate: @is_duplicate  } ) %>")