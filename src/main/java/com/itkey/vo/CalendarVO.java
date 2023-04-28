package com.itkey.vo;

public class CalendarVO {
   public String calYear;
   public String calMonth;
   public String calDay;
   public String calTime;
   public String calMemo;
   public String calNo;
   public String getCalYear() {
      return calYear;
   }
   public void setCalYear(String calYear) {
      this.calYear = calYear;
   }
   public String getCalMonth() {
      return calMonth;
   }
   public void setCalMonth(String calMonth) {
      this.calMonth = calMonth;
   }
   public String getCalDay() {
      return calDay;
   }
   public void setCalDay(String calDay) {
      this.calDay = calDay;
   }
   public String getCalTime() {
      return calTime;
   }
   public void setCalTime(String calTime) {
      this.calTime = calTime;
   }
   public String getCalMemo() {
      return calMemo;
   }
   public void setCalMemo(String calMemo) {
      this.calMemo = calMemo;
   }
   public String getCalNo() {
      return calNo;
   }
   public void setCalNo(String calNo) {
      this.calNo = calNo;
   }
   @Override
   public String toString() {
      return "CalendarVO [calYear=" + calYear + ", calMonth=" + calMonth + ", calDay=" + calDay + ", calTime="
            + calTime + ", calMemo=" + calMemo + ", calNo=" + calNo + "]";
   }
   
   
}