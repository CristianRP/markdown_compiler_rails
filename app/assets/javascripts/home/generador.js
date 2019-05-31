$(function() {
  $('#btnCompilar').click(function() {
    console.log($('#markdownTxt').val());
    $('#tBody').empty();
    $.get('api/v1/generator',
      { markdown: $('#markdownTxt').val() },
      function(data) {
        console.log(data);
        buildTable(data.token_list);
        buildAst(data.ast); 
    });
  });

  function buildTable(data) {
    $('#tBody').append(
      $.map(data, function (token, index) {
        return '<tr><td>' + index + '</td><td>' + token.type + '</td><td>' + token.value + '</td></tr>';
    }).join());
  }

  function buildAst(ast) {
    var data = [];
    $.each(ast, function(obj, idx) {
      console.log(obj);
    });
    $('#tree1').tree({
      data: data
    });
  }

});