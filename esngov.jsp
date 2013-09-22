<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String accountid=request.getParameter("accountid");  
String userAccout=request.getParameter("userAccout");
if(accountid ==null||userAccout==null){
	accountid= (String) session.getAttribute("accountid");
	userAccout= (String) session.getAttribute("userAccout");
}else{
session.setAttribute("accountid",accountid);  
session.setAttribute("userAccout",userAccout);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ESN GOV Page</title>
<LINK rel="shortcut icon" href="images/favicon.ico">
<LINK rel=stylesheet type=text/css href="css/esngov.css">
<LINK rel=stylesheet type=text/css href="css/global.css">
<script src="js/jquery-2.0.3.min.js" type="text/javascript"></script>
<script src="js/apis.js" type="text/javascript"></script>
<SCRIPT language=JavaScript type=text/JavaScript
	src="js/esngovscript.js"></SCRIPT>
<script src="js/global.js" type="text/javascript"></script>
</head>
<body>
<input type="hidden" name="accountid" value="<%=accountid %>">
	<DIV id=container>
<jsp:include page="header.jsp"></jsp:include>
		<DIV id=maincontent>
			<DIV id=main>
				<DIV id=index_top>
					<DIV class=leftpan>
						<DIV id=itpic>
							<IMG src="images/ENS4.png">
						</DIV>
						<DIV id=pic>
							<DIV id=login>
								<H1>Netkeeper</H1>
							</DIV>
							<P>
								Last Updated:<SPAN class="yesterday"> 21 Jan 2013</SPAN>
							</P>
						</DIV>
						<DIV class=showpic>
							<P>Don't Lose the control your enterprise social network</P>
							<p>Social Enabled SharePoint 2013 kicks off the trend of
								enterprise transformation to social collaboration. It has been
								proved by the case of yammer acquisition . Now SharePoint 2013
								is not only providing a social based document sharing, it is
								actually providing a platform for enterprise social network.</p>
							<p>As we know Social Network could help business growth in
								several way like social marketing, social customer care. However
								the social media operation is not a cost free task, it is
								expensive and will require continuous effort investment. For
								example BTO has already provided a professional outsourcing
								service named HP Social Enterprise Service to help end customers
								operating their social media effectively.</p>
							<p>The enterprise social network will have the similar
								challenge. If you have a deeply insight on HP Connects, you will
								find that the ESN could not growth without encouragement,
								motivation, evaluation and management. Sharepoint 2013 is
								different from those outbound social media, it is focusing on
								the inbound social media. It cause the different management
								requirement like outbound social media. We could not directly
								use the external social media tool to resolve this problem
								directly.</p>
							<p>By using the SharePoint 2013 as ESN Platform, How does the
								enterprise social network community manager encourage the growth
								of network and help the owner to control the network
								effectively? It is not resolved by SharePoint 2013 itself and it
								is also not the direction of it.</p>
						</DIV>
					</DIV>
					<DIV class=rightpan>
						<DIV class=mail>
							<UL>
								<LI class=twitter><A class=myemail
									href="https://twitter.com/EIST4Contact">Follow us on
										twitter</A>
								<LI class=email><A class=myemail
									href="mailto:CONTACT.EIST@hp.com">Contact us with mail</A>
								<LI class=youtube><A
									href="http://www.youtube.com/user/EIST4CONTACT/">View us On
										Youtube</A></LI>
							</UL>
						</DIV>
						<DIV class=urls></DIV>
					</DIV>
				</DIV>
				<DIV id=bottomtabs>
					<DIV id=tabmenu>
						<DL id=tab1>
							<A class=on
								onClick="switchTab('tab1','con1');this.blur();return false;"
								href="#">Offering details</A>
						</DL>
						<DL id=tab2>
							<A onClick="switchTab('tab2','con2');this.blur();return false;"
								href="#">Support Mode</A>
						</DL>
						<DL id=tab3>
							<A onClick="switchTab('tab3','con3');this.blur();return false;"
								href="#">Contact</A>
						</DL>
					</DIV>
					<DIV id=con1>
						<h3>Encourage your network manage your network</h3>
						<p>Netkeeper is a supplement tool. It is purely focusing on
							enterprise social network which is based on SharePoint 2013 and
							used for the inbound social media management. It provides an
							automation , visualization and collaboration way to resolve the
							ESN network management challenge.</p>
						<div id="pictabs">
							<div id="button">
								<DL id=button1>
									<a class="on"
										onClick="switchPic('button1','pic1');this.blur();return false;"
										href="#"></a>
								</DL>
								<DL id=button2>
									<a
										onClick="switchPic('button2','pic2');this.blur();return false;"
										href="#"></a>
								</DL>
								<DL id=button3>
									<a
										onClick="switchPic('button3','pic3');this.blur();return false;"
										href="#"></a>
								</DL>
								<DL id=button4>
									<a
										onClick="switchPic('button4','pic4');this.blur();return false;"
										href="#"></a>
								</DL>
							</div>
							<div id="pic1">
								<img src="images/ESN.jpg" />
							</div>
							<div id="pic2" style="DISPLAY: none">
								<img src="images/3.2.11.png" />
							</div>
							<div id="pic3" style="DISPLAY: none">
								<img src="images/3.2.1.png" />
							</div>
							<div id="pic4" style="DISPLAY: none">
								<img src="images/3.21.png" />
							</div>

						</div>
						<div id=contenttabs>
							<div id=soncontent>
								<DIV id=contentabmenu>
									<DL id=sontab1>
										<A class=on
											onClick="switchSonTab('sontab1','soncon1');this.blur();return false;"
											href="#">Listen</A>
									</DL>
									<DL id=sontab2>
										<A
											onClick="switchSonTab('sontab2','soncon2');this.blur();return false;"
											href="#">Monitor</A>
									</DL>
									<DL id=sontab3>
										<A
											onClick="switchSonTab('sontab3','soncon3');this.blur();return false;"
											href="#">Analysis</A>
									</DL>
									<DL id=sontab4>
										<A
											onClick="switchSonTab('sontab4','soncon4');this.blur();return false;"
											href="#">Engage</A>
									</DL>
								</DIV>
								<div id="soncon1">
									<h1>&nbsp;</h1>
									<h4>Selective Listen</h4>
									<P>the network is normal more than millions node. As the
										network manager or community manager, it is hard to find the
										start point. Netkeeper will help you to listen the fast growth
										topic, trend and key influencer by filter out insignificant
										message. So the manager could save the precious time and focus
										on the underlying factor analysis or identify the engagement
										opportunity.</P>
									<li>Support multiple listen source for mysite, site,
										community portal, community site</li>
									<li>Support multiple activity for download, access, page
										view, comments, follow , like</li>
									<li>Support listen pre defined number of influencer, site,
										community with influence index</li>
									<li>Support key word and topic definition for the listen</li>
									<li>Support trackable listen result for manager process</li>
								</div>
								<div style="DISPLAY: none" id="soncon2">
									<h4 style="margin-top: 20px;">Monitor with Actionable
										Result</h4>
									<p>Netkeeper will help community manager monitor the topic,
										trend, key word, activity with the threshold or target on
										different sources. When the threshold is triggered, the
										actionable notification or predefined engagement activity will
										be launched automatically for the network management.</p>
									<li>Support Monitor the source with key performance index</li>
									<li>Support integrate Monitor with Notification or
										automation action</li>
									<li>Support auto-discover Monitor with predefine condition
										on influence</li>
								</div>
								<div style="DISPLAY: none" id="soncon3">
									<h4 style="margin-top: 20px;">Analysis with history data</h4>
									<p>the huge mount of network activity, topic , trend and
										the connection of people is exceeding the capability of
										manually analysis. with leverage the Netkeeper , the manager
										could analysis the awareness, activity , loyalty, engagement
										with organization unit, business unit, product line. He /she
										could also get the valuable insight with day, week , month,
										quote on these history data.</p>
									<li>Support online history analysis with the organization
										unit, business unit ,product , Service integration</li>
									<li>Support comparison analysis cross organization unit,
										business unit, product , Service</li>
									<li>Support analysis snapshot and analysis logs</li>
									<li>Support engagement process trigger with analysis
										result</li>
									<li>Support Personalize dashboard definition with outbound
										secure social media synchronization</li>
								</div>
								<div style="DISPLAY: none" id="soncon4">
									<h4 style="margin-top: 20px;">Engagement with Process
										Integration</h4>
									<p>with the analysis result and monitor notification, the
										Netkeeper could capture the appropriate information and route
										opportunities in accordance with their routing strategy to the
										appropriate resources.</p>
									<li>Support automation planned inbound social media
										maintenance</li>
									<li>Support Mail, outbound social media association</li>
									<li>Support predefine process integration</li>
									<li>Support engagement task tracking</li>
								</div>

								<!--<h4>Release Notes</h4>-->
								<!--<p>This is the Pre View of enterprise social network governance based on the SharePoint 2013. when the SharePoint 2013 is formal Release, it will be upgraded and released.</p>-->

							</div>
						</div>
					</DIV>
					<DIV style="DISPLAY: none" id=con2>
						<H3>The Support Mode of this tool</H3>
						<ul>
							<li>We will procide the AML(Quality Center) to track all the
								cases and also provide a contact mail group for the support.</li>
							<li>We will provide the L1,L2,L3 Mode in the support case
								according to the project requirement.</li>
							<li>We could support in 24*7, 5*8 different mode according
								to project type.</li>
							<li>We will enhance and bug fixing the support tools
								according to our architecture and roadmap.</li>
							<li>Support could not be free. It will based on the Support
								Type and engagement Type.</li>
						</ul>
					</DIV>
					<DIV style="DISPLAY: none" id=con3>
						<table class="contactname">
							<tr>
								<th>Responsibility</th>
								<th>Contact</th>
							</tr>
							<tr>
								<th colspan=2>Bid Support</th>
							</tr>
							<tr>
								<td>Capability Support</td>
								<td>EIST4CONTACT &#60CONTACT.EIST@hp.com&#62</td>
							</tr>
							<tr>
								<td>Price Support</td>
								<td>Wang, Yu-Xin &#60yu-xin.wang@hp.com&#62</td>
							</tr>
							<tr>
								<th colspan=2>Tech Support</th>
							</tr>
							<tr>
								<td>Product Leader</td>
								<td>Zhou, Yong &#60yong.zhou2@hp.com&#62</td>
							</tr>
						</table>
					</div>
				</DIV>
			</DIV>
			</DIV>
			<DIV id=side>
				<DIV class=side_box>
					<DIV class="side_con ask">
						<DL>
							<DT>Products
							<DD>
								<A href="esngov.jsp">ESN Governance</A>
							</DD>
							<DD>
								<A href="datamgt.jsp">Data Migration</A>
							</DD>
							<DD>
								<A href="farmmauto.jsp">Farm Build Automation</A>
							</DD>
						</DL>
						<DL>
							<DT>Service
							<dd>
								<a href="esn.jsp"> Build Flat Enterprise </a>
							</dd>
						</DL>
					</DIV>
				</DIV>
			</DIV>
			<DIV class=clearfloat></DIV>
</DIV>
<div id="version">gitid:</div>
</body>
</html>