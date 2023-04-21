package com.itkey.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itkey.service.ApiService;
import com.itkey.service.common.PagingVo;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class ApiController {

	private static final Logger log = LoggerFactory.getLogger(ApiController.class);

	@Autowired
	private ApiService apiService;
	
	@RequestMapping("/searchDrugList")
	public String searchDrugList(@RequestParam Map<String,Object> params, 
							PagingVo vo,
							@RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage, 
							@RequestParam(value="cntPerPage", required=false, defaultValue="10")String cntPerPage, 
							ModelMap model) throws Exception {
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(nowPage, "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(cntPerPage, "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("entpName","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체명*/
	        if(params.get("searchName").equals("")){
	        	urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제품명*/
	        }else if(!(params.get("searchName").equals(""))){
	        	String data = (String) params.get("searchName");
	    		System.out.println(data);
	        	urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(data, "UTF-8")); /*제품명*/
	        }
	        urlBuilder.append("&" + URLEncoder.encode("itemSeq","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목기준코드*/
	        urlBuilder.append("&" + URLEncoder.encode("efcyQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약의 효능은 무엇입니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("useMethodQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약은 어떻게 사용합니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("atpnWarnQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("atpnQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약의 사용상 주의사항은 무엇입니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("intrcQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("seQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약은 어떤 이상반응이 나타날 수 있습니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("depositMethodQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약은 어떻게 보관해야 합니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("openDe","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*공개일자*/
	        urlBuilder.append("&" + URLEncoder.encode("updateDe","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*수정일자*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) Default:xml*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        BufferedReader bf;
	        bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
	        String result = "";
	        result = bf.readLine();
	        
	        
	        JSONParser jsonParser = new JSONParser();
	        JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
	        
	        JSONObject body = (JSONObject)jsonObject.get("body");
	        System.out.println(body);
	        int total = Integer.parseInt(String.valueOf(body.get("totalCount")) );
	        System.out.println(total);
	        
		    if (nowPage == null && cntPerPage == null) {
	    		nowPage = "1";
	    		cntPerPage = "10";
	    	} else if (nowPage == null) {
	    		nowPage = "1";
	    	} else if (cntPerPage == null) { 
	    		cntPerPage = "10";
	    	}
		    params.put("nowPage", nowPage);
		    params.put("cntPerPage", cntPerPage);
	    	vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	    	model.addAttribute("paging", vo);
	    	//model.addAttribute("viewAll", boardService.selectBoard(vo));
	        model.addAttribute("list", body);
	        model.addAttribute("params", params);
		
	        return "searchDrugList";
	}
	
	@ResponseBody
	@RequestMapping("/searchDrugListP")
	public Map<String, Object> searchDrugListP(@RequestParam Map<String,Object> params, 
							PagingVo vo,
							@RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage, 
							@RequestParam(value="cntPerPage", required=false, defaultValue="10")String cntPerPage, 
							ModelMap model) throws Exception {
		System.out.println("====================================");
		System.out.println(nowPage);
		System.out.println(cntPerPage);
		System.out.println(params);
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(nowPage, "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(cntPerPage, "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("entpName","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체명*/
	        if(params.get("searchName").equals("")){
	        	urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제품명*/
	        }else if(!(params.get("searchName").equals(""))){
	        	String data = (String) params.get("searchName");
	    		System.out.println(data);
	        	urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(data, "UTF-8")); /*제품명*/
	        }
	        urlBuilder.append("&" + URLEncoder.encode("itemSeq","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목기준코드*/
	        urlBuilder.append("&" + URLEncoder.encode("efcyQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약의 효능은 무엇입니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("useMethodQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약은 어떻게 사용합니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("atpnWarnQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("atpnQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약의 사용상 주의사항은 무엇입니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("intrcQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("seQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약은 어떤 이상반응이 나타날 수 있습니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("depositMethodQesitm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*이 약은 어떻게 보관해야 합니까?*/
	        urlBuilder.append("&" + URLEncoder.encode("openDe","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*공개일자*/
	        urlBuilder.append("&" + URLEncoder.encode("updateDe","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*수정일자*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) Default:xml*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        BufferedReader bf;
	        bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
	        String result = "";
	        result = bf.readLine();
	        
	        JSONParser jsonParser = new JSONParser();
	        JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
	        
	        JSONObject body = (JSONObject)jsonObject.get("body");
	        System.out.println(body);
	        int total = Integer.parseInt(String.valueOf(body.get("totalCount")) );
	        System.out.println(total);
	        
		    if (nowPage == null && cntPerPage == null) {
	    		nowPage = "1";
	    		cntPerPage = "10";
	    	} else if (nowPage == null) {
	    		nowPage = "1";
	    	} else if (cntPerPage == null) { 
	    		cntPerPage = "10";
	    	}
		    Map<String, Object> map = new HashMap<String, Object>();
		    map.put("p", nowPage);
		    map.put("cntPerPage", cntPerPage);
	    	vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	    	map.put("paging", vo);
	    	//model.addAttribute("viewAll", boardService.selectBoard(vo));
	    	map.put("list", body);
	        map.put("params", params);
	        
	        return map;
	}
	
	@RequestMapping("/detail")
	public String drugDetail(@RequestParam Map<String, Object> params, ModelMap model){
		System.out.println(params);
		model.addAttribute("list", params);
		return "detail";
	}

	@RequestMapping("/searchDrug") 
	public String searchDrug(@RequestParam Map<String,Object> params,ModelMap model) throws Exception {
		String data = (String) params.get("searchDrug");
		
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목명*/
	        urlBuilder.append("&" + URLEncoder.encode("entp_name","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체명*/
	        urlBuilder.append("&" + URLEncoder.encode("item_seq","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목일련번호*/
	        urlBuilder.append("&" + URLEncoder.encode("img_regist_ts","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*약학정보원 이미지 생성일*/
	        
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 페이지 결과 수*/
	        
	        urlBuilder.append("&" + URLEncoder.encode("edi_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보험코드*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) default : xml*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	    
	        BufferedReader bf;
	        bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
	        String result = "";
	        result = bf.readLine();
	        
	        System.out.println("==========");
	        System.out.println(result);
	        
	        
	       JSONParser jsonParser = new JSONParser();
	       JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
	        
	       JSONObject body = (JSONObject)jsonObject.get("body");
	       
	       model.addAttribute("list", body);
		return "searchDrug";
	}

	
		
		
	


}
