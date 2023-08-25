package Pack;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AppDal {
	public ArrayList<Applicants> getAllEmployees() {
		ArrayList<Applicants> res = null;
		Connection c = null;
		Statement s = null;
		ResultSet rs = null;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
			s = c.createStatement();
			rs = s.executeQuery("select * from ServEmp");
			res = new ArrayList<>();
			while (rs.next()) {
				res.add(new Applicants(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
						rs.getInt(6), rs.getInt(7)));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public void Add(int s1, String s2, String s3, Date s4, String s5, int s6, int s7) {
		Connection c = null;
		PreparedStatement s = null;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
			s = c.prepareStatement("insert into job_app values(?,?,?,?,?)");
			s.setInt(1, s1);
			s.setString(2, s2);
			s.setString(3, s3);
			s.setDate(4, s4);
			s.setString(5, s5);
			s.setInt(6, s6);
			s.setInt(7, s7);
			s.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void Del(int s2) {
		Connection c = null;
		PreparedStatement s = null;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
			s = c.prepareStatement("delete from job_app where eno=?");
			s.setInt(1, s2);
			s.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void Edit(int s1, String s2, String s3, Date s4, String s5, int s6, int s7, int n) {
		Connection c = null;
		PreparedStatement s = null;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
			s = c.prepareStatement(
					"UPDATE job_app SET sno =?, name = ?, branch = ?, po_year = ?, role = ?,ten_per=?,in_per=? WHERE sno = ?");
			s.setInt(1, s1);
			s.setString(2, s2);
			s.setString(3, s3);
			s.setDate(4, s4);
			s.setString(5, s5);
			s.setInt(6, s6);
			s.setInt(7, s7);
			s.setInt(8, n);
			s.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
