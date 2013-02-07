jQuery ->
  # Activate first category tab
  $tabs = $('#cat-tabs')
  $('.nav-tabs li:first-child', $tabs).addClass 'active'
  $('.tab-content .tab-pane:first-child', $tabs).addClass 'active'
  