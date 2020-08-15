$(function() {
  console.log(document);
  // 子カテゴリHTML作成
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
  
  // 孫カテゴリHTML作成
  function buildGrandChildHTML(grandchildren) {
    var option = ``
    grandchildren.forEach(function(grandchild) {
      option += `<option value = "${grandchild.id}">${grandchild.name}</option>`
    })
    var html = `<div id = "grandchildren_wrapper">
                  <select class = "dep-input-form", id = "grandchild-form", required = "required">
                  <option value label = "選択して下さい"></option>
                  ${option}
                </div>`;
    return html;
  }

  // 子カテゴリajax通信
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

  // 孫カテゴリajax通信
  $("#pull_down_dep").on("change", "#child-form", function(e) {
    e.preventDefault();
    var childDepartment = $("#child-form").val();
    if(childDepartment != 0) {
      $.ajax({
        url: "/grandchildren",
        type: "GET",
        data: {
          child_id: childDepartment
        },
        dataType: "json"
      })
      .done(function(grandchildren) {
        $('#grandchildren_wrapper').remove();
        let html = buildGrandChildHTML(grandchildren);
        $("#pull_down_dep").append(html);
      })
      .fail(function() {
        alert("グループ名選択に失敗しました。");
      })
    } else {
      $('#grandchildren_wrapper').remove();
    }
  })
})