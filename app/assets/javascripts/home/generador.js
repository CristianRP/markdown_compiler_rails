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
        addCodeToP(data.value);
        $('#colAst').show();
        $('#rowSimbolCode').show();
    }).fail(function(data) {
      alert('Error de sintaxis');
      //console.log(data);
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
    console.log(ast.paragraphs[0].sentences)
    $.each(ast.paragraphs[0].sentences, function(obj, value) {
      console.log(value.type);
      var arr = { name: obj, children: [{name: value.type, children: [{name: value.value}]}] }
      data.push(arr);
    });
    console.log(data);
    $('#tree1').tree({
      data: data
    });
  }

  function addCodeToP(code) {
    $('#paragraph').text(code);
    $('#paragraphCode').append(code);
  }
});