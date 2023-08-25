<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<br>
		<h2>
			<u>Applied Data</u>
		</h2>(Job Applications)<br>
		<br> <label>Sno :<input type="text" id="no"></label><br>
		<br> <label>name :<input type="text" id="name"></label><br>
		<br> <label>branch :<input type="text" id="branch"></label><br>
		<br> <label>po_year :<input type="text" id="year"></label><br>
		<br> <label>role :<input type="text" id="role"></label><br>
		<br> <label>ten_per :<input type="text" id="ten"></label><br>
		<br> <label>in_per :<input type="text" id="in"></label><br>
		<br> <br>

		<button id="first" onclick="First()">First</button>
		<button id="last" onclick="Last()">Last</button>
		<button id="next" onclick="Next()">Next</button>
		<button id="Prev" onclick="Prev()">Previous</button>
		<br> <br>
		<button id="Add" onclick="Add()">Add</button>
		<button id="Del" onclick="Del()">Delete</button>
		<button id="edit" onclick="Edit()">Edit</button>
		<button id="save" onclick="Save()">Save</button>
		<br> <br>
		<button id="clear" onclick="Clear()">Clear</button>
		<button id="exit" onclick="Exit()">Exit</button>
		<br> <br>
		<div id="tnq"></div>
	</center>

	<script>
		var pos = 0;
		var n;
		function Next() {
			pos += 1;
			var x = new XMLHttpRequest();
			x.open('GET', 'ApplicationServlet?button=Next&pos=' + pos, 'true');
			x.onreadystatechange = function() {
				if (x.readyState === 4) {
					var data = JSON.parse(x.responseText);
					document.getElementById("no").value = data.Sno;
					document.getElementById("name").value = data.name;
					document.getElementById("branch").value = data.branch;
					document.getElementById("po_year").value = data.po_year;
					document.getElementById("role").value = data.role;
					document.getElementById("ten").value = data.ten_per;
					document.getElementById("in").value = data.in_per;
				}
			}
			x.send();
			document.getElementById("no").readOnly=true;
			document.getElementById("name").readOnly=true;
			document.getElementById("branch").readOnly=true;
			document.getElementById("po_year").readOnly=true;
			document.getElementById("role").readOnly=true;
			document.getElementById("ten").readOnly=true;
			document.getElementById("in").readOnly=true;
			var buttons = document.getElementsByTagName("button");
			for (var i = 0; i < buttons.length; i++) {
				if (buttons[i].id === "clear" || buttons[i].id === "save"||buttons[i].id ==="Add") {
					buttons[i].disabled = true;
				} else {
					buttons[i].disabled = false; // Enable other buttons
				}
			}
		}
		function Prev() {
			pos -= 1;
			console.log(pos);
			var x = new XMLHttpRequest();
			x.open('GET', 'Servlet?button=Prev&pos=' + pos, 'true');
			x.onreadystatechange = function() {
				if (x.readyState === 4) {
					var data = JSON.parse(x.responseText);
					document.getElementById("no").value = data.Sno;
					document.getElementById("name").value = data.name;
					document.getElementById("branch").value = data.branch;
					document.getElementById("po_year").value = data.po_year;
					document.getElementById("role").value = data.role;
					document.getElementById("ten").value = data.ten_per;
					document.getElementById("in").value = data.in_per;
				}
			}
			x.send();
			var buttons = document.getElementsByTagName("button");
			for (var i = 0; i < buttons.length; i++) {
				if (buttons[i].id === "save") {
					buttons[i].disabled = true;
				} else {
					buttons[i].disabled = false; // Enable other buttons
				}
			}
			document.getElementById("no").readOnly=true;
			document.getElementById("name").readOnly=true;
			document.getElementById("branch").readOnly=true;
			document.getElementById("po_year").readOnly=true;
			document.getElementById("role").readOnly=true;
			document.getElementById("ten").readOnly=true;
			document.getElementById("in").readOnly=true;
		}
		function First() {
			var x = new XMLHttpRequest();
			x.open('GET', 'ApplicationServlet?button=First', 'true');
			x.onreadystatechange = function() {
				if (x.readyState === 4) {
					var data = JSON.parse(x.responseText);
					document.getElementById("no").value = data.Sno;
					document.getElementById("name").value = data.name;
					document.getElementById("branch").value = data.branch;
					document.getElementById("po_year").value = data.po_year;
					document.getElementById("role").value = data.role;
					document.getElementById("ten").value = data.ten_per;
					document.getElementById("in").value = data.in_per;
				}
			}
			x.send();
			pos = 0;
			var buttons = document.getElementsByTagName("button");
			for (var i = 0; i < buttons.length; i++) {
				if (buttons[i].id === "save"
						|| buttons[i].id === "Prev") {
					buttons[i].disabled = true;
				} else {
					buttons[i].disabled = false; // Enable other buttons
				}
			}
			document.getElementById("no").readOnly=true;
			document.getElementById("name").readOnly=true;
			document.getElementById("branch").readOnly=true;
			document.getElementById("po_year").readOnly=true;
			document.getElementById("role").readOnly=true;
			document.getElementById("ten").readOnly=true;
			document.getElementById("in").readOnly=true;
		}
		function Last() {
			var x = new XMLHttpRequest();
			x.open('GET', 'ApplicationServlet?button=Last', 'true');
			x.onreadystatechange = function() {
				if (x.readyState === 4) {
					var data = JSON.parse(x.responseText);
					document.getElementById("no").value = data.Sno;
					document.getElementById("name").value = data.name;
					document.getElementById("branch").value = data.branch;
					document.getElementById("po_year").value = data.po_year;
					document.getElementById("role").value = data.role;
					document.getElementById("ten").value = data.ten_per;
					document.getElementById("in").value = data.in_per;
					pos=data.len;
					console.log(pos);
				}
			}
			x.send();
			var buttons = document.getElementsByTagName("button");
			for (var i = 0; i < buttons.length; i++) {
				if (buttons[i].id === "clear" || buttons[i].id === "save"
						|| buttons[i].id === "next") {
					buttons[i].disabled = true;
				} else {
					buttons[i].disabled = false; // Enable other buttons
				}
			}
			document.getElementById("no").readOnly=true;
			document.getElementById("name").readOnly=true;
			document.getElementById("branch").readOnly=true;
			document.getElementById("po_year").readOnly=true;
			document.getElementById("role").readOnly=true;
			document.getElementById("ten").readOnly=true;
			document.getElementById("in").readOnly=true;
		}
		function Add() {
			var x = new XMLHttpRequest();
			var Sno = document.getElementById("no").value;
			var name = document.getElementById("name").value;
			var branch = document.getElementById("branch").value;
			var po_year = document.getElementById("po_year").value;
			var role = document.getElementById("role").value;
			var ten_per = document.getElementById("ten").value;
			var in_per = document.getElementById("in").value;
			x.open('GET', 'ApplicationServlet?button=Add&Sno=' + Sno + '&name=' + name
					+ '&branch=' + branch + '&po_year=' + po_year + '&role=' + role + '&ten_per=' + ten_per + '&in_per=' + in_per, 'true');
			x.onreadystatechange = function() {
				if (x.readyState === 4) {
					var data = JSON.parse(x.responseText);
				}
			}
			x.send();
		}
		function Del() {
			var x = new XMLHttpRequest();
			var Sno = document.getElementById("sno").value;
			x.open('GET', 'ApplicationServlet?button=Del&Sno=' + Sno + '&pos=' + pos,
					'true');
			x.onreadystatechange = function() {
				if (x.readyState === 4) {
					var data = JSON.parse(x.responseText);
				}
			}
			x.send();
		}
		function Edit() {
			n = document.getElementById("sno").value;
			document.getElementById("no").readOnly=false;
			document.getElementById("name").readOnly=false;
			document.getElementById("branch").readOnly=false;
			document.getElementById("po_year").readOnly=false;
			document.getElementById("role").readOnly=false;
			document.getElementById("ten").readOnly=false;
			document.getElementById("in").readOnly=false;
		}
		function Save() {
			var x = new XMLHttpRequest();
			var Sno = document.getElementById("no").value;
			var name = document.getElementById("name").value;
			var branch = document.getElementById("branch").value;
			var po_year = document.getElementById("po_year").value;
			var role = document.getElementById("role").value;
			var ten_per = document.getElementById("ten").value;
			var in_per = document.getElementById("in").value;
			x.open('GET', 'ApplicationServlet?button=Add&Sno=' + Sno + '&name=' + name
					+ '&branch=' + branch + '&po_year=' + po_year + '&role=' + role + '&ten_per=' + ten_per + '&in_per=' + in_per, 'true');
			x.onreadystatechange = function() {
				if (x.readyState === 4) {
					var data = JSON.parse(x.responseText);
				}
			}
			x.send();
		}
		function Clear() {
			document.getElementById("no").value = '';
			document.getElementById("name").value = '';
			document.getElementById("branch").value = '';
			document.getElementById("year").value = '';
			document.getElementById("role").value ='';
			document.getElementById("ten").value = '';
			document.getElementById("in").value = '';
			document.getElementById("no").readOnly=false;
			document.getElementById("name").readOnly=false;
			document.getElementById("branch").readOnly=false;
			document.getElementById("po_year").readOnly=false;
			document.getElementById("role").readOnly=false;
			document.getElementById("ten").readOnly=false;
			document.getElementById("in").readOnly=false;
		}
		function Exit() {
			Clear();
			var msg = document.getElementById("tnq");
			msg.textContent = "Thank you!";
			var buttons = document.getElementsByTagName("button");
			for (var i = 0; i < buttons.length; i++) {
				buttons[i].disabled = true;
			}
		}
	</script>
</body>
</html>