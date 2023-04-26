package com.itkey.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itkey.vo.CalendarVO;

public interface CalendarService {
	public int enroll(CalendarVO cVo);
	
	public List<CalendarVO> getCalendar(CalendarVO cVo);
}
