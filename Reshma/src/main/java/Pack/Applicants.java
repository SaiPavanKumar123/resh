package Pack;

import java.sql.Date;

public class Applicants {
	String name, branch, role;
	int sno, ten_per, in_per;
	Date po_year;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getTen_per() {
		return ten_per;
	}

	public void setTen_per(int ten_per) {
		this.ten_per = ten_per;
	}

	public int getIn_per() {
		return in_per;
	}

	public void setIn_per(int in_per) {
		this.in_per = in_per;
	}

	public Date getPo_year() {
		return po_year;
	}

	public void setPo_year(Date po_year) {
		this.po_year = po_year;
	}

	public Applicants(int sno, String name, String branch, String role, Date po_year, int ten_per, int in_per) {
		this.name = name;
		this.branch = branch;
		this.role = role;
		this.sno = sno;
		this.ten_per = ten_per;
		this.in_per = in_per;
		this.po_year = po_year;
	}

}
