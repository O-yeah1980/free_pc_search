$(function() {

  function buildChildHTML(children) {
    var option = ``
    children.forEach(function(child) {
      option += `<option value = "${child.id}">${child.name}</option>`
    })
    var html = `<div id = "children_wrapper">
                  <select class = "dep-input-form", id = "child-form", required = "required">
                  <option value label = "選択して下さい"></option>
                  ${option}
                </div>`;
    return html;
  }

  $("#parent-form").on("change", function(e) {
    e.preventDefault();
    var parentDepartment = $("#parent-form").val();
    if(parentDepartment != 0) {
      console.log(this);
      $.ajax({
        url: "/children",
        type: "GET",
        data: {
          parent_id: parentDepartment
        },
        dataType: "json"
      })
      .done(function(children) {
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        let html = buildChildHTML(children);
        $("#pull_down_dep").append(html);
      })
      .fail(function() {
        alert("部署名選択に失敗しました。");
      })
    } else {
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  })
})