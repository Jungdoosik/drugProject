const makeCalendar = (date) => {
	  const currentYear = new Date(date).getFullYear();
	  const currentMonth = new Date(date).getMonth() + 1;

	  const firstDay = new Date(date.setDate(1)).getDay();
	  const lastDay = new Date(currentYear, currentMonth, 0).getDate();

	  const limitDay = firstDay + lastDay;
	  const nextDay = Math.ceil(limitDay / 7) * 7;

	  let htmlDummy = '';

	  for (let i = 0; i < firstDay; i++) {
	    htmlDummy += `<div class="noColor"></div>`;
	  }

	  for (let i = 1; i <= lastDay; i++) {    
	    htmlDummy += `<div>${i}</div>`;
	  }

	  for (let i = limitDay; i < nextDay; i++) {
	    htmlDummy += `<div class="noColor"></div>`;
	  }

	  document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
	  document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
	}


	const date = new Date();

	makeCalendar(date);

	// 이전달 이동
	document.querySelector(`.prevDay`).onclick = () => {
	makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
	}

	// 다음달 이동
	document.querySelector(`.nextDay`).onclick = () => {
	makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
	}
	
	
	const data = [
		  { date: '2023-04-15', content: '테스트1' },
		  { date: '2023-04-16', content: '테스트2' },
		  { date: '2023-04-17', content: '테스트3' },
		  { date: '2023-04-18', content: '테스트4' },
		  { date: '2023-04-19', content: '테스트5' },
		];
	
	// 데이터 가공
	const calendarList = data.reduce(
	  (acc, v) => 
	    ({ ...acc, [v.date]: [...(acc[v.date] || []), v.content] })
	  , {}
	);
	