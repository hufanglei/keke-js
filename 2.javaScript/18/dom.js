(function(win){
	var dom = function dom(id){
		//初始化对象
		var dom = document.getElementById(id);
		if(!dom)return;
		//获取的所有子元素
		var childrens = dom.children;
		//返回对象
		var json= {
			obj:dom,
			index:0,
			length:childrens.length,//长度
			eq:function(i){//根据索引获得元素的值
				this.obj = childrens[i];
				this.index = i;
				return this.mix(this,childrens[i]);
			},			
			first:function(){
				return this.eq(0);
			},
			last:function(){
				return this.eq(this.length-1);
			},
			prev:function(){
				var cindex = this.index-1;
				if(cindex<0)return;
				return this.eq(cindex);
			},
			next:function(){
				var cindex = this.index+1;
				if(cindex==length)return;
				return this.eq(cindex++);
			},
			remov:function(){
				var cdom = childrens[this.index];
				cdom.style.background = "red";
				cdom.parentElement.removeChild(cdom);			
			},
			css:function(cssObj){
				for(var key in cssObj){
					var value = cssObj[key];
					if(typeof value==="number")value+="px";
					this.obj.style[key] = value;
				}
				return this;
			},
			html:function(message){
				if(message){
				  	this.obj.innerHTML = message;
				}
				return this.obj.innerHTML;
			},
			text:function(text){
				if(text){
					if(this.obj.innerText){
						this.innerText = text;
					}else{
						this.obj.textContent = text;
					}
				}
				return this.obj.innerText || this.obj.textContent;
			},
			on:function(eventType,callback){
				var jsonObj = this;
				if(document.addEventListener){
					this.obj.addEventListener(eventType,function(){
						callback.call(jsonObj.mix(jsonObj,this));
					},false);
				}else if(document.detachEvent){
					this.obj.detachEvent(eventType,function(){
						callback.call(jsonObj.mix(jsonObj,this));
					});
				}else{
					this.obj["on"+eventType] = function(){
						callback.call(jsonObj.mix(jsonObj,this));
					};
				}
				return this;
			},

			siblings:function(callback){
			   var arr = [].slice.call(childrens);
			   var jsonObj = this;
			   var objDom = jsonObj.obj;
			   var newArr = arr.filter(function(o,index){
				   if(o!=objDom){
						jsonObj.index = index;
						jsonObj.obj = o;
						callback.call(jsonObj.mix(jsonObj,o),index);
				   }					
			   });			  
			   return newArr;
			},
			background:function(color){
				this.obj.style.background = color; 
				return this;
			},
			color:function(c){
				this.obj.style.color = c; 
				return this;
			},
			fontSize:function(size){
				this.obj.style.fontSize = size + "px";
				return this;
			},
			skin:function(key,value){
				this.obj.style[key] = value;
				return this;
			},
			show:function(){
				this.obj.style["display"] = "block";
				return this;
			},
			hide:function(){
				this.obj.style["display"] = "none";
				return this;
			},
			mix:function(target,source){
				var args = [].slice.call(arguments);
				var i = 1;
				if(args.length == 1){
					return target;
				};
				while((source = args[i++])){
					for(var key in source){
						target[key] = source[key];//混入代码
					}
				}
				return target;
			}
		};
		return json;
	}
	window._ = dom;
})(window);



	