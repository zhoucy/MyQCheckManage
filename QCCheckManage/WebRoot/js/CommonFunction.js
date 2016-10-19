/*目录*/




/*获取时间*/
/*获取当天的日期*/
function getStringToday(){
	var now=new Date();
	var year=now.getFullYear();
	var month=now.getMonth() < 9 ? "0" + (now.getMonth()+1) : (now.getMonth()+1);
	var day=now.getDate() < 10 ? "0" + now.getDate() : now.getDate();
	var today=year+"-"+month+"-"+day;
	return today;
}
/*获取当时的时间*/
function getStringTime(){
	var now=new Date();
	var year=now.getFullYear();
	var month=now.getMonth() < 9 ? "0" + (now.getMonth()+1) : (now.getMonth()+1);
	var day=now.getDate() < 10 ? "0" + now.getDate() : now.getDate();
	var hour=now.getHours()<10?"0"+now.getHours():now.getHours();
	var minute=now.getMinutes() < 10 ? "0"+now.getMinutes():now.getMinutes();
	var second=now.getSeconds()<10?"0"+now.getSeconds():now.getSeconds();
	var time=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	return time;
}
/*根据毫秒得到时间(后台穿过来的时间是json数据时用此方法)*/
function getTimeByMillisecond(value){
	if(value!=undefined){
		value=parseInt(value);
		var temp = new Date(value);
		var year=temp.getFullYear();
		var month=temp.getMonth() < 9 ? "0" + (temp.getMonth()+1) : (temp.getMonth()+1);
		var day=temp.getDate() < 10 ? "0" + temp.getDate() : temp.getDate();
		var hour=temp.getHours()<10?"0"+temp.getHours():temp.getHours();
		var minute=temp.getMinutes() < 10 ? "0"+temp.getMinutes():temp.getMinutes();
		var second=temp.getSeconds()<10?"0"+temp.getSeconds():temp.getSeconds();
		var time=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
		return time;
	}
}
/*判断databox选择的日期是不是当天*/
function isToday(value){
	if(value==getStringToday()){
		return true;
	}else{
		return false;
	}
}

/*easyui提示信息的简单封装*/
/*右下角提示框*/
function messagershow(title,msg,timeout){
	if(timeout){
		$.messager.show({title:title,msg:msg,timeout:timeout);
	}else{
		$.messager.show({title:title,msg:msg);
	}	
}
/*弹出窗口信息:default,error,info,question,warning五个级别,millisecond是多少毫秒后关闭*/
function messageralert(title,msg,level,millisecond){
	$.messager.alert(title,msg,level);
	if(millisecond){
	  setTimeout("$('.messager-body').window('close');", millisecond); 	
	}	
}


/*datagrid格式化的方法*/
/*datagrid格式化json毫秒数为时间*/
function formatTimeByMillisecond(value, row, index) {
	if (value != undefined) {
	    value = parseInt(value);
	    var temp = new Date(value);
	    var year=temp.getFullYear();
	    var month=temp.getMonth() < 9 ? "0" + (temp.getMonth()+1) : (temp.getMonth()+1);
	    var day=temp.getDate() < 10 ? "0" + temp.getDate() : temp.getDate();
	    var hour=temp.getHours()<10?"0"+temp.getHours():temp.getHours();
	    var minute=temp.getMinutes() < 10 ? "0"+temp.getMinutes():temp.getMinutes();
	    var second=temp.getSeconds()<10?"0"+temp.getSeconds():temp.getSeconds();
	    var time=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	    return time;
	}
}
/*datagrid格式化字符串时间*/
function formatTimeByString(value, row, index){
	if(value!= undefined){
        var year=value.substring(0,4);
        var month=value.substring(4,6);
        var day=value.substring(6,8);
        var hour=value.substring(8,10);
        var minute=value.substring(10,12);
        var second=value.substring(12,14);
        var time=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
		return time;
     }  
}
/*datagrid没有记录显示的信息用法:data-options="onLoadSuccess:noRecord"*/
function noRecord(data){
    if (data.total == 0) {
        var body = $(this).data().datagrid.dc.body2;
        body.find('table tbody').append(
        '<div style="width:1333px;text-align:center;color:red">没有相关记录</div>');
    }
}
/*根据元素id输入框小写变大写*/
function toUpperCaseById(id){
	$("input",$("#"+id).next("span")).keyup(function(){
        this.value = this.value.toUpperCase();
    });
}
