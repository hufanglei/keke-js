(function(win){
		var tzAudio = {
			audioDom:null,//音乐对象
			songs:[],//音乐容器
			index:0,//播放音乐的起始位置
			
			init:function(){
				this.audioDom = document.createElement("audio");//创建一个音乐播放器
			},
			//添加音乐
			add:function(src){
				this.songs.push(src);	
				this.audioDom.src = this.songs[this.index];
			},
			
			play:function(){
				this.audioDom.play();
			},
			//播放音乐
			playMusic:function(){
				this.audioDom.src = this.songs[this.index];
				this.audioDom.play();
			},
			//暂停音乐
			stop:function(){
				this.audioDom.pause();
			},
			time:function(callback){
				var $this = this;
				this.audioDom.oncanplaythrough = function(){
					var totalTime = this.duration;
					var timer = $this.formateTime(totalTime);
					//如果想把这个audioDom进行处理，就用call方法用this传出去
					//if(callback)callback.call(this,time);
					//如果只想返回几个参数，不想返回整个audioDom，可以自己定义对象传出去
					var json ={
						duration:totalTime,
						time:timer
					}
					if(callback)callback.call(json);
				};
			},
			formateTime:function(time){
				var m = parseInt(time / 60);
				var s = parseInt(time % 60);
				var time =  (m<10?("0"+m):m)+":"+(s<10?("0"+s):s);
				return time;
			},
			shound:function(){
			
			},
			prev:function(){
				this.index--;
				if(this.index<0){
					this.index =this.songs.length-1;
				}
				this.playMusic();
			},
			next:function(){
				this.index++;
				if(this.index>= this.songs.length){
					this.index =0;
				}
				this.playMusic();
			},
			percent:function(callback){
				var $this = this;
				this.audioDom.ontimeupdate = function(){
					//不管任何百分计算，都是增量/总进度 *100
					//播放时间/总时长
					var per = Math.floor(this.currentTime/this.duration*100);
					//剩余时间:
					var stime = this.duration - this.currentTime;
					var timer = $this.formateTime(stime);
					var json = {
						per:per,
						time:timer
					};
					if(callback)callback.call(json);
				}
			},
		}
	win.tzAudio = tzAudio;
})(window);
	