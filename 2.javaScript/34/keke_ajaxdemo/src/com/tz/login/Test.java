package com.tz.login;

import java.util.HashMap;
import java.util.List;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;

public class Test {
	public static void main(String[] args) throws JSONException {
		String jsonString = "[{\"username\":\"1235&age=5\",\"age\":\"25\",\"email\":\"5256@qqcom\",\"address\":\"22335\"},{\"username\":\"1235\",\"age\":\"25\",\"email\":\"5256@qqcom\",\"address\":\"22335\"}]";
		List<HashMap<String,Object>> maps = (List<HashMap<String, Object>>) JSONUtil.deserialize(jsonString);
		for (int i = 0; i < maps.size(); i++) {
			System.out.println(maps.get(0).get("username"));
			System.out.println(maps.get(0).get("age"));
			System.out.println(maps.get(0).get("email"));
			System.out.println(maps.get(0).get("address"));
			System.out.println("================");
		}
		
		//将对象序列化为json字符串
		String jsonStr = JSONUtil.serialize(maps);
		System.out.println(jsonStr);
	}
}
