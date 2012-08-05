$ ->
  $('.data-table').each ->
    options = $(this).data()

    # Defaults
    options.sortColumn ?= 0
    options.sortDirection ?= 'asc'
    options.filter ?= true
    options.paginate ?= true

    $(this).dataTable
      "aaSorting": [[options.sortColumn, options.sortDirection]]
      "bFilter": options.filter
      "bPaginate": options.paginate
      "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
      "sPaginationType": "bootstrap"
