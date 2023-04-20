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

	// 불법 주정차 단속 정보
	/*@RequestMapping("/illegalParking")
	public String illegalParking(Model model) throws IOException, ParseException {

		List<Map<String, Object>> result = apiService.getIllegalParking();

		model.addAttribute("list", result);

		return "illegalParking";
	}

	// 공공데이터_ 주차정보제공 api
	@RequestMapping("/PrkSttusInfo")
	public String prkSttusInfo(Model model) throws Exception {
		log.debug("===========공공데이터_전국 주차api=============");

		// 공공데이터_1.주차장 시설정보 PrkSttusInfo api
		String sb = apiService.prkSttusInfo();
		log.debug("===공공데이터_1.주차장 시설정보 PrkSttusInfo api====");
		log.debug(sb);

		// JSONParser로 JSONObject로 변환
		JSONParser parser = new JSONParser();
		JSONObject jsonObjectPSI = (JSONObject) parser.parse(sb);
		Map<String, Object> mapPsi = JsonUtil.getMapFromJsonObject(jsonObjectPSI);
		log.debug("========mapPsi======");
		log.debug(mapPsi.toString());

		List<Map<String, Object>> listPsi = (List<Map<String, Object>>) mapPsi.get("PrkSttusInfo");
		log.debug("========listPsi======");
		log.debug(listPsi.size() + "");

		// 공공데이터_2.주차장 운영정보 api
		String prkOprInfo = apiService.prkOprInfo();
		log.debug("===공공데이터_2.주차장 운영정보 api====");
		log.debug(prkOprInfo);

		JSONParser parserPoi = new JSONParser();
		JSONObject jsonObjectPOI = (JSONObject) parserPoi.parse(prkOprInfo); // json 처리
		Map<String, Object> mapPoi = JsonUtil.getMapFromJsonObject(jsonObjectPOI);// json > map 처리
		log.debug("========mapPoi======");
		log.debug(mapPoi.toString());

		List<Map<String, Object>> listPoi = (List<Map<String, Object>>) mapPoi.get("PrkOprInfo"); // mapdmf list 변환
		log.debug("========listPrkOpr======");
		log.debug(listPoi.size() + "");

		// 공공데이터_3.주차장 실시간 정보 api
		String prkRealtimeInfo = apiService.prkRealtimeInfo();
		log.debug("===3.주차장 실시간 정보 api====");
		log.debug(prkRealtimeInfo);

		JSONParser parserPri = new JSONParser();
		JSONObject jsonObjectPRI = (JSONObject) parserPri.parse(prkRealtimeInfo);
		Map<String, Object> mapPri = JsonUtil.getMapFromJsonObject(jsonObjectPRI);
		log.debug("========mapPri======");
		log.debug(mapPri.toString());

		List<Map<String, Object>> listPri = (List<Map<String, Object>>) mapPri.get("PrkRealtimeInfo");
		log.debug("========listPri======");
		log.debug(listPri.size() + "");
		
		 * Object obj1 = parser.parse(jsonObjectPSI.get("PrkSttusInfo").toString());
		 * JSONArray jsonArr = (JSONArray) obj1; List<Map<String, Object>> listPsi2 =
		 * JsonUtil.getListMapFromJsonArray(jsonArr);
		 * log.debug("========listPsi======"); log.debug(listPsi.size()+"");
		 * log.debug(listPsi.get(0)+"");
		 * 
		 * List<Map<String, Object>> listPSI = new ArrayList<Map<String, Object>>();
		 * 
		 * // int sum=0; for (int i = 0; i < jsonArr.size(); i++) { JSONObject jsonObj3
		 * = (JSONObject)jsonArr.get(i); if (!((String)
		 * jsonObj3.get("prk_plce_nm")).equals("")) { // sum += 1; //
		 * System.out.println("id ::: " //
		 * +(String)jsonObj3.get("prk_center_id")+"/prk_plce_nm //
		 * :::"+(String)jsonObj3.get("prk_plce_nm")); Map<String, Object> map = new
		 * HashMap<String, Object>(); map.put("prk_cmprt_co", (String)
		 * jsonObj3.get("prk_cmprt_co")); // 주차장의 총 주차 구획 수 map.put("prk_center_id",
		 * (String) jsonObj3.get("prk_center_id")); // 주차장 관리 ID (또는 확장ID)
		 * map.put("prk_plce_entrc_la", (String) jsonObj3.get("prk_plce_entrc_la")); //
		 * 위도 map.put("prk_plce_entrc_lo", (String) jsonObj3.get("prk_plce_entrc_lo"));
		 * // 경도 map.put("prk_plce_adres", (String) jsonObj3.get("prk_plce_adres")); //
		 * 주차장 도로명 주소 (도로명주소 공백 시 지번주소) map.put("prk_plce_nm", (String)
		 * jsonObj3.get("prk_plce_nm")); // 주차장명
		 * 
		 * listPSI.add(map); // (String)jsonObj3.get("prk_center_id").equals("") } } //
		 * System.out.println("sum === " + sum);
		 
		
		
		
		model.addAttribute("listPSI", listPsi);
		//model.addAttribute("listPOI", listPoi);
		//model.addAttribute("listPRI", listPri);
		return "PrkSttusInfo";

	}
*/
}
