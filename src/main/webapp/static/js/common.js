$(document).ready(function ($) {
	/* 公用事件处理 */
	var request = {
		// 获取书架列表
		getShelf: function () {
	        // var resp = {
	        //     "code": 1,
	        //     "msg": "查询成功",
	        //     "data": [
	        //         {
	        //             "shelfType": "01",
	        //             "shelfName": "书房"
	        //         },
	        //         {
	        //             "shelfType": "02",
	        //             "shelfName": "客厅"
	        //         },
	        //         {
	        //             "shelfType": "03",
	        //             "shelfName": "卧室"
	        //         }
	        //     ]
	        // };
	        // var options = '<option value="">按书架选择</option>';
	        // for (var i = 0; i < resp.data.length; i++) {
	        //     options += '<option value="' + resp.data[i].shelfType + '">' + resp.data[i].shelfName + '</option>';
	        // }
	        // $('#shelf-select').html(options);
	        // return false;
	        
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
	                }
	            }
	        });
	    },
	    // 获取图书列表
	    getList: function(condition) {
	        // 模拟接口返回
	        // var resp = {
	        //  code: 1,
	        //  msg: '成功',
	        //  data: [{
	        //      image: 'https://img1.doubanio.com/lpic/s29402699.jpg',
	        //      bookTitle: 'javascript 框架设计',
	        //      author: '司徒正美',
	        //      brief: '框架设计框架设计框架设计框架设计框架设计'
	        //  },
	        //  {
	        //      image: 'https://img1.doubanio.com/lpic/s29402699.jpg',
	        //      bookTitle: '高性能网站建设',
	        //      author: 'Steve Souders',
	        //      brief: '高性能网站建设高性能网站建设高性能网站建设'
	        //  },
	        //  {
	        //      image: 'https://img1.doubanio.com/lpic/s29402699.jpg',
	        //      bookTitle: 'javascript 框架设计',
	        //      author: '司徒正美',
	        //      brief: '框架设计框架设计框架设计框架设计框架设计'
	        //  },
	        //  {
	        //      image: 'https://img1.doubanio.com/lpic/s29402699.jpg',
	        //      bookTitle: '高性能网站建设',
	        //      author: 'Steve Souders',
	        //      brief: '高性能网站建设高性能网站建设高性能网站建设'
	        //  },
	        //  {
	        //      image: 'https://img1.doubanio.com/lpic/s29402699.jpg',
	        //      bookTitle: 'javascript 框架设计',
	        //      author: '司徒正美',
	        //      brief: '框架设计框架设计框架设计框架设计框架设计'
	        //  },
	        //  {
	        //      image: 'https://img1.doubanio.com/lpic/s29402699.jpg',
	        //      bookTitle: '高性能网站建设',
	        //      author: 'Steve Souders',
	        //      brief: '高性能网站建设高性能网站建设高性能网站建设'
	        //  },
	        //  {
	        //      image: 'https://img1.doubanio.com/lpic/s29402699.jpg',
	        //      bookTitle: 'javascript 框架设计',
	        //      author: '司徒正美',
	        //      brief: '框架设计框架设计框架设计框架设计框架设计'
	        //  },
	        //  {
	        //      image: 'https://img1.doubanio.com/lpic/s29402699.jpg',
	        //      bookTitle: '高性能网站建设',
	        //      author: 'Steve Souders',
	        //      brief: '高性能网站建设高性能网站建设高性能网站建设'
	        //  }]
	        // }
	        // var booksTemplate = Handlebars.compile($("#booksTemplate").html());
	        // $('#bookList').html(booksTemplate(resp));
	        // return false;
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