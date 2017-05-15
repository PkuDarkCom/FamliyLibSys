$(function(){

	initPieCharts();
	initBarChart();
});
function initPieCharts() {
	
	$.ajax({
	url:'/read/readInfoStat',
	type: 'post',
	dataType: 'json',
	success: function(result) { 
		var pieChart = echarts.init(document.getElementById('pieChart'));
		
		if(result.code == 1){
			var info = result.data;
			var toread = info[0].num;
			var reading = info[1].num;
			var readed = info[2].num;
			var option = {
	    		    title : {
	    		        text: '我的图书',
	    		        subtext: '',
	    		        x:'center'
	    		    },
	    		    tooltip : {
	    		        trigger: 'item',
	    		        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    		    },
	    		    legend: {
	    		        orient: 'vertical',
	    		        left: 'left',
	    		        data: ['已读图书','在读图书','想读图书']
	    		    },
	    		    series : [
	    		        {
	    		            name: '访问来源',
	    		            type: 'pie',
	    		            radius : '55%',
	    		            center: ['50%', '60%'],
	    		            data:[
	    		                {value: readed, name:'已读图书'},
	    		                {value: reading, name:'在读图书'},
	    		                {value: toread, name:'想读图书'}
	    		            ],
	    		            itemStyle: {
	    		                emphasis: {
	    		                    shadowBlur: 10,
	    		                    shadowOffsetX: 0,
	    		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	    		                }
	    		            }
	    		        }
	    		    ]
	    		};
				pieChart.setOption(option);
			}
			if(result.code == 2){
				document.getElementById('pieChart').innerHTML="<h3 style='text-align:center; line-height:210px;'>数据加载失败...</h3>";
			}
    		
		}  
	}); 
}


function initBarChart(){
	$.ajax({
		url: '/read/readInfotTimeStat',
		type:'post',
		dataType:'json',
		success:function(result){
			var barChart = echarts.init(document.getElementById('barChart'));
			if(result.code == 1){
				var weekCount = result.data[0].weekCount;
				var monthCount = result.data[0].monthCount;
				var yearCount = result.data[0].yearCount;
				var option = {
			            title: {
			                text: '已读图书分周期统计'
			            },
			            tooltip: {},
			            legend: {
			                data:['本数']
			            },
			            xAxis: {
			                data: ["本周","本月","本年"]
			            },
			            yAxis: {
			            	data:['本数']
			            },
			            series: [{
			                name: '本数',
			                type: 'bar',
			                data: [weekCount, monthCount, yearCount]
			            }]
			        };
				barChart.setOption(option);
			}
			if(result.code == 2){
				document.getElementById('barChart').innerHTML="<h3 style='text-align:center; line-height:210px;'>数据加载失败...</h3>";
			}
		}
	});
	
}