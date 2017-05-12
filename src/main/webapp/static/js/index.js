$(document).ready(function ($) {
    // 注册handlebars的if插件
    Handlebars.registerHelper('ifThird', function (index, options) {
       if((index+1)%3==0){
          return options.fn(this);
       }
    });
    $('#btnSearch').on('click', function () {
        var condition = {
            shelfType: $.trim($('#shelf-select').val()) || '',
            searchContent: $.trim($('#searchContent').val()) || ''
        };
        if (!condition.shelfType || !condition.searchContent) {
            alert('请输入图书信息或选择书架');
            return false;
        }
        request.getList(condition);
    });
    request.getShelf(); // 获取书架信息
    request.getList(); // 获取图书列表
    $('#shelf-select').selectBoxIt({
        showFirstOption: false
    }).on('open', function () {
        $(this).data('selectBoxSelectBoxIt').list.perfectScrollbar();
    });
});