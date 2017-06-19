/*
	ʱ�䣺2016-01-08
	���ߣ�keke
	�����ƶ�����
	dom---dom����
	json===={width:100,height:100}
	callback:�ص�����
*/
function move(dom,json,callback){
	//��ÿһ�ζ�������ȫ�µ�
	clearInterval(dom.timer);
	dom.timer = setInterval(function(){
		//����Ԫ��ִ������Ժ��״̬
		var mark = true;
		//ѭ�����ж���������
		for(var attr in json){
			var cur = null;
			//�����opacity��͸���Ķ���
			if(attr=="opacity"){
				//��ȡ�Ѿ�������͸����
				cur = getStyle(dom,attr) * 100;
			}else{
				//��ȡ�Ѿ�ִ�еľ���
				cur = parseInt(getStyle(dom,attr)) || 0;
			}
			//��ȡĿ����ֵֹ
			var target = json[attr];
			//�ٶȣ�*0.2������Ħ����
			var speed = (target - cur) *0.2;
			//���cur��ִ�й�������Ϊ�Ѿ���ȥ��С�����֡����ٶȿ��ܻ����С��λ 
			//����˵��curִ�еĵ�������ô����cur���ﲻ��Ŀ��,���ٶ��Ǵ���0����ȡ����Ȼ������+speed==Ŀ��
			//199 +1 200 ��֮����ȡ��
			speed = (speed>0 ? Math.ceil(speed): Math.floor(speed));
			if(cur != target){
				mark = false;
				if(attr=="opacity"){
					dom.style.opacity= (cur+speed)/100;
					dom.style.filter = "alpha(opacity="+((cur+speed))+")";
				}else{
					dom.style[attr]= cur+speed+"px";
				}
			}
		}
		//���ִ����ϣ�
		if(mark){
			//�������
			clearInterval(dom.timer);
			//�ص�������һ��Ҫ�������档Ҫ��Ȼ�㶯��û�йرա�
			if(callback)callback.call(dom);
		}
	},30);
}



function dom(id){
	return document.getElementById(id);
};


//��ȡcss�е���ʽ��ֵ��������������޹�
function getStyle(dom,attr){
	return window.getComputedStyle ? window.getComputedStyle(dom,false)[attr]:dom.currentStyle[attr];
};