//28기 김진우
//2018-06-26
//employeeaddr DTO(Bean) 작성
package service;

public class EmployeeAddr {
	private int employeeAddrNo;
	private	int employeeNo;
	private String employeeAddrContent;
	
	public int getEmployeeAddrNo() {
		return employeeAddrNo;
	}
	public void setEmployeeAddrNo(int employeeAddrNo) {
		this.employeeAddrNo = employeeAddrNo;
	}
	public int getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}
	public String getEmployeeAddrContent() {
		return employeeAddrContent;
	}
	public void setEmployeeAddrContent(String employeeAddrContent) {
		this.employeeAddrContent = employeeAddrContent;
	}
	
}
