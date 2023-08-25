package Pack;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/Servlet")
public class ApplicationServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AppDal j = new AppDal();
		ArrayList<Applicants> res = j.getAllEmployees();
		String u = request.getParameter("button");
		if (u.equals("First")) {
			Applicants e = res.get(0);
			JSONObject jo = new JSONObject();
			jo.put("Sno", e.getSno());
			jo.put("name", e.getName());
			jo.put("branch", e.getName());
			jo.put("po_year", e.getPo_year());
			jo.put("role", e.getRole());
			jo.put("ten_per", e.getTen_per());
			jo.put("in_per", e.getIn_per());
			response.getWriter().write(jo.toString());
		} else if (u.equals("Last")) {
			Applicants e = res.get(res.size() - 1);
			JSONObject jo = new JSONObject();
			jo.put("Sno", e.getSno());
			jo.put("name", e.getName());
			jo.put("branch", e.getName());
			jo.put("po_year", e.getPo_year());
			jo.put("role", e.getRole());
			jo.put("ten_per", e.getTen_per());
			jo.put("in_per", e.getIn_per());
			response.getWriter().write(jo.toString());
		} else if (u.equals("Next")) {
			int s = Integer.parseInt(request.getParameter("pos"));
			Applicants e = res.get(s);
			JSONObject jo = new JSONObject();
			jo.put("Sno", e.getSno());
			jo.put("name", e.getName());
			jo.put("branch", e.getName());
			jo.put("po_year", e.getPo_year());
			jo.put("role", e.getRole());
			jo.put("ten_per", e.getTen_per());
			jo.put("in_per", e.getIn_per());
			response.getWriter().write(jo.toString());
		} else if (u.equals("Prev")) {
			int s = Integer.parseInt(request.getParameter("pos"));
			Applicants e = res.get(s);
			JSONObject jo = new JSONObject();
			jo.put("Sno", e.getSno());
			jo.put("name", e.getName());
			jo.put("branch", e.getName());
			jo.put("po_year", e.getPo_year());
			jo.put("role", e.getRole());
			jo.put("ten_per", e.getTen_per());
			jo.put("in_per", e.getIn_per());
			response.getWriter().write(jo.toString());
		} else if (u.equals("Add")) {
			String s2, s3, s4, s5;
			int s1, s6, s7;
			s1 = Integer.parseInt(request.getParameter("Sno"));
			s2 = request.getParameter("name");
			s3 = request.getParameter("branch");
			s4 = request.getParameter("po_year");
			s5 = request.getParameter("role");
			s6 = Integer.parseInt(request.getParameter("ten_per"));
			s7 = Integer.parseInt(request.getParameter("in_per"));
			j.Add(s1, s2, s3, s4, s5, s6, s7);
			res = j.getAllEmployees();
		} else if (u.equals("Del")) {
			int s = Integer.parseInt(request.getParameter("Sno"));
			int g = 0;
			for (int i = 0; i < res.size(); i++) {
				if (res.get(i).getSno() == s) {
					g = i;
					break;
				}
			}

			res.remove(g);
			j.Del(s);
		} else if (u.equals("Edit")) {
			String s2, s3, s4, s5;
			int s1, s6, s7, n;
			s1 = Integer.parseInt(request.getParameter("Sno"));
			s2 = request.getParameter("name");
			s3 = request.getParameter("branch");
			s4 = request.getParameter("po_year");
			s5 = request.getParameter("role");
			s6 = Integer.parseInt(request.getParameter("ten_per"));
			s7 = Integer.parseInt(request.getParameter("in_per"));
			n = Integer.parseInt(request.getParameter("num"));
			j.Edit(s1, s2, s3, s4, s5, s6, s7, n);
			res = j.getAllEmployees();
		}
	}

}
