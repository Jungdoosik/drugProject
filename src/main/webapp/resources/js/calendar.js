//전역으로 날짜 넣기
let fullDate = {
  calYear: "",
  calMonth: "",
  calDay: "",
  calTime: "",
  calMemo: "",
  timeBuilder: "",
};

// Hour 그리기 함수
const drawSelectH = () => {
  let drawHtmlH = "";
  drawHtmlH +=
    '<select class="form-select1" id="time1" aria-label="Default select example">';
  for (let i = 0; i < 24; i++) {
    if (i < 10) {
      i = "0" + i;
    }
    drawHtmlH += '<option value="' + i + '">' + i + "</option>";
  }
  drawHtmlH += "</select>";

  return drawHtmlH;
};
// Minute 그리기 함수
const drawSelectM = () => {
  let drawHtmlM = "";
  drawHtmlM +=
    '<select class="form-select2" id="time2" aria-label="Default select example">';
  for (let i = 0; i <= 59; i++) {
    if (i < 10) {
      i = "0" + i;
    }
    drawHtmlM += '<option value="' + i + '">' + i + "</option>";
  }
  drawHtmlM += "</select>";

  return drawHtmlM;
};

// 달력을 그리는 함수 시작
const makeCalendar = (date) => {
  let holiy = []; // 휴일을 담을 배열 생성

  // API로 년, 월, 일을 보내 휴일을 받아오는 처리 시작 
  let year = date.getFullYear().toString();
  let month = "";
  let lastDate = new Date(year, date.getMonth() + 1, 0);
  if ((date.getMonth() + 1).toString() < 10) {
    month = "0" + (date.getMonth() + 1).toString();
  } else {
    month = (date.getMonth() + 1).toString();
  }
  let lastDay1 = lastDate.getDate().toString();
  let xhr = new XMLHttpRequest();
  let url =
    "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getHoliDeInfo"; /*URL*/
  let queryParams =
    "?" +
    encodeURIComponent("serviceKey") +
    "=" +
    "wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D"; /*Service Key*/
  queryParams +=
    "&" + encodeURIComponent("pageNo") + "=" + encodeURIComponent("1"); /**/
  queryParams +=
    "&" +
    encodeURIComponent("numOfRows") +
    "=" +
    encodeURIComponent(lastDay1); /**/
  queryParams +=
    "&" + encodeURIComponent("solYear") + "=" + encodeURIComponent(year); /**/
  queryParams +=
    "&" + encodeURIComponent("solMonth") + "=" + encodeURIComponent(month); /**/
  queryParams +=
    "&" + encodeURIComponent("_type") + "=" + encodeURIComponent("json"); /**/
  xhr.open("GET", url + queryParams);
  xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
      /* console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);*/
      let obj = JSON.parse(this.responseText);
      holiy = obj.response.body;
    }
    let arr = Object.entries(holiy);
  // API로 년, 월, 일을 보내 휴일을 받아오는 처리 끝
  
    const currentYear = new Date(date).getFullYear();
    const currentMonth = new Date(date).getMonth() + 1;
    $('input[name="year"]').val(currentYear);
    $('input[name="month"]').val(currentMonth);
    let resultObj = [];
    let obj = {};
    
    let checkDay = [0];         // checkDay는 메모가 저장된 일자가 담긴 배열 
    let checkMemo = [0];        // checkMemo는 일자에 저장된 메모
    let checkTime = [0];        // checkTime 일자에 저장된 시간
    let checkCalNo = [0];       // checkCalNo 일자에 저장된 메모 데이터의 고유 Key 담긴 배열
    //조회
    $.ajax({
      url: "/getCalendar",
      type: "get",
      async: false,
      data: { calYear: currentYear, calMonth: currentMonth }, //파라미터는 year, month를 객체로 던져주면 나옴.
      success: function (json) {
        for (let i = 0; i < json.length; i++) {
          obj = {
            calNo: json[i].calNo,
            calDay: json[i].calDay,
            calMemo: json[i].calMemo,
            calTime: json[i].calTime,
          };
          checkCalNo.push(json[i].calNo);
          checkMemo.push(json[i].calMemo);
          checkTime.push(json[i].calTime);
          checkDay.push(parseInt(json[i].calDay));
        }
      },
    });

    // 해당 월에 첫째 날과 마지막 날의 요일을 구한다.
    // 일요일은 "0" 토요일은 "6"
    // ex. 4월 1일은 토요일이다. 첫째주 일~금 까지는 모두 나타내어선 안된다.
    // class="noColor" 를 이용하여 해당 달력을 비운다.
    const firstDay = new Date(date.setDate(1)).getDay(); 
    const lastDay = new Date(currentYear, currentMonth, 0).getDate();

    const limitDay = firstDay + lastDay;
    const nextDay = Math.ceil(limitDay / 7) * 7;

    let htmlDummy = ""; // 그려줄 달력 변수를 선언

    // 첫째주 1일 전까지 모두 빈칸으로 그려줌
    for (let i = 0; i < firstDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }

    if (holiy.totalCount > 1) {
      let holiday = "";
      let isHoliday = "";
      for (let d = 0; d < Object.keys(holiy.items.item).length; d++) {
        if (holiday.length == 0) {
          holiday = holiy.items.item[d].locdate.toString().substr(6);
          isHoliday = holiy.items.item[d].isHoliday;
        } else {
          holiday += "," + holiy.items.item[d].locdate.toString().substr(6);
          isHoliday += "," + holiy.items.item[d].isHoliday;
        }
      }
      let cutHoliday = holiday.split(",");
      let cutIsHoliday = isHoliday.split(",");
      let count = 0;
      for (let i = 1; i <= lastDay; i++) {
        let num = i;
        if (num < 10) {
          num = "0" + i;
        }
  
        if (cutIsHoliday[count] == "Y" && cutHoliday[count] == num) {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})" style="color:red;">${i}`;
          count++;
          } else if (getDayOfWeek(year + "-" + month + "-" + num) == "일") {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})" style="color:red;">${i}`;
          } else if (getDayOfWeek(year + "-" + month + "-" + num) == "토") {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})" style="color:blue">${i}`;
        } else {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})">${i}`;
        }
        for (let j = 1; j < checkDay.length; j++) {
          if (i == checkDay[j]) {
            let idx = checkDay.indexOf(j);
            htmlDummy += `<p class="overflow-ellipsis" style="color:black">${checkTime[j]} - ${checkMemo[j]}</p>`;
          }
        }
        htmlDummy += `</div>`;
      }
    } else if (holiy.totalCount == 1) {
      let holiday = holiy.items.item.locdate.toString().substr(6);
      let isHoliday = holiy.items.item.isHoliday;
      for (let i = 1; i <= lastDay; i++) {
        let num = i;
        if (num < 10) {
          num = "0" + i;
        }
        if (isHoliday == "Y" && holiday == num) {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})" style="color:red;">${i}`;
        } else if (getDayOfWeek(year + "-" + month + "-" + num) == "일") {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})" style="color:red;">${i}`;
        } else if (getDayOfWeek(year + "-" + month + "-" + num) == "토") {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})" style="color:blue">${i}`;
        } else {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})">${i}`;
        }

        for (let j = 1; j < checkDay.length; j++) {
          if (i == checkDay[j]) {
            let idx = checkDay.indexOf(j);
            htmlDummy += `<p class="overflow-ellipsis" style="color:black">${checkTime[j]} - ${checkMemo[j]}</p>`;
          }
        }

        htmlDummy += `</div>`;
      }
    } else if (holiy.totalCount == 0) {
      console.log("0");
      for (let i = 1; i <= lastDay; i++) {
        if (getDayOfWeek(year + "-" + month + "-" + num) == "일") {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})" style="color:red;">${i}`;
        } else if (getDayOfWeek(year + "-" + month + "-" + num) == "토") {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})" style="color:blue">${i}`;
        } else {
          htmlDummy += `<div class="test" onClick="달력클릭(${i})">${i}`;
        }

        for (let j = 1; j < checkDay.length; j++) {
          if (i == checkDay[j]) {
            let idx = checkDay.indexOf(j);
            htmlDummy += `<p class="overflow-ellipsis" style="color:black">${checkTime[j]} - ${checkMemo[j]}</p>`;
          }
        }

        htmlDummy += `</div>`;
      }
    }
    // 해당 달에서 마지막 일자부터 달력 끝까지 noColor 처리
    // ex. 5월 31일은 마지막 일자이고 수요일이다. 
    // 달력의 끝인 토요일까지는 아무것도 처리가 되어선 안된다.
    for (let i = limitDay; i < nextDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }

    // 그려준 달력을 dateBoard 클래스에 넣어줌.
    document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
    // 달력 중간 상단에 년,월 표기 처리
    document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
  };
  xhr.send("");
};
// makeCalendar 끝

// 오늘 날짜로 달력을 그린다.
const date = new Date();
makeCalendar(date);

// 이 함수는 HTML 문서가 로드될 때 실행됨.
// 로그인 유효성검사 & 이전 달, 다음 달 이동 이벤트 붙이기
window.onload = function () {
  if (window.localStorage.getItem("loginYn") != "Y") {
    alert("로그인 후 이용 가능합니다.");
    location.href = "/login";
  }

  // 이전달 이동
  document.querySelector(`.prevDay`).onclick = () => {
    makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
  };
  // 다음달 이동
  document.querySelector(`.nextDay`).onclick = () => {
    makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
  };
};

//   모달창 닫기
const closeBtn = document.getElementById("closeBtn");
const modal = document.getElementById("modalWrap");

closeBtn.onclick = function () {
  modal.style.display = "none";
};

/**
 * 선택한 일자에 존재하는 메모를 DB에서 가져온다.
 * 선택한 일자에 메모가 존재한다면 일정 폼에다가 그려준다.
 * @param i 달력에 있는 Date(일자)이다. (ex. 2023년 05월 09일 의 i는 "9")
 */
const 달력클릭 = (i) => {
  // 사용자가 선택한 년,월,일 셋팅 시작
  const dateTitle = document.querySelector(".dateTitle").innerText;
  i += ""; // 숫자를 문자열로 변경
  let result = "";
  result += dateTitle + " " + i + "일";

  let year = dateTitle.slice(0, 4);
  let month = dateTitle.slice(6, 7);
  let day = i;
  // 사용자가 선택한 년,월,일 셋팅 끝

  let memos = []; // 선택한 년,월,일에 저장되어 있는 모든 데이터를 담을 배열

  // 사용자가 선택한 일자에 저장된 메모가 있는지 조회 
  $.ajax({
    url: "/getMemo",
    type: "get",
    data: { calYear: year, calMonth: month, calDay: day },
    async: false,
    success: function (json) {
      memos = json; // 년,월,일에 저장된 
    },
  });

  fullDate.calYear = year;
  fullDate.calMonth = month;
  fullDate.calDay = day;

  if (memos) {
    let dynamicHtml = "";

    // 일정폼 그리기 시작
    for (let i = 0; i < memos.length; i++) {
      $("#selectTime").children().remove(); // 가산연산자로 그려주기 때문에 이미 존재하고 있는 노드들 삭제
      dynamicHtml += `<div id="drawDiv" style="display:flex;">`;
      dynamicHtml += drawSelectH(); // 시간을 선택하는 드랍박스 
      dynamicHtml += drawSelectM(); // 분을 선택하는 드랍박스 
      dynamicHtml += `<input type="text" class="memo" value="${memos[i].calMemo}" style="width: 100%;">`; 
      dynamicHtml += `<i id="modifyIcon" onclick="modify(${memos[i].calNo}, ${i})" class="bi bi-pencil"></i>`;
      dynamicHtml += `<i id="deleteIcon" onclick="delMemo(${memos[i].calNo}, ${i})" class="bi bi-x-square"></i>`;
      dynamicHtml += `</div>`;
    }
    // 일정폼 그리기 끝

    // DB에 있는 메모를 그려준 HTML 변수 => dynamicHtml
    // dynamicHtml을 숨겨둔 팝업에다가 노드를 추가한다.
    document.querySelector(`#modify_area`).innerHTML = dynamicHtml;

    // 추가한 뒤 block 처리
    document.querySelector("#modalWrap_modify").style.display = "block";

  } 
  
  // 메모가 없을 때 일정폼 처리
  if (!memos) {
    let dynamicHtml = "";
    $("#selectTime").children().remove();
    dynamicHtml += drawSelectH();
    dynamicHtml += drawSelectM();
    $("#selectTime").append(dynamicHtml);
  }

  // DB에 저장된 시간에 맞게 Default 셋팅하기 위한 처리 시작
  let time1 = document.getElementsByClassName("form-select1");
  let time2 = document.getElementsByClassName("form-select2");
  for (let i = 0; i < memos.length; i++) {
    for (let j = 0; j < time1[i].length; j++) {
      if (time1[i].options[j].value === memos[i].calTime.substr(0, 2)) {
        time1[i].options[j].selected = true; //사용자가 선택하여 저장한 time1('시')을 default 처리해주기 위해 true로 처리
      }
    }
  }

  for (let i = 0; i < memos.length; i++) {
    for (let j = 0; j < time2[i].length; j++) {
      if (time2[i].options[j].value === memos[i].calTime.substr(3, 5)) {
        time2[i].options[j].selected = true; //사용자가 선택하여 저장한 time2('분')을 default 처리해주기 위해 true로 처리
      }
    }
  }
  // DB에 저장된 시간에 맞게 Default 셋팅하기 위한 처리 끝

  // memo가 없는 경우는 수정폼이 아닌 등록폼이 팝업
  if (!memos) {
    //등록폼모달
    modal.style.display = "block";
  }
};

/**
 * * 일정 등록함수
 * ! 문자 스케줄러을 위한 Timestamp 추가
 * ! 달, 일이 10 미만인 경우 제일 앞에 "0" 추가해줌
 */
const enroll = () => {
  //빈값이면 등록 빈값이 아니면 등록X
  let cal_time1 = document.querySelector("#time1").value;
  let cal_time2 = document.querySelector("#time2").value;
  let cal_time = cal_time1 + ":" + cal_time2;

  let mediMemo = document.querySelector(".mediMemo").value;

  fullDate.calMemo = mediMemo;
  fullDate.calTime = cal_time;

  //timestamp 처리
  let builderTemp = "";
  builderTemp += fullDate.calYear;
  builderTemp += "-";

  // 등록한 달이 10월 이하 인 경우 (ex. 9월 -> 09월)
  // 숫자로 인식하기 때문에 "0" 을 추가해준다.
  if (fullDate.calMonth < 10) {
    builderTemp += "0";
  }
  builderTemp += fullDate.calMonth;
  builderTemp += "-";

  if (fullDate.calDay < 10) {
    builderTemp += "0";
  }
  builderTemp += fullDate.calDay;
  builderTemp += " ";

  fullDate.timeBuilder = builderTemp;
  fullDate.timeBuilder += fullDate.calTime + ":00";
  let test = new Date(fullDate.timeBuilder);

  //통신 시작
  let flag = confirm("스케줄을 등록하시겠습니까?");
  if (flag) {
    $.ajax({
      url: "/enrollCalendar",
      type: "post",
      data: fullDate,
      success: function (json) {
        location.reload();
      },
    });
  }
  fullDate.timeBuilder = "";
};

/**
 * 모달 공통 닫기 함수
 */
const closeModal = () => {
  document.querySelector("#modalWrap_modify").style.display = "none";
};

const beforeEnroll = () => {
  closeModal();
};

/**
 * 특정 요일에 이미 저장된 일정을 수정하는 함수
 * @param calNo 달력 DB 고유 Key
 * @param idx 해당 요일의 선택한 일정의 순서(추가등록한 일정 index)
 */
const modify = (calNo, idx) => {
  let modifyObj = {
    calMemo: "",
    calTime: "",
    calNo: "",
  };

  modifyObj.calMemo = document.getElementsByClassName("memo")[idx].value;
  modifyObj.calTime =
    document.getElementsByClassName("form-select time2")[idx].value;
  modifyObj.calNo = calNo;

  $.ajax({
    url: "/modifyMemo",
    type: "post",
    data: modifyObj,
    success: function (json) {
      location.reload();
    },
  });
};

/**
 * 일정이 등록되어 있는 경우 >
 * '추가 등록' 함수(수정모달폼) > 등록모달창
 */
const addMore = () => {
  closeModal();
  document.getElementById("modalWrap").style.display = "block";
  let dynamicHtml = "";
  $("#selectTime").children().remove();
  dynamicHtml += drawSelectH();
  dynamicHtml += drawSelectM();
  $("#selectTime").append(dynamicHtml);
};

/**
 * calNo를 넣어 DB에서 해당 데이터 삭제
 * @param {*} calNo 달력 데이터 고유 Key
 */
const delMemo = (calNo) => {
  if (confirm("삭제하시겠습니까?")) {
    $.ajax({
      url: "/deleteMemo",
      type: "post",
      data: { calNo: calNo },
      success: function (json) {
        location.reload();
      },
    });
  }
};

/**
 * ex) getDayOfWeek('2022-06-13')
 * @param  param 년-월-일
 * @returns 파라미터 날짜의 요일을 출력
 */
const getDayOfWeek = (param) => {
  const week = ["일", "월", "화", "수", "목", "금", "토"];
  const dayOfWeek = week[new Date(param).getDay()];
  return dayOfWeek;
};
