   const drawSelect = () => {
      let drawHtml = '';
      drawHtml += `<select class="form-select time2" aria-label="Default select example">`;
      drawHtml += 
         `<option value="00:00">00:00</option>
         <option value="00:30">00:30</option>
         <option value="01:00">01:00</option>
         <option value="02:00">02:00</option>
         <option value="02:30">02:30</option>
         <option value="03:00">03:00</option>
         <option value="04:00">04:00</option>
         <option value="05:00">05:00</option>
         <option value="05:30">05:30</option>
         <option value="06:00">06:00</option>
         <option value="06:30">06:30</option>
         <option value="07:00">07:00</option>
         <option value="07:30">07:30</option>
         <option value="08:00">08:00</option>
         <option value="08:30">08:30</option>
         <option value="09:00">09:00</option>
         <option value="09:30">09:30</option>
         <option value="10:00">10:00</option>
         <option value="10:30">10:30</option>
         <option value="11:00">11:00</option>
         <option value="11:30">11:30</option>
         <option value="12:00">12:00</option>
         <option value="12:30">12:30</option>
         <option value="13:00">13:00</option>
         <option value="13:30">13:30</option>
         <option value="14:00">14:00</option>
         <option value="14:30">14:30</option>
         <option value="15:00">15:00</option>
         <option value="15:30">15:30</option>
         <option value="16:00">16:00</option>
         <option value="16:30">16:30</option>
         <option value="17:00">17:00</option>
         <option value="17:30">17:30</option>
         <option value="18:00">18:00</option>
         <option value="18:30">18:30</option>
         <option value="19:00">19:00</option>
         <option value="19:30">19:30</option>
         <option value="20:00">20:00</option>
         <option value="20:30">20:30</option>
         <option value="21:00">21:00</option>
         <option value="21:30">21:30</option>
         <option value="22:00">22:00</option>
         <option value="23:30">23:30</option>
         <option value="24:00">24:00</option>
         `;
      drawHtml += `</select>`;
      
      return drawHtml;
//      document.querySelector(`#modify_select_area`).innerHTML = drawHtml;
   }

const makeCalendar = (date) => {
     const currentYear = new Date(date).getFullYear();
     const currentMonth = new Date(date).getMonth() + 1;
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
   
     for (let i = 1; i <= lastDay; i++) {    
       htmlDummy += `<div class="test" onClick="testFunc(${i})">${i}`;
       
       for(let j = 1; j < checkDay.length; j ++){
          if(i == checkDay[j]){
             let idx = checkDay.indexOf(j)
             htmlDummy += `<p class="overflow-ellipsis">${checkTime[j]} - ${checkMemo[j]}</p>`;
          }
       }
       
       htmlDummy += `</div>`;
     }
   
     for (let i = limitDay; i < nextDay; i++) {
       htmlDummy += `<div class="noColor"></div>`;
     }
     
     
     document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
     document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
     
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
            dynamicHtml += `<div id="drawDiv">`;
            dynamicHtml += drawSelect();
            dynamicHtml += `<input type="text" class="memo" value="${memos[i].calMemo}">`;
            dynamicHtml += `<i id="modifyIcon" onclick="modify(${memos[i].calNo}, ${i})" class="bi bi-pencil"></i>`;
            dynamicHtml += `<i id="deleteIcon" onclick="delMemo(${memos[i].calNo}, ${i})" class="bi bi-x-square"></i>`;
            dynamicHtml += `</div>`;
            
         }
         
         document.querySelector(`#modify_area`).innerHTML = dynamicHtml;
         //수정삭제폼모달
         document.querySelector("#modalWrap_modify").style.display = 'block';
         
      }
      //time2 라는 아이디가 한개라서 제일 첫번째 요소만 변경하는 오류가 있음
      
      let time2 = document.getElementsByClassName("form-select time2");      
      for(let i=0; i<memos.length; i++){
         for(let j = 0; j<time2[i].length; j++){
            if(time2[i].options[j].value == memos[i].calTime.substr(0,5)){
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
      let cal_time = document.querySelector("#time1").value;
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
   