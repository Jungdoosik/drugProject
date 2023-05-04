package com.itkey.scheduler;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.itkey.member.service.CalendarService;

@Component
public class Scheduler {
	
	@Autowired
	CalendarService cSvc;
	
	@Scheduled(cron = "0 0 00 * * *")
	public void check2400(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	
	@Scheduled(cron = "0 30 00 * * *")
	public void check2430(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	
	@Scheduled(cron = "0 0 01 * * *")
	public void check0100(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 01 * * *")
	public void check0130(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 02 * * *")
	public void check0200(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 02 * * *")
	public void check0230(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 03 * * *")
	public void check0300(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 03 * * *")
	public void check0330(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 04 * * *")
	public void check0400(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 04 * * *")
	public void check0430(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 05 * * *")
	public void check0500(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 05 * * *")
	public void check0530(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 06 * * *")
	public void check0600(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 06 * * *")
	public void check0630(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 07 * * *")
	public void check0700(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 07 * * *")
	public void check0730(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 08 * * *")
	public void check0800(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	
	@Scheduled(cron = "0 30 08 * * *")
	public void check0830(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 09 * * *")
	public void check0900(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 09 * * *")
	public void check0930(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 10 * * *")
	public void check1000(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 10 * * *")
	public void check1030(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 11 * * *")
	public void check1100(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 11 * * *")
	public void check1130(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 12 * * *")
	public void check1200(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 12 * * *")
	public void check1230(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 13 * * *")
	public void check1300(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 13 * * *")
	public void check1330(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 14 * * *")
	public void check1400(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 14 * * *")
	public void check1430(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 15 * * *")
	public void check1500(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 15 * * *")
	public void check1530(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 16 * * *")
	public void check1600(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 16 * * *")
	public void check1630(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 17 * * *")
	public void check1700(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 17 * * *")
	public void check1730(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 18 * * *")
	public void check1800(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 18 * * *")
	public void check1830(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 19 * * *")
	public void check1900(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 19 * * *")
	public void check1930(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 20 * * *")
	public void check2000(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 20 * * *")
	public void check2030(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 21 * * *")
	public void check2100(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 21 * * *")
	public void check2130(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 22 * * *")
	public void check2200(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 22 * * *")
	public void check2230(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 0 23 * * *")
	public void check2300(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}
	@Scheduled(cron = "0 30 23 * * *")
	public void check2330(){
		// [현재 날짜 및 시간 데이터 얻어오기]
		Long nowDate = System.currentTimeMillis();
		
		// [SQL 타임 스탬프 사용해 현재 및 날짜 데이터 변환 실시]
		Timestamp timeStamp = new Timestamp(nowDate);
		
		// [결과 출력 실시]
		String strStamp = String.valueOf(timeStamp.getTime());
		System.out.println("strStamp :" + strStamp );
	}		
}
