
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>

<% 
String filepath = application.getRealPath("/WEB-INF/fortune-data.txt");
File file = new File(filepath);
FileInputStream fis = new FileInputStream(file);
InputStreamReader isr = new InputStreamReader(fis, StandardCharsets.UTF_8);
BufferedReader reader = new BufferedReader(isr);
%>
<%@include file="header.jsp" %>
<div class="w3-panel"> 
	<div class="w3-row">
	<div class="w3-col m2 w3-container"></div>
	
	
		<div class="w3-col m8 w3-container"> 
			<form class="w3-container w3-card-4 " action="" method="post"> 
				 <p> 
				    <h1>Guess by phone number</h1>
				    <label class="w3-text-grey">Please enter only the phone number:</label>
				    <input class="w3-input w3-border" type="text" name="number" required> 	  
				  </p>
				  <p> 
				    <button type="submit" class="w3-btn w3-block w3-teal" name="submit" style="width:30%">Send</button> 
				  </p>    
				     
				 <p>
					 <% if (request.getParameter("submit")!= null) { 
							String num = request.getParameter("number");
							String ct = num.substring(3, num.length());
							int cnct = Integer.parseInt(ct);
							float re = cnct / 80f;
							DecimalFormat d = new DecimalFormat("0.00");
							String dec = d.format(re).substring(4,7);
							float f = Float.parseFloat(dec)*80;
							float up = Math.round(f);
							String fstr = Float.toString(up);
							String cnfstr = fstr.substring(0,2);
							
							String str = null;
							while((str = reader.readLine()) != null) { %>
							<% if(str.substring(0, 2).equals(cnfstr)) { %>
								<div class=" w3-panel w3-leftbar w3-border-blue w3-pale-blue">
									<p><%= str %></p>
								</div>
							<% } %>
							<% 
								}
								reader.close();
							%>	
						<% } %>
						
				 </p>
				 <div class=""></div>
			 </form>
		</div> 
	<div class="w3-col m2 w3-container"></div>
	</div> 
</div>		
<%@include file="footer.jsp" %>