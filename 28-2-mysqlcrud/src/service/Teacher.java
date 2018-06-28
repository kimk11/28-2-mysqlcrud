/*2018.06.26 송유빈 Teacher DTO*/ 

package service;

public class Teacher {
	private int teacherNo;	//번호
	private String teacherName;	//이름
	private int teacherAge;		//나이
	
	
	public int getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int getTeacherAge() {
		return teacherAge;
	}
	public void setTeacherAge(int teacherAge) {
		this.teacherAge = teacherAge;
	}
	
	

	
}