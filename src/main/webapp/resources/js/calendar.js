	const makeCalendar = (date) => {
	  const currentYear = new Date(date).getFullYear();
	  const currentMonth = new Date(date).getMonth() + 1;
	  let resultObj = [];
	  let obj = {};
	  let checkDay = [0];
	  let checkMemo = [0];
	  let checkTime = [0];
	  //조회
	  $.ajax({
		  url : "/getCalendar",
		  type : "get",
		  async: false,
		  data : {calYear: currentYear, calMonth:currentMonth}, //파라미터는 year, month를 객체로 던져주면 나옴.
		  success : function(json){
			  console.log("json >>> " , json);
			  for(let i = 0; i < json.length; i++){
				  obj = {
					  calDay: json[i].calDay,
					  calMemo: json[i].calMemo
				  }
				  checkMemo.push(json[i].calMemo);
				  checkTime.push(json[i].calTime.substr(0,5));
				  checkDay.push(parseInt(json[i].calDay));
				  
			  }
			  console.log("resultObj >>> ", resultObj);
			  console.log("checkDay >>> ", checkDay);
			  console.log("resultObj[0].calDay == 5 >>> ", resultObj[0].calDay == 5);
			  
		  }
	  });
	  
	  console.log("resultObj >>> " + resultObj );
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
	    	
	    
	    if(checkDay.indexOf(i) != -1){
	    	console.log("?", checkDay.indexOf(i).calMemo);
	    	let idx = checkDay.indexOf(i)
	    	htmlDummy += `</br>${checkTime[idx]} - ${checkMemo[idx]}`;
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
		
		// 이전달 이동
		document.querySelector(`.prevDay`).onclick = () => {
			makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
		}
		// 다음달 이동
		document.querySelector(`.nextDay`).onclick = () => {
			makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
		}
		clockFunction();
		
	}
	
	//	모달창 닫기
	const closeBtn = document.getElementById('closeBtn');
	const modal = document.getElementById('modalWrap');

	//전역으로 날짜 넣기 
	let fullDate = {
			calYear: '',
			calMonth: '',
			calDay: '',
			calTime: '',
			calMemo: ''
	}; 
	
	closeBtn.onclick = function() {
		  modal.style.display = 'none';
	}
	
	function clockFunction(){
	    $("#time1").timepicker({
	        timeFormat: 'h:mm p',
	        interval: 30,
	        minTime: '06',
	        maxTime: '23:00pm',
	        defaultTime: '06',
	        startTime: '06:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
	}
	
	function testFunc(i){
		const dateTitle = document.querySelector(".dateTitle").innerText;
		i += ''; //숫자를 문자열로 변경(꼼수)
		let result = '';
		result += dateTitle + " " +  i + "일";
		console.log('year :: ', dateTitle.slice(0,4));
		
		let year = dateTitle.slice(0,4);
		let month = dateTitle.slice(6,7);
		let day = i;
		
		fullDate.calYear = year;
		fullDate.calMonth = month;
		fullDate.calDay = day;
		
		if(month < 10){
			month = "0" + month;
		}
		
		if(day< 10){
			day = "0" + day;
		}
		
		console.log('pickYear :: ', result);
		
		modal.style.display = 'block';
	}
	
	function enroll(){
		let cal_time = document.querySelector("#time1").value;
		let prefixTime = cal_time.slice(0,1)

		if(prefixTime != 1){
			cal_time = "0" + cal_time;
		}
		
		
		let mediMemo = document.querySelector(".mediMemo").value;
		console.log(".mediMemo >>> ", mediMemo);
		
		fullDate.calMemo = mediMemo;
		fullDate.calTime = cal_time;
		
		console.log("fullDate >>> ", fullDate);
		//통신 시작
		let flag=confirm('등록하시겠습니까?');
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
	}
	
	
	