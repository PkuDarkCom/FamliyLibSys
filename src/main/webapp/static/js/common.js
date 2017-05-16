$(document).ready(function ($) {
	/* 公用事件处理 */
	var request = {
		// 获取书架列表
		getShelf: function () {
	        $.ajax({
	            url: '/book/bookShelfList',
	            method: 'get',
	            dataType: 'json',
	            success: function (resp) {
	                if (+resp.code === 1) {
	                    var options = '<option value="">按书架选择</option>';
	                    for (var i = 0; i < resp.data.length; i++) {
	                        options += '<option value="' + resp.data[i].shelfType + '">' + resp.data[i].shelfName + '</option>';
	                    }
	                    $('#shelf-select').html(options);
	                    $('#shelf-select').selectBoxIt({
					        showFirstOption: false
					    }).on('open', function () {
					        $(this).data('selectBoxSelectBoxIt').list.perfectScrollbar();
					    });
	                }
	            }
	        });
	    },
	    // 获取图书列表
	    getList: function(condition) {
	        $.ajax({
	            url: '/book/bookListData',
	            method: 'get',
	            data: condition,
	            dataType: 'json',
	            success: function (resp) {
	                if (+resp.code === 1) {
	                    var booksTemplate = Handlebars.compile($("#booksTemplate").html());
	                    $('#bookList').html(booksTemplate(resp));
	                }
	            }
	        });
	    }
	};
	window.request = request;
});