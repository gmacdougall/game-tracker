$ ->
  $('.data-table').dataTable
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
    "sPaginationType": "bootstrap"

  $('.data-table-no-pagination').dataTable
    "bFilter": false
    "bPaginate": false
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
    "sPaginationType": "bootstrap"