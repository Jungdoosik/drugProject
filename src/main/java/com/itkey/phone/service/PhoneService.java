package com.itkey.phone.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class PhoneService {

	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {

		String api_key = "NCSN8GMGJFHW3H5E";
	    String api_secret = "QH2ODBWNNGTNRZWQNA1QDU5NHTH665UW";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber);
		params.put("from", "02-1234-5678");
		params.put("type", "SMS");
		params.put("text", "[MedicineSearch] 인증번호 "+ randomNumber +" 를 입력하세요.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	/* https://console.coolsms.co.kr/oauth2/login cooolsms사이트 가입해서 api-key, secret_key 받아야됨 */	
	
	public int smsSchedule(String userPhoneNumber,String calTime,String calMemo) {

	      String api_key = "NCSN8GMGJFHW3H5E";
	       String api_secret = "QH2ODBWNNGTNRZWQNA1QDU5NHTH665UW";
	      Message coolsms = new Message(api_key, api_secret);

	      HashMap<String, String> params = new HashMap<String, String>();
	      params.put("to", userPhoneNumber);
	      params.put("from", "01064864033");//수정해야됨(윤경님 번호임)
	      params.put("type", "SMS");
	      params.put("text", "[MedicineSearch] 약 드실 시간입니다."+calTime+calMemo);
	      params.put("app_version", "test app 1.2"); // application name and version

	      try {
	         JSONObject obj = (JSONObject) coolsms.send(params);
	         System.out.println(obj.toString());
	         return 1;
	      } catch (CoolsmsException e) {
	         System.out.println(e.getMessage());
	         System.out.println(e.getCode());
	         return 0;
	      }
	   }
	
}
