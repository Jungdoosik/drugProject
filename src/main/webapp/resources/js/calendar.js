   const drawSelectH = () => {
      let drawHtmlH = '';
      drawHtmlH += '<select class="form-select1" id="time1" aria-label="Default select example">';
      for(let i = 0; i < 24; i++){
    	  if(i < 10){
			  i = '0' + i
		  }
    	  drawHtmlH += '<option value="'+i+'">'+i+'</option>'
      }
      drawHtmlH += '</select>';
      
      
      return drawHtmlH;
//      document.querySelector(`#modify_select_area`).innerHTML = drawHtml;
   }
   
   const drawSelectM = () => {
	      let drawHtmlM = '';
	      drawHtmlM += '<select class="form-select2" id="time2" aria-label="Default select example">';
	      for(let i = 0; i <= 59; i++){
	    	  if(i < 10){
				  i = '0' + i
			  }
	    	  drawHtmlM += '<option value="'+i+'">'+i+'</option>'
	      }
	      drawHtmlM += '</select>';
	      
	      return drawHtmlM;
//	      document.querySelector(`#modify_select_area`).innerHTML = drawHtml;
	  }

const makeCalendar = (date) => {
	
    let holiy = []
    
    var year = (date.getFullYear()).toString()
    var month = ''
    var lastDate = new Date(year, (date.getMonth() + 1), 0);
   	 if((date.getMonth() + 1).toString() < 10){
   		 month = '0' + (date.getMonth() + 1).toString()
   	 }else{
   		 month = (date.getMonth() + 1).toString()
   	 }
   	var lastDay1 = lastDate.getDate().toString()
    var xhr = new XMLHttpRequest();
	var url = 'http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getHoliDeInfo'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent(lastDay1); /**/
	queryParams += '&' + encodeURIComponent('solYear') + '=' + encodeURIComponent(year); /**/
	queryParams += '&' + encodeURIComponent('solMonth') + '=' + encodeURIComponent(month); /**/
	queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json'); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	       /* console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);*/
	       let obj = JSON.parse(this.responseText)
	       holiy = obj.response.body
	    }
	    let arr = Object.entries(holiy)
	    const currentYear = new Date(date).getFullYear();
	     const currentMonth = new Date(date).getMonth() + 1;
	     $('input[name="year"]').val(currentYear)
		 $('input[name="month"]').val(currentMonth)
	     let resultObj = [];
	     let obj = {};
	     let checkDay = [0];
	     let checkMemo = [0];
	     let checkTime = [0];
	     let checkCalNo = [0];
	     //조회
	     $.ajax({
	        url : "/getCalendar",
	        type : "get",
	        async: false,
	        data : {calYear: currentYear, calMonth:currentMonth}, //파라미터는 year, month를 객체로 던져주면 나옴.
	        success : function(json){
	           for(let i = 0; i < json.length; i++){
	              obj = {
	                 calNo: json[i].calNo,
	                 calDay: json[i].calDay,
	                 calMemo: json[i].calMemo,
	                 calTime: json[i].calTime
	              }
	              checkCalNo.push(json[i].calNo);
	              checkMemo.push(json[i].calMemo);
	              checkTime.push(json[i].calTime);
	              checkDay.push(parseInt(json[i].calDay));
	           }
	        }
	     });
	     
	     const firstDay = new Date(date.setDate(1)).getDay();
	     const lastDay = new Date(currentYear, currentMonth, 0).getDate();
	   
	     const limitDay = firstDay + lastDay;
	     const nextDay = Math.ceil(limitDay / 7) * 7;
	   
	     let htmlDummy = '';
	     for (let i = 0; i < firstDay; i++) {
	       htmlDummy += `<div class="noColor"></div>`;
	     }
	     
	     console.log("==================")
	     console.log("==================")
	     console.log(getDayOfWeek('2023-06-07'))
	     console.log("==================")
	     console.log("==================")
	     if(holiy.totalCount > 1){
			 var holiday = ''
			 var isHoliday = ''
			 for(let d = 0; d < Object.keys(holiy.items.item).length; d++){
				 if(holiday.length == 0){
					 holiday = holiy.items.item[d].locdate.toString().substr(6)
					 isHoliday = holiy.items.item[d].isHoliday
				 }else{
					 holiday += ',' + holiy.items.item[d].locdate.toString().substr(6)
					 isHoliday += ',' + holiy.items.item[d].isHoliday
				 }
    			 
    		 }
			 var cutHoliday = holiday.split(',')
			 var cutIsHoliday = isHoliday.split(',')
			 var count = 0
    		 for (let i = 1; i <= lastDay; i++) {
    			var num = i
	    		if(num < 10){
	    			num = '0' + i
	    		}
    			
				if(cutIsHoliday[count] == 'Y' && cutHoliday[count] == num){
					htmlDummy += `<div class="test" onClick="testFunc(${i})" style="color:red;">${i}`;
					count++
				}else if(getDayOfWeek(year + '-' + month + '-' + num) == '일'){
					htmlDummy += `<div class="test" onClick="testFunc(${i})" style="color:red;">${i}`;
				}else if(getDayOfWeek(year + '-' + month + '-' + num) == '토'){
					htmlDummy += `<div class="test" onClick="testFunc(${i})" style="color:blue">${i}`;
				}else{
					htmlDummy += `<div class="test" onClick="testFunc(${i})">${i}`;
				}
    			 for(let j = 1; j < checkDay.length; j ++){
			          if(i == checkDay[j]){
			             let idx = checkDay.indexOf(j)
			             htmlDummy += `<p class="overflow-ellipsis" style="color:black">${checkTime[j]} - ${checkMemo[j]}</p>`;
			          }
			       }
		       htmlDummy += `</div>`;
		     }
	     }else if(holiy.totalCount == 1){
	    	 var holiday = holiy.items.item.locdate.toString().substr(6)
			 var isHoliday = holiy.items.item.isHoliday
	    	 for (let i = 1; i <= lastDay; i++) {
	    		 var num = i
		    		if(num < 10){
		    			num = '0' + i
		    		}
	    		 if(isHoliday == 'Y' && holiday == num){
						htmlDummy += `<div class="test" onClick="testFunc(${i})" style="color:red;">${i}`;
					}else if(getDayOfWeek(year + '-' + month + '-' + num) == '일'){
						htmlDummy += `<div class="test" onClick="testFunc(${i})" style="color:red;">${i}`;
					}else if(getDayOfWeek(year + '-' + month + '-' + num) == '토'){
						htmlDummy += `<div class="test" onClick="testFunc(${i})" style="color:blue">${i}`;
					}else{
						htmlDummy += `<div class="test" onClick="testFunc(${i})">${i}`;
					}
		       
		       for(let j = 1; j < checkDay.length; j ++){
		          if(i == checkDay[j]){
		             let idx = checkDay.indexOf(j)
		             htmlDummy += `<p class="overflow-ellipsis" style="color:black">${checkTime[j]} - ${checkMemo[j]}</p>`;
		          }
		       }
		       
		       htmlDummy += `</div>`;
		     }
	     }else if(holiy.totalCount == 0){
	    	 console.log("0")
	    	 for (let i = 1; i <= lastDay; i++) {    
	    		 
	    		    if(getDayOfWeek(year + '-' + month + '-' + num) == '일'){
						htmlDummy += `<div class="test" onClick="testFunc(${i})" style="color:red;">${i}`;
					}else if(getDayOfWeek(year + '-' + month + '-' + num) == '토'){
						htmlDummy += `<div class="test" onClick="testFunc(${i})" style="color:blue">${i}`;
					}else{
						htmlDummy += `<div class="test" onClick="testFunc(${i})">${i}`;
					}
		       
		       for(let j = 1; j < checkDay.length; j ++){
		          if(i == checkDay[j]){
		             let idx = checkDay.indexOf(j)
		             htmlDummy += `<p class="overflow-ellipsis" style="color:black">${checkTime[j]} - ${checkMemo[j]}</p>`;
		          }
		       }
		       
		       htmlDummy += `</div>`;
		     }
	     }
	     
	   
	     for (let i = limitDay; i < nextDay; i++) {
	       htmlDummy += `<div class="noColor"></div>`;
	     }
	     
	     
	     document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
	     document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
	};
	xhr.send('');
	
     
     
   }
   
   const date = new Date();
   
   makeCalendar(date);
   
   // 이 함수는 HTML 문서가 로드될 때 실행됨.
   window.onload = function() {
      if(window.localStorage.getItem("loginYn") != "Y"){
    	  alert("로그인 후 이용 가능합니다.");
    	  location.href = "/login";
      }
      
      // 이전달 이동
      document.querySelector(`.prevDay`).onclick = () => {
         makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
      }
      // 다음달 이동
      document.querySelector(`.nextDay`).onclick = () => {
         makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
         
      }

   }

   //   모달창 닫기
   const closeBtn = document.getElementById('closeBtn');
   const modal = document.getElementById('modalWrap');
   
   closeBtn.onclick = function() {
      modal.style.display = 'none';
   }
   //전역으로 날짜 넣기 
   let fullDate = {
         calYear: '',
         calMonth: '',
         calDay: '',
         calTime: '',
         calMemo: '',
         timeBuilder: ''
   }; 
   
   
   function testFunc(i){
      //년, 월, 일에 해당하는 데이터 유무를 확인
      //있으면 추가 혹은 수정 분기 
      //없으면 자동으로 추가모달창 
      
      const dateTitle = document.querySelector(".dateTitle").innerText;
      i += ''; //숫자를 문자열로 변경(꼼수)
      let result = '';
      result += dateTitle + " " +  i + "일";

      let year = dateTitle.slice(0,4);
      let month = dateTitle.slice(6,7);
      let day = i;
      
      let memos = [];
      let isFlag = 0 //해당 일에 메모가 있으면 true로 바뀜
      
      $.ajax({
         url : "/getMemo",
         type : "get",
         data : {calYear: year, calMonth: month, calDay: day},
         async: false,
         success : function(json){
            //배열로옴
            memos = json;
            isFlag = json.length > 0 ? 1 : 0;
         }
      });
      
      fullDate.calYear = year;
      fullDate.calMonth = month;
      fullDate.calDay = day;
      
      if(isFlag == 1){
         
         let dynamicHtml = '';
         
         for(let i=0; i<memos.length; i++){
        	 /*$('#selectTime').children*/
        	$('#selectTime').children().remove()
            dynamicHtml += `<div id="drawDiv" style="display:flex;">`;
            dynamicHtml += drawSelectH();
            dynamicHtml += drawSelectM();
            dynamicHtml += `<input type="text" class="memo" value="${memos[i].calMemo}" style="width: 100%;">`;
            dynamicHtml += `<i id="modifyIcon" onclick="modify(${memos[i].calNo}, ${i})" class="bi bi-pencil"></i>`;
            dynamicHtml += `<i id="deleteIcon" onclick="delMemo(${memos[i].calNo}, ${i})" class="bi bi-x-square"></i>`;
            dynamicHtml += `</div>`;
            
         }
         
         document.querySelector(`#modify_area`).innerHTML = dynamicHtml;
         //수정삭제폼모달
         document.querySelector("#modalWrap_modify").style.display = 'block';
         
      }else if(isFlag == 0){
    	  let dynamicHtml = '';
    	  $('#selectTime').children().remove()
          dynamicHtml += drawSelectH();
          dynamicHtml += drawSelectM();
          $('#selectTime').append(dynamicHtml)
      }
      //time2 라는 아이디가 한개라서 제일 첫번째 요소만 변경하는 오류가 있음
      
      let time1 = document.getElementsByClassName("form-select1");      
      let time2 = document.getElementsByClassName("form-select2");  
      for(let i=0; i<memos.length; i++){
          for(let j = 0; j<time1[i].length; j++){
             if(time1[i].options[j].value === memos[i].calTime.substr(0,2)){
                time1[i].options[j].selected = true;
             }
          }
       }
      
      for(let i=0; i<memos.length; i++){
          for(let j = 0; j<time2[i].length; j++){
             if(time2[i].options[j].value === memos[i].calTime.substr(3,5)){
                time2[i].options[j].selected = true;
             }
          }
       }
      
      if(isFlag == 0){
         //등록폼모달
         modal.style.display = 'block';
      }
      
      
   }
   
   function enroll() {
      //빈값이면 등록 빈값이 아니면 등록X
      let cal_time1 = document.querySelector("#time1").value;
      let cal_time2 = document.querySelector("#time2").value;
      let cal_time = cal_time1 + ':' + cal_time2
      let prefixTime = cal_time.slice(0,1)
      
      let mediMemo = document.querySelector(".mediMemo").value;
      
      fullDate.calMemo = mediMemo;
      fullDate.calTime = cal_time;

      //timestamp 처리
      let builderTemp = '';
      builderTemp += fullDate.calYear;
      builderTemp += "-";
      
      if(fullDate.calMonth < 10){
    	  builderTemp += "0";
      }
      builderTemp += fullDate.calMonth;
      builderTemp += "-";
      
      if(fullDate.calDay< 10){
    	  builderTemp += "0";
      }
      builderTemp += fullDate.calDay;
      builderTemp += " ";
      
      fullDate.timeBuilder = builderTemp;
      fullDate.timeBuilder += fullDate.calTime + ":00";
      console.log("fullDate.timeBuilder: ",fullDate.timeBuilder);
      let test = new Date(fullDate.timeBuilder);
      console.log("test: ",test.getTime());
      
      //통신 시작
      let flag=confirm('스케줄을 등록하시겠습니까?');
      if(flag){
         $.ajax({
            url : "/enrollCalendar",
            type : "post",
            data : fullDate,
            success : function(json){
               location.reload();
            }
         });
      }
      fullDate.timeBuilder = "";
   }
   
   
   const closeModal = () => {
      document.querySelector("#modalWrap_modify").style.display = 'none';
   }
   
   const beforeEnroll = () => {
      closeModal();
   }
   
   const modify = (calNo, idx) => {
      let modifyObj = {
            "calMemo": '',
            "calTime": '',
            "calNo": ''
      }
      
      modifyObj.calMemo = document.getElementsByClassName("memo")[idx].value;
      modifyObj.calTime = document.getElementsByClassName("form-select time2")[idx].value;
      modifyObj.calNo = calNo;
      
      $.ajax({
         url : "/modifyMemo",
         type : "post",
         data : modifyObj,
         success : function(json){
            location.reload();
         }
      });      
   } 

   const addMore = () => {
      closeModal();
      document.getElementById('modalWrap').style.display = 'block';
      let dynamicHtml = '';
	  $('#selectTime').children().remove()
      dynamicHtml += drawSelectH();
      dynamicHtml += drawSelectM();
      $('#selectTime').append(dynamicHtml)
   }
   
   const delMemo = (calNo, idx) => {
      if(confirm("삭제하시겠습니까?")){
         $.ajax({
            url : "/deleteMemo",
            type : "post",
            data : {calNo: calNo},
            success : function(json){
               location.reload();
            }
         });      
      }
   }
   var aa = '2023-05-10'
   function getDayOfWeek(aa){ //ex) getDayOfWeek('2022-06-13')

	    const week = ['일', '월', '화', '수', '목', '금', '토'];

	    const dayOfWeek = week[new Date(aa).getDay()];

	    return dayOfWeek;

	}
   