<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class=" js csstransitions">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MDM Makes it Matter</title> 
	<meta content="" name="hpe" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="icon" type="image/x-icon" href="webitem/hpe.ico"/>
	<link rel="short icon" type="image/x-icon" href="webitem/hpe.ico"/>
	<link rel="stylesheet" type="text/css" href="MetroStyleFiles//CSS/sonhlab-base.css"/>
	<link rel="stylesheet" type="text/css" href="MetroStyleFiles//CSS/metrotab-v2.css"/>
	<link rel="stylesheet" type="text/css" href="MetroStyleFiles//CSS/metro-bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="MetroStyleFiles//CSS/global-demo.css"/>	
	<link rel="stylesheet" type="text/css" href="MetroStyleFiles//CSS/animation-effects.css"/>		
	<link rel="stylesheet" type="text/css" href="MetroStyleFiles//CSS/openmes.css"/>
	<link rel="stylesheet" type="text/css" href="nkang/c3.css"/>
	<link rel="stylesheet" type="text/css" href="MetroStyleFiles//sweetalert.css"/>
	<link rel="stylesheet" type="text/css" href="MetroStyleFiles//CSS/pageLoad.css"/>

	<script src="Jsp/JS/jquery-1.10.2.min.js"></script> 
<!-- 	<link rel="stylesheet" type="text/css" href="Jsp/CSS/bootstrap.css"/> -->
	<link rel="stylesheet" type="text/css" href="Jsp/CSS/common.css"/>
		<link rel="stylesheet" type="text/css" href="Jsp/CSS/custom.css"/>
		
 	<script type="text/javascript" src="Jsp/JS/jquery-1.8.0.js"></script> 
	<script type="text/javascript" src="MetroStyleFiles//JS/jquery.easing.min.13.js"></script>
	<script type="text/javascript" src="MetroStyleFiles//JS/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" src="MetroStyleFiles//JS/jquery.jscrollpane.min.js"></script>
	<script type="text/javascript" src="MetroStyleFiles//JS/jquery.masonry.min.js"></script>
	<script type="text/javascript" src="MetroStyleFiles//JS/modernizr-transitions.js"></script>
	<script type="text/javascript" src="MetroStyleFiles//JS/metrotab-v2.min.js"></script>
	<script type="text/javascript" src="MetroStyleFiles//JS/openmes.min.js"></script>
	<script type="text/javascript" src="MetroStyleFiles//sweetalert.min.js"></script>
    <script type="text/javascript" src="nkang/liquidFillGauge.js"></script>
	<script type="text/javascript" src="nkang/Chart.js"></script>
	<script type="text/javascript" src="nkang/gauge.js"></script>
	<script type="text/javascript" src="nkang/RadarChart.js"></script>

	<script type="text/javascript" src="nkang/d3.v3.min.js"></script>
	<script type="text/javascript" src="nkang/c3.min.js"></script>
	
	<script type="text/javascript" src="Jsp/JS/bootstrap.min.js"></script>
	<script type="text/javascript">
	 $(document).ajaxStart(function () {
		$(".sk-circle").show();
	    }).ajaxStop(function () {
	    	$(".sk-circle").hide();
	    });
	  
	$(document).ready(function() {
		$('.metrotabs').metrotabs({
				outeffect : 'swing',
				ineffect :	'swing',
				moveout : 'BottomOrRight', // TopOrLeft | BottomOrRight
				movein : 'TopOrLeft', // TopOrLeft | BottomOrRight
				outduration : 400,
				induration : 400,
				minibartitle: 'Master Data Lake Quality Grade',
				mtEffect : 'vertical' // vertical | horizontal | fade
			});
		  $("#testa").click(function(){ 
			  if($(this).css("opacity")==1){ 
				  
				}else{ 
					 $(this).css("opacity",1);
					  $("#testb").css("opacity",0.3);
					  $("#chart3").css("display","block");
					  $("#chartCity").css("display","none");
				} 
			
				}); 
		  $("#testb").click(function(){ 
			  if($(this).css("opacity")==1){ 
				  
				}else{ 
					var chartCityHTML=$("#chartCity").html();
					  if(chartCityHTML==""){
							$.ajax({
								type : "POST",
								dataType : "json",
								url : "getOpenfooter?userState="+$("#userState").html(),
								success : function(data) {
									  if (data) {
										  var chart = c3.generate({
												data : {
													columns : [
														          data[0],
														          data[1],
														         data[2],
														         data[3]
												    		  ],
													type : 'pie'
												},
												pie : {
													label : {
														format : function(value, ratio, id) {
															return d3.format('#')(value);
														}
													}
												},
												bindto : '#chartCity'
											});
										 
											
									  }
								},
								error:function(data)
								{
									console.log("failed..."+data.toString());
								}
							
						});
						} 
					 $(this).css("opacity",1);
					  $("#testa").css("opacity",0.3);
					  $("#chart3").css("display","none");
					  $("#chartCity").css("display","block");
				} 
			
				}); 
		$("#openmes").on("click",function(){
			
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "getOpenMes",
				success : function(data) {
					  if (data) {				  
							var htmlcustli = "<div class=\"well well-sm\" style='text-align:center;'><img src='mdm/images/People.png' width='25px' height='25px' alt='icon'/><p style='margin:0;text-align:center;font-size:14px'>"+data.length+" Active Clients in service</p></div>";
							if(data.length!=0){
							for(var i=0;i<data.length;i++){
								htmlcustli = htmlcustli + "<li class=\"active\"><a href=\"#\" onclick=\"javascript:showDetailsForClient('" + data[i].clientID + "','"+data[i].consumedWebService+"');\"><span class=\"badge pull-right\">" + data[i].clientIdentifier + "</span>"+ data[i].clientDescription+"</a></li>";
							}
							}
							$("#openmesChart").html(htmlcustli);
							$("#openmesChart").show();
					  }
				},
				error:function(data)
				{
					console.log("failed..."+data.toString());
				}
			
		});
		});
		$("#espresso").on("click",function(){
			var chart2HTML=$("#chart2").html();
			  if(chart2HTML==""){
			
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "getChart2?userState="+$("#userState").html(),
				success : function(data) {
					  if (data) {
						  var chart = c3.generate({
								data: {
									columns: [
									          data[0],
									          data[1],
									         data[2]
									         ]
								},
								axis: {
									x: {
										type: 'category',
										categories: data[3]
									}
								},
								zoom: {
							        enabled: true
							    },
							    bindto : '#chart2'
							});
						 
							console.log("pass by....");
					  }
				},
				error:function(data)
				{
					console.log("failed..."+data.toString());
				}
			
		});
		} 

				   loadChart2();
			//	   $("#chart2 .tick text tspan").attr("onclick","hello(this)");
				   $("#chart2 .tick").live("click",function(){
					   console.log($(this).text());
					   var title=$(this).text();
						$.ajax({
							type : "POST",
							dataType : "json",
							url : "getCitydetial?userState="+$("#userState").text().trim()+"&nonlatinCity="+$(this).text(),
							success : function(data) {
								  if (data) {
									  var text="";
									  	if(data[0].length!=0){
							for(var i=0;i<data[0].length;i++){
								text=text+"<p style='width:100%;text-align:center;color:orange;'>"+data[0][i].organizationNonLatinExtendedName+"</p>";
							}
							}
									  	if(data[1].length!=0){
											for(var i=0;i<data[1].length;i++){
												text=text+"<p style='width:100%;text-align:center;color:blue;'>"+data[1][i].organizationNonLatinExtendedName+"</p>";
											}
											}
									  	if(data[2].length!=0){
											for(var i=0;i<data[2].length;i++){
												text=text+"<p style='width:100%;text-align:center;color:green;'>"+data[2][i].organizationNonLatinExtendedName+"</p>";
											}
											}
									  swal({  
								          title:title,  
								          text:text,
								          type:"success",  
										  html:"true",
								          showCancelButton:false,  
								          showConfirmButton:"true",  
								          confirmButtonText:"OK",  
								          animation:"slide-from-top"  
								        });
									 
										
								  }
							},
							error:function(data)
							{
								console.log("failed..."+data.toString());
							}
						
					});
				   });
					

			
			 
		});
		
		$("#americano").on("click",function(){
			
			var chartRadarHTML=$("#chart3Radar").html();
			  if(chartRadarHTML==""){

					$.ajax({
						type : "POST",
						dataType : "json",
						url : "getRadarda?userState="+$("#userState").html(),
						success : function(data) {
							  if (data) {	
								//  var temp=eval(data);
								//var temp=[[{axis:" Automotive ",value:3.6345},{axis:" Business Services ",value:15.367},{axis:" Discrete - Machinery ",value:3.359},{axis:" Consumer Packaged Goods ",value:6.2055},{axis:" Construction ",value:3.1815},{axis:" Education: K-12 /School ",value:6.0675},{axis:" Wholesale Trade ",value:16.3635},{axis:" Retail ",value:10.1795},{axis:" Transportation&Trans Services ",value:3.1595},{axis:" Amusement and Recreation ",value:1.817}]];
								  var w = 250, h = 250;
									var colorscale = d3.scale.category10();
									//Legend titles
									var LegendOptions = ['A','B'];
								  var mycfg = {
										  w: w,
										  h: h,
										  maxValue: 0.6,
										  levels: 6,
										  ExtraWidthX: 170
										};
										//Call function to draw the Radar chart
										//Will expect that data is in %'s
										RadarChart.draw("#chart3Radar", data, mycfg);

										var svg = d3.select('#americano_loadChart')
											.selectAll('svg')
											.append('svg')
											.attr("width", w+10)
											.attr("height", h);

										//Initiate Legend	
										var legend = svg.append("g")
											.attr("class", "legend")
											.attr("height", 100)
											.attr("width", 150)
											.attr('transform', 'translate(-220,40)') ;
											//Create colour squares
											legend.selectAll('rect')
											  .data(LegendOptions)
											  .enter()
											  .append("rect")
											  .attr("x", w - 65)
											  .attr("y", function(d, i){ return i * 20;})
											  .attr("width", 10)
											  .attr("height", 10)
											  .style("fill", function(d, i){ return colorscale(i);})
											  ;
											//Create text next to squares
											legend.selectAll('text')
											  .data(LegendOptions)
											  .enter()
											  .append("text")
											  .attr("x", w - 52)
											  .attr("y", function(d, i){ return i * 20 + 9;})
											  .attr("font-size", "11px")
											  .attr("fill", "#737373")
											  .text(function(d) { return d; });	
									
							  
							
						
							  }
							  $("#americano_loadChart").append("<p id='showBtn' style='display:block;position:absolute;top:350px;color:#00b287;font-size:16px;width:100%;text-align:center' onclick='show_american_div()'>load more..</p>")
							  var htmlcustli = "<div id='american_div' style='margin-top:40px;display:none'>";
								if(data[0].length!=0){
								for(var i=0;i<data[0].length;i++){
									htmlcustli = htmlcustli + "<li style='list-style:none;margin-top: 2px;width:100%;' class=\"active\"><a style='position: relative;display: block;padding: 10px 15px;color: #fff;background-color: #428bca;' href=\"#\" \"><span style='color:#428bca;background-color: white;' class=\"badge pull-right\">" + data[0][i].count + "</span>"+ data[0][i].axis+"</a></li>";
								}
								}
								htmlustli=htmlcustli+"</div>";
								$("#americano_loadChart").append(htmlcustli);
								
						},
						error:function(data)
						{
							console.log("failed..."+data.toString());
						}
					
				});
				} 
			loadChartRadar();
		});
		
		$("#openfooter").on("click",function(){
			
			var chart3HTML=$("#chart3").html();
				var cnName=$("#countrys").text();
				var country="";
		if(cnName=="中国")
			{
			country="CN";
			};
			if(cnName=="马来西亚")
			{
			country="MY";		
			};
			  if(chart3HTML==""){
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "getOpenfooterByCountry?country="+country,
				success : function(data) {
					  if (data) {
						  var chart = c3.generate({
								data : {
									columns : [
										          data[0],
										          data[1],
										         data[2],
										         data[3]
								    		  ],
									type : 'pie'
								},
								pie : {
									label : {
										format : function(value, ratio, id) {
											return d3.format('#')(value);
										}
									}
								},
								bindto : '#chart3'
							});
						 
							
					  }
				},
				error:function(data)
				{
					console.log("failed..."+data.toString());
				}
			
		});
		} 
			  
			
				   loadChart();
			   
			  
		});
		// $("#conporlan").bind("click", loadChart4);
		//document.getElementById("conporlan").addEventListener('click',loadChart4,false);
		//var clickEvent = $("#conporlan").data('events')["click"];
		//alert(JSON.stringify(clickEvent));
		var username= $("#username").text();
		var addressInfo= $("#addressInfo").text();
		
	});
	
	function loadChartRadarWithDetail(obj){
		swal({   
			title: "Segment Area",   
			text: "Retrieving more industry distribution....",   
			type: "info",   
			showCancelButton: true,   
			closeOnConfirm: false,   
			showLoaderOnConfirm: true, }, 
			function(){   
				setTimeout(function(){     
					swal(document.getElementById("username").innerHTML+" Industries Presented within  "+document.getElementById("userState").innerHTML);}, 200); 
				$("#radardetailid").show();
			});
	}
	var country="CN";
	
	function hello(obj)
	{
		console.log($(obj).text());
		swal("Thank You!", "We will contact you soon in"+$(obj).text(), "success"); 
	}
	function countrySelect(obj){
		var cnName=$("#countrySelect option:selected").val();
		if(cnName=="中国")
			{
			country="CN";
			};
			if(cnName=="马来西亚")
			{
			country="MY";		
			};
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "getCitys?country="+country,
				success : function(data) {
					var text="";
					 for(var i=0;i<data.length;i++){
						  text=text+"<option>"+data[i]+"</option>";
						}
					$("#citySelect").html(text);
				},
				error:function(data)
				{
					console.log("failed..."+data.toString());
				}
			}
			);
	};
	function userlocationsave(obj){
		
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "getCitys?country="+country,
			success : function(data) {
				  if (data) {
					  var text="<p style='position:relative;top:-10px;line-height:30px;height:30px;'>Please select a city</p><select id='countrySelect' onchange='countrySelect(this)' style='height: 30px;width: 100px;border-radius: 8%;'><option>中国</option><option>马来西亚</option></select><select id='citySelect' style='height: 30px;margin-left:10px;width: 100px;border-radius: 8%;'>";
					  for(var i=0;i<data.length;i++){
						  text=text+"<option>"+data[i]+"</option>";
						}
					  text=text+"</select>";
						swal(
								{
									title: "Dear "+document.getElementById("username").innerHTML+"!",   
									text: text,     
									showCancelButton: true,   
									closeOnConfirm: false,  
									html:true,
									animation: "slide-from-top"
								}, 
								function(inputValue){
									if (inputValue === false){ return false; }
									else{
										var city=$("#citySelect option:selected").val();
										var countrys=$("#countrySelect option:selected").val();
										$("#chart3").html("");
										$("#chartCity").html("");
										$("#chart2").html("");
										$("#locationCity").text(city.toLocaleUpperCase());
										$("#userState").text(city);
										$("#labelCity").text(city);
										$("#labelCountry").text(countrys);
										$("#countrys").text(countrys);
										swal("Success", "your location saved", "success");
									}							
									 
								}
							);
					 
						
				  }
			},
			error:function(data)
			{
				console.log("failed..."+data.toString());
			}
		
	});


	}
		$(window).load(function() {
			$("#goaway").fadeOut("slow");
			$(".mes-openbt").openmes({ext: 'php'});
		});
		
		var flag=1;
		function loadChart(){
		
			 $("#chart3").show();
			 $("#testa").css("opacity",1);
			 $("#testb").css("opacity",0.3);
			 $("#cityRound").show();
/* 	 		$("#openfooter_loadC3").html(chartobj);  */
			 $("#chart2").hide();
			 $("#chart4").hide();
			 $("#chart5").hide();
			 $("#chart3Radar").hide();
			flag=3;
		}
		
		function hideAll(obj){
			if(flag==1||flag==3)
			{
			 $(".map-preview").css("display","none");
			}
		else if(flag==2)
			{
			 $(".map-preview").css("display","block");
			}
			if(flag==1||flag==3){
				flag=2;
				}
			else if(flag==2){
				flag=1;
				}
			 $("#chart3").hide();
			 $("#chartCity").hide();	
			 $("#cityRound").hide();
			 $("#chart2").hide();
			 $("#chart4").hide();
			 $("#openmesChart").hide();
		}
		function loadChart2(){
	 		$("#chart2").show();
	 		$("#chartCity").hide();	
			 $("#cityRound").hide();
			 flag=3;
/* 	 		$("#openfooter_loadC2").append(chartobj); */
			//$("#openfooter_loadC2").html(chartobj);
			 $("#chart3").hide();
			 $("#chart4").hide();
			 $("#chart5").hide();
			 $("#chart3Radar").hide();
			 

	     }
		function show_american_div()
		{
			 $("#american_div").show();
			 $("#showBtn").hide();
			 
			 
		}
		function loadChartRadar(){
			var chartobj = $("#chart3Radar");
			var detailobj=$("#american_div");
			$("#americano_loadChart").html("");
			$("#americano_loadChart").append(chartobj);
			$("#americano_loadChart").append(detailobj);
			flag=3;
			$("#chart3").hide();
			$("#chartCity").hide();	
			 $("#cityRound").hide();
			 $("#chart4").hide();
			 $("#chart5").hide();
			 $("#chart2").hide();
			chartobj.show();
			
		}
		
		function loadChart4(obj){
			var chartobj = $("#chart4");
			$("#conporlan_loadChart").html(chartobj);
			flag=3;
			$("#chart3").hide();
			$("#chartCity").hide();	
			 $("#cityRound").hide();
			 $("#chart2").hide();
			 $("#chart5").hide();
			 $("#chart3Radar").hide();
			chartobj.show();
		}
		function loadOpenMe(obj)
		{
			$("#openMeDiv").show();
			$("#chart3").hide();
			$("#chartCity").hide();
			flag=3;
			 $("#cityRound").hide();
			 $("#chart2").hide();
		}
		function loadChart5(obj){
			var chartobj = $("#chart5");
//			$("#capuqino_loadChart").html(chartobj);
			$("#chart3").hide();
			flag=3;
			$("#chartCity").hide();	
			 $("#cityRound").hide();
			 $("#chart4").hide();
			 $("#chart2").hide();
			 $("#chart3Radar").hide();
			chartobj.show();
		}
		function CommentMe(){
			swal(
					{
						title: "Dear Comment US!",   
						text: "Drop us a message and do things better together",   
						type: "input",   
						showCancelButton: true,   
						closeOnConfirm: false,   
						animation: "slide-from-top",   
						inputPlaceholder: "Write something" 
					}, 
					function(inputValue){
						inputVar = inputValue;
						if (inputValue === false) return false;      
						if (inputValue === "") {     
							swal.showInputError("You need to write something!");     
							return false;   
						}
						swal("Thank You!", "We will contact you soon", "success"); 
					}
				);
		}
		function OrganizationInformation(){
			/*swal("200M", document.getElementById("totalOPSI").innerHTML+" Organizations", "success");*/
			window.location.href="http://shenan.duapp.com/mdm/DQNavigate.jsp?UID="+document.getElementById("uid").innerHTML;
		}
		function showDetailsForClient(paraStr,ws){
			/*swal(paraStr,"<span style='color:red'>"+paraStr+"</span>", "success","true");*/
			var datas=ws.split(",");
			var text="";
			for(var i=0;i<datas.length;i++)
			{
				text=text+"<p>"+datas[i]+"</p>"
			}
			   swal({  
          title:paraStr,  
          text:text,
          type:"success",  
		  html:"true",
          showCancelButton:false,  
          showConfirmButton:"true",  
          confirmButtonText:"OK",  
          animation:"slide-from-top"  
        });
		}
	</script>
	  <style type="text/css">
.showup{
opacity:1;
visibility:visible;}
.showdown
{
opacity:0.3;
visibility:visible;
}
.sk-circle {
  margin: 40px auto;
  width: 40px;
  height: 40px;
      position: absolute;
    top: 38%;
    left: 45%;
    display:none;
     }
  .sk-circle .sk-child {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0; }
  .sk-circle .sk-child:before {
    content: '';
    display: block;
    margin: 0 auto;
    width: 15%;
    height: 15%;
    background-color: #333;
    border-radius: 100%;
    -webkit-animation: sk-circleBounceDelay 1.2s infinite ease-in-out both;
            animation: sk-circleBounceDelay 1.2s infinite ease-in-out both; }
  .sk-circle .sk-circle2 {
    -webkit-transform: rotate(30deg);
        -ms-transform: rotate(30deg);
            transform: rotate(30deg); }
  .sk-circle .sk-circle3 {
    -webkit-transform: rotate(60deg);
        -ms-transform: rotate(60deg);
            transform: rotate(60deg); }
  .sk-circle .sk-circle4 {
    -webkit-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
            transform: rotate(90deg); }
  .sk-circle .sk-circle5 {
    -webkit-transform: rotate(120deg);
        -ms-transform: rotate(120deg);
            transform: rotate(120deg); }
  .sk-circle .sk-circle6 {
    -webkit-transform: rotate(150deg);
        -ms-transform: rotate(150deg);
            transform: rotate(150deg); }
  .sk-circle .sk-circle7 {
    -webkit-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
            transform: rotate(180deg); }
  .sk-circle .sk-circle8 {
    -webkit-transform: rotate(210deg);
        -ms-transform: rotate(210deg);
            transform: rotate(210deg); }
  .sk-circle .sk-circle9 {
    -webkit-transform: rotate(240deg);
        -ms-transform: rotate(240deg);
            transform: rotate(240deg); }
  .sk-circle .sk-circle10 {
    -webkit-transform: rotate(270deg);
        -ms-transform: rotate(270deg);
            transform: rotate(270deg); }
  .sk-circle .sk-circle11 {
    -webkit-transform: rotate(300deg);
        -ms-transform: rotate(300deg);
            transform: rotate(300deg); }
  .sk-circle .sk-circle12 {
    -webkit-transform: rotate(330deg);
        -ms-transform: rotate(330deg);
            transform: rotate(330deg); }
  .sk-circle .sk-circle2:before {
    -webkit-animation-delay: -1.1s;
            animation-delay: -1.1s; }
  .sk-circle .sk-circle3:before {
    -webkit-animation-delay: -1s;
            animation-delay: -1s; }
  .sk-circle .sk-circle4:before {
    -webkit-animation-delay: -0.9s;
            animation-delay: -0.9s; }
  .sk-circle .sk-circle5:before {
    -webkit-animation-delay: -0.8s;
            animation-delay: -0.8s; }
  .sk-circle .sk-circle6:before {
    -webkit-animation-delay: -0.7s;
            animation-delay: -0.7s; }
  .sk-circle .sk-circle7:before {
    -webkit-animation-delay: -0.6s;
            animation-delay: -0.6s; }
  .sk-circle .sk-circle8:before {
    -webkit-animation-delay: -0.5s;
            animation-delay: -0.5s; }
  .sk-circle .sk-circle9:before {
    -webkit-animation-delay: -0.4s;
            animation-delay: -0.4s; }
  .sk-circle .sk-circle10:before {
    -webkit-animation-delay: -0.3s;
            animation-delay: -0.3s; }
  .sk-circle .sk-circle11:before {
    -webkit-animation-delay: -0.2s;
            animation-delay: -0.2s; }
  .sk-circle .sk-circle12:before {
    -webkit-animation-delay: -0.1s;
            animation-delay: -0.1s; }

@-webkit-keyframes sk-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0); }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes sk-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0); }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1); } }

  </style>
	

</head>
<body>



<div id="username" style="display:none">${ userInfo.nickname } </div>
<%-- <div id="radarSize" style="display:none">${ radarSize } </div> --%>
<div id="userState" style="display:none">${ userState } </div>
<div id="countrys" style="display:none">中国</div>
<div id="uid" style="display:none">${ uid }</div>
<div id="address" style="display:none">${ curLoc }</div>
<div id="addressInfo" style="display:none">
<c:forEach items="${userInfo.addressInfo}" var="addressInfo">
 ${addressInfo} |
</c:forEach>
 </div>
	<div class="loader more" id="goaway"></div>
	<div class="demo-content">
		<img class="mes-openbt" data-mesid="message-5" style="width:150px;height:58px;" src="https://c.ap1.content.force.com/servlet/servlet.ImageServer?id=015900000053FQo&oid=00D90000000pkXM&lastMod=1438220916000" alt="HP Logo"/> 
	</div>

<div id="userInfo">
	<p class="navbar-text pull-right">Welcome <a href="http://shenan.duapp.com/mdm/profile.jsp?UID=${ uid }" class="navbar-link">${ userInfo.nickname }</a><br />
		<a href="http://shenan.duapp.com/mdm/profile.jsp?UID=${ uid }"><img src="${ userInfo.headimgurl }" alt="userImage" class="userImage pull-right"/></a>
	</p>

</div>

 <div id="topinfo">
		<svg id="fillgauge4" width="0%" height="0" onclick="gauge4.update(NewValue());"></svg>
		<svg id="fillgauge5" width="50%" height="220" onclick="Javascript:OrganizationInformation();"></svg>
		<script>
		var percent ="0.86";
		var percent2 = 100*percent;
		  var gauge4 = loadLiquidFillGauge("fillgauge4", 50);
		    var config4 = liquidFillGaugeDefaultSettings();
		    config4.circleThickness = 0.15;
		   config4.circleColor = "#FFFFFF";
		    config4.textColor = "#00b287";
		    config4.waveTextColor = "#FCFCFC";
		    config4.waveColor = "#00b287";
		    config4.textVertPosition = 0.8;
		    config4.waveAnimateTime = 1000;
		    config4.waveHeight = 0.05;
		    config4.waveAnimate = true;
		    config4.waveRise = false;
		    config4.waveHeightScaling = false;
		    config4.waveOffset = 0.25;
		    config4.textSize = 0.75;
		    config4.waveCount = 3;
		  var gauge5 = loadLiquidFillGauge("fillgauge5", percent2 , config4);
		    var config5 = liquidFillGaugeDefaultSettings();
		    config5.circleThickness = 0.4;
		    config5.circleColor = "#FFFFFF";
		    config5.textColor = "#00b287";
		    config5.waveTextColor = "#00b287";
		    config5.waveColor = "#00b287";
		    config5.textVertPosition = 0.52;
		    config5.waveAnimateTime = 5000;
		    config5.waveHeight = 0;
		    config5.waveAnimate = false;
		    config4.waveRise = true;
		    config5.waveCount = 2;
		    config5.waveOffset = 0.25;
		    config5.textSize = 1.2;
		    config5.minValue = 30;
		    config5.maxValue = 150;
		    config5.displayPercent = false;
		    function NewValue(){
		        return 100*0.68;
		    }
		</script>
 </div>


    
<section id="mainform">
 		<img id="user_location_save" onclick="javascript:userlocationsave(this);" src="MetroStyleFiles//setuplocation.png" alt="userImage" class="userImage pull-right" style="position:relative;top:10px;right:2%; z-index: 8;" /><span id="locationCity" style="position:absolute;top:-6px;right:5px;color:#00b287;z-index:8;font-size:16px">${ userState }</span>
	<!-- START METROTAB -->
    <div class="metrotabs">
        <div class="mt-blocksholder floatleft masonry" style="width: 96%; display: block; position: relative;padding-bottom:-200px;top:-25px;left:2%" >
            <div id="tileboxjs"  onclick="javascript:hideAll(this);" class="a1 tile-bt-long img-purtywood mt-tab mt-active mt-loadcontent masonry-brick" style="position: absolute; top: 0px; left: 0px;">
                <a href="javascript:void(0);">
	                <img src="MetroStyleFiles//datalake.png" alt="">
	                <span class="light-text"><strong>Data Lake</strong></span>
                </a>
            </div>      
             <div id="conporlan" onclick="javascript:loadChart4(this);" class="a2 tile-bt solid-red mt-tab mt-loadcontent masonry-brick" style="position: absolute; top: 200px; left: 200px;">
                <a href="javascript:void(0);" target="_blank">
					<img src="MetroStyleFiles//image/icon.png" alt="">
					<span class="light-text">康宝蓝</span>
                </a>
            </div>
			
			<div id="espresso" class="a3 tile-bt solid-blue-2 mt-tab mt-loadcontent masonry-brick" style="position: absolute; top: 300px; left: 200px;">
                <a href="javascript:void(0);">
	                <img src="MetroStyleFiles//location.png" alt="">
	                <span class="light-text">Geolocation</span>
                </a>
            </div>
			
			<div id="openmes"   onclick="javascript:loadOpenMe(this);" class="a4 tile-bt-long solid-green-2 mt-tab mt-loadcontent masonry-brick" style="position: absolute; top: 0px; left: 100px;">
                <a href="javascript:void(0);">
	                <img src="MetroStyleFiles//person.png" alt="">
	                <span class="light-text">Show Case</span>
                </a>
            </div>
            
            <div id="capuqino" data-ext="html" onclick="javascript:loadChart5(this);" class="a5 tile-bt-long solid-orange-2 mt-tab mt-loadcontent masonry-brick" style="position: absolute; top: 200px; left: 0px;">
                <a href="javascript:void(0);">
	                <img src="MetroStyleFiles//image/icon.png" alt="">
	                <span class="light-text">卡布奇诺</span>
                </a>
            </div>
            
            			<div id="americano" class="a6 tile-bt solid-red-2 mt-tab mt-loadcontent masonry-brick" style="position: absolute; top: 400px; left: 0px;">
                <a href="javascript:void(0);">
	                <img src="MetroStyleFiles//industry.png" alt="">
	                <span class="light-text">Industry</span>
                </a>
            </div>
            
            <div id="joinus" class="a7 tile-bt solid-red-2 mt-tab  masonry-brick" style="position: absolute; top: 400px; left: 0px;">
		        <div class="tile-bt solid-green hovershadow-green">
		            <a href="javascript:void(0);" onClick="Javascript:CommentMe();"  title="move together">
		                <img src="MetroStyleFiles//image/documents.png" alt="MetroTab Docs">
		                <span class="light-text" style="margin-left:5px; font-size:16px;">Join US</span>
		            </a>
		        </div>
    		</div>
            
			<div id="openfooter"  class="a8 tile-bt-long img-wildoliva mt-tab mt-loadcontent masonry-brick" style="position: absolute; top: 300px; left: 0px;">
                <a href="javascript:void(0);">
	                <img src="MetroStyleFiles//visualview.png" alt="">
	                <span class="light-text">Business Type</span>
                </a>
            </div>
            
     

			


        <div class="clearspace"></div>
        
        </div>
        
<!-- START CONTENT -->
        <div id="openMeDiv" class="mt-contentblock  floatleft" style="padding: 5px; height: 100%; width:100%; display: block;">
	        <div class="mt-content jspScrollable" style="height: 100%; top: 0px; overflow: hidden; padding: 0px; width: 100%;" tabindex="0">

			</div>
		</div>
<!-- END CONTENT -->
    </div><div class="clearspace"></div>
	<!-- END METROTAB -->
</section>

 <div id="chart3Radar" onclick="javascript:loadChartRadarWithDetail(this);"></div>

 <div id="chart4" >
		<script>
			var chart = c3.generate({
			    data: {
			        columns: [
			            ['data1', 30, 200, 100, 400, 150, 250, 50, 100, 250]
			        ]
			    },
			    axis: {
			        x: {
			            type: 'category',
			            categories: ['cat1', 'cat2', 'cat3', 'cat4', 'cat5', 'cat6', 'cat7', 'cat8', 'cat9']
			        }
			    },
			    bindto : '#chart4'
			});
 			$("#chart4").hide();
		</script>
	</div>
	
	<div id="chart5">
<!-- 	<svg class="chart"></svg>
	
	<script>
		var data = {
		  labels: [
		    'resilience', 'maintainability', 'accessibility',
		    'uptime', 'functionality', 'impact'
		  ],
		  series: [
		    {
		      label: 'Customer',
		      values: [4, 8, 15, 16, 23, 42]
		    },
		    {
		      label: 'Partner',
		      values: [12, 43, 22, 11, 73, 25]
		    },
		    {
		      label: 'Competitor',
		      values: [31, 28, 14, 8, 15, 21]
		    },]
		};
		
		var chartWidth       = 200,
		    barHeight        = 15,
		    groupHeight      = barHeight * data.series.length,
		    gapBetweenGroups = 10,
		    spaceForLabels   = 100,
		    spaceForLegend   = 100;
		
		// Zip the series data together (first values, second values, etc.)
		var zippedData = [];
		for (var i=0; i<data.labels.length; i++) {
		  for (var j=0; j<data.series.length; j++) {
		    zippedData.push(data.series[j].values[i]);
		  }
		}
		
		// Color scale
		var color = d3.scale.category20();
		var chartHeight = barHeight * zippedData.length + gapBetweenGroups * data.labels.length;
		
		var x = d3.scale.linear()
		    .domain([0, d3.max(zippedData)])
		    .range([0, chartWidth]);
		
		var y = d3.scale.linear()
		    .range([chartHeight + gapBetweenGroups, 0]);
		
		var yAxis = d3.svg.axis()
		    .scale(y)
		    .tickFormat('')
		    .tickSize(0)
		    .orient("left");
		
		// Specify the chart area and dimensions
		var chart = d3.select(".chart")
		    .attr("width", spaceForLabels + chartWidth + spaceForLegend)
		    .attr("height", chartHeight);
		
		// Create bars
		var bar = chart.selectAll("g")
		    .data(zippedData)
		    .enter().append("g")
		    .attr("transform", function(d, i) {
		      return "translate(" + spaceForLabels + "," + (i * barHeight + gapBetweenGroups * (0.5 + Math.floor(i/data.series.length))) + ")";
		    });
		
		// Create rectangles of the correct width
		bar.append("rect")
		    .attr("fill", function(d,i) { return color(i % data.series.length); })
		    .attr("class", "bar")
		    .attr("width", x)
		    .attr("height", barHeight - 1);
		
		// Add text label in bar
		bar.append("text")
		    .attr("x", function(d) { return x(d) - 3; })
		    .attr("y", barHeight / 2)
		    .attr("fill", "red")
		    .attr("dy", ".35em")
		    .text(function(d) { return d; });
		
		// Draw labels
		bar.append("text")
		    .attr("class", "label")
		    .attr("x", function(d) { return - 10; })
		    .attr("y", groupHeight / 2)
		    .attr("dy", ".35em")
		    .text(function(d,i) {
		      if (i % data.series.length === 0)
		        return data.labels[Math.floor(i/data.series.length)];
		      else
		        return ""});
		
		chart.append("g")
		      .attr("class", "y axis")
		      .attr("transform", "translate(" + spaceForLabels + ", " + -gapBetweenGroups/2 + ")")
		      .call(yAxis);
		
		// Draw legend
		var legendRectSize = 18,
		    legendSpacing  = 4;
		
		var legend = chart.selectAll('.legend')
		    .data(data.series)
		    .enter()
		    .append('g')
		    .attr('transform', function (d, i) {
		        var height = legendRectSize + legendSpacing;
		        var offset = -gapBetweenGroups/2;
		        var horz = spaceForLabels + chartWidth + 40 - legendRectSize;
		        var vert = i * height - offset;
		        return 'translate(' + horz + ',' + vert + ')';
		    });
		
		legend.append('rect')
		    .attr('width', legendRectSize)
		    .attr('height', legendRectSize)
		    .style('fill', function (d, i) { return color(i); })
		    .style('stroke', function (d, i) { return color(i); });
		
		legend.append('text')
		    .attr('class', 'legend')
		    .attr('x', legendRectSize + legendSpacing)
		    .attr('y', legendRectSize - legendSpacing)
		    .text(function (d) { return d.label; });
		
		$("#chart5").hide();
		</script> -->
	</div>
 <!-- -------------------------------------------------------------------------------------------------------------- -->
 <!-- -------------------------------------------------------------------------------------------------------------- -->
<div id="mt-station">

<!-- MetroTab Content 卡布奇诺-->
<div data-mtid="capuqino" id="capuqino_loadChart">

</div>
<!-- End MetroTab Content  卡布奇诺-->

<!-- MetroTab Content 美式咖啡 Industry-->
<div data-mtid="americano"> 
	<div id="americano_loadChart"></div>
	<div id="radardetailid">
<%--    		<%
			for(String i : lst){
				String cnt =  RestUtils.CallgetFilterCountOnCriteriaFromMongo(i,"","重庆","");
				i = i.replaceAll("\\s+","");
				i = i.replaceAll("-", "");
				double n = Double.valueOf(cnt);
				double m = Double.valueOf(totalcntwithRegion);
				double percent = n/m;
				String mywidth = percent*100 + "%";
				out.print("<div class=\"progress\"><div class=\"progress-bar progress-bar-success\" role=\"progressbar\" aria-valuenow=\""+ cnt +"\" aria-valuemin=\"0\" aria-valuemax=\""+ totalcntwithRegion +"\" style=\"width: "+ mywidth +";\"><span style=\"text-align:center; color:#000; \"> "+ i +" </span></div><span style=\"float:right;\">"+ cnt +"</span></div>");
			}
		%> --%>
</div>

</div>
<!-- End MetroTab Content  美式咖啡-->


<!-- MetroTab Content espresso浓缩-->
<div data-mtid="espresso" id="openfooter_loadC22" style="display:none"> 
	<div id="openfooter_loadC2"></div>
</div>
<!-- End MetroTab Content  espresso浓缩-->

<!-- Start MetroTab Content 康宝蓝-->
<div data-mtid="conporlan">
	<div >
		<div  style="position:relative; width:500px; height:500px;">
			<div id="conporlan_loadChart" style="position:absolute;"></div>
		</div>
	</div> 
	<!-- <div id="conporlan_loadChart"></div> -->
</div>
<!-- End MetroTab Content  康宝蓝-->

<!-- MetroTab Content 摩卡-->
<div data-mtid="openmes">
	<br />
 	<ul  id="openmesChart" class="nav nav-pills nav-stacked">
	</ul> 

</div>
<!-- End MetroTab Content 摩卡-->


<!-- Start MetroTab Content 玛琪雅朵-->
 <div data-mtid="openfooter" id="openfooter_loadC33" style="display:none">
	<div id="openfooter_loadC3">

</div>
</div> 
<!-- End MetroTab Content 玛琪雅朵-->


<!-- Start MetroTab Content 拿铁-->
<div data-mtid="tileboxjs">

</div>
<!-- End MetroTab Content 拿铁-->
</div>




<!-- START MESSAGE STATION -->
	<div id="mes-station">
		<div class="mes-container item-profileview transparent-black"
			data-mesid="message-5">
			<!-- Start Content Holder -->
			<div class="mes-contentholder">
				<div class="item-profilebody">
					<!-- Start Background -->
					<div class="mes-content item-profilebg solid-smoke"
						data-show="hmove" data-start="-100" data-showdura="400"></div>
					<!-- End Background -->

					<!-- Start Control Bar -->
					<div class="mes-content item-ctrlbar-5" data-show="fade"
						data-showdura="200">
						<div class="mes-closebt light-text floatleft">
							<img src="MetroStyleFiles//exit.png"
								style="width: 40px; height: 40px;" />
						</div>
						<div class="clearspace"></div>
					</div>
					<!-- End Control Bar -->

					<!-- Start Header Photo -->
					<div class="mes-content item-headerphoto" data-show="bounceInDown">
						<img style="width: 100%; height: 200px;"
							src="MetroStyleFiles//reallake.jpg" alt="demo-headphoto">
					</div>
					<!-- End Header Photo -->

					<!-- Start Social Connection -->
					<div class="mes-content item-pfconnect" data-show="hmove"
						data-start="-100" data-showdura="400">
						<div class="social-badges">
							<i class="fa fa-facebook-square"></i>
							<i class="fa fa-google-plus-square"></i>
							<i class="fa fa-twitter-square"></i>
						</div>
					</div>
					<!-- End Social Connection -->
					<img  src="MetroStyleFiles//image/datalakepure.jpg" alt="demo-headphoto">
					<!-- Start Info -->
					<div  data-show="fadeInDown">
						<img  src="MetroStyleFiles//image/sitemaintenance_robot_animation.gif" alt="demo-headphoto">a
						<img  src="MetroStyleFiles//image/datalakepure.jpg" alt="demo-headphoto">
					</div>

				</div>
				<img  src="MetroStyleFiles//image/sitemaintenance_robot_animation.gif" alt="demo-headphoto">
			</div>
		</div>
		<!-- End Content Holder -->
	</div>
	
	
	
	
<!--  <div id="chart6" >
		<script>
			var chart = c3.generate({
			    data: {
			        columns: [
			            ['data1', 30, 200, 100, 400, 150, 250, 50, 100, 250]
			        ]
			    },
			    axis: {
			        x: {
			            type: 'category',
			            categories: ['cat1', 'cat2', 'cat3', 'cat4', 'cat5', 'cat6', 'cat7', 'cat8', 'cat9']
			        }
			    },
			    bindto : '#chart6'
			});
			$("#chart6").hide();
		</script>
</div> -->

<!-- END MESSAGE STATION -->

	<div id="chart3" style="display:none"></div>
	<div id="chartCity" style="display:none"></div>
	<div id="chart2" style="display:none"></div>
	    <div id="cityRound" style="position:absolute;width:200px;height:40px;top:320px;left:30%;display:none;">
<div id="testa" style=" opacity:1;cursor: pointer;position: absolute;top: 0px;width: 100px;height: 40px;"><p style="float:left;width: 15px;height: 15px;background-color:#71587E;margin-top:3px;"></p><p id="labelCountry" style="float:left;font-size:15px;line-height:0px;padding-left:3px;">中国<p></div>
<div id="testb" style=" opacity:0.3;cursor: pointer;position: absolute;top: 0px;left:110px;width: 100px;height: 40px;"><p style="float:left;width: 15px;height: 15px;background-color:#4B8BF5;margin-top:3px;"></p><p id="labelCity" style="float:left;font-size:15px;line-height:0px;padding-left:3px;">${ userState }<p></div>
</div>

  <div class="sk-circle">
      <div class="sk-circle1 sk-child"></div>
      <div class="sk-circle2 sk-child"></div>
      <div class="sk-circle3 sk-child"></div>
      <div class="sk-circle4 sk-child"></div>
      <div class="sk-circle5 sk-child"></div>
      <div class="sk-circle6 sk-child"></div>
      <div class="sk-circle7 sk-child"></div>
      <div class="sk-circle8 sk-child"></div>
      <div class="sk-circle9 sk-child"></div>
      <div class="sk-circle10 sk-child"></div>
      <div class="sk-circle11 sk-child"></div>
      <div class="sk-circle12 sk-child"></div>
    </div>
	<div class="map-preview" style="display:block">
  <div class="container">
    <div class="prev">
      <div id="mapwrapper">
        <div id="map_base"> <svg version="1.1"  viewBox="0 0 1000 500" xml:space="preserve">
          <g id="countries">
            <path id="map_1" vector-effect="non-scaling-stroke" fill="#EBECED" d="M666.931,154.749c-1.485-6.81-7.11,5.604-11.036,2.338c-0.738-0.615-3.502,0.704-3.502-0.765c-9.55,0.765-6.366,9.55-14.962,6.578c0.637,7.11-2.53,3.268,0.85,13.689c1.272,3.926,6.261-1.274,1.272,7.641c4.67,1.061,17.87,2.784,16.447-2.547c-1.272-4.775,8.384-1.91,7.853-7.004c-0.53-5.094,6.686-3.608,4.352-7.429c-0.901-1.474,3.582-2.334-0.425-5.837c-1.439-1.258,7.209-1.551,9.339-4.455C670.664,154.044,669.044,164.439,666.931,154.749z"/>
            <path id="map_2" vector-effect="non-scaling-stroke" fill="#EBECED" d="M513.914,143.8c-1.804,0.425-1.804-3.714-1.38-4.244c-0.425-0.694-1.839-1.495-1.839-1.83c-1.264-0.024-1.778,0.857-1.875,2.253c1.805,2.548-1.556,2.653,2.122,8.065C512.534,143.481,512.534,148.895,513.914,143.8z"/>
            <path id="map_3" vector-effect="non-scaling-stroke" fill="#EBECED" d="M443.985,175.67c-12.31-0.282,0.414,4.386-11.532,7.924c-2.667,0.79-10.453,4.669-10.453,4.669v4.103l12.282,9.335l18.47,14.045c0,0-0.903,2.785,3.964,3.645c7.216,1.273-0.958,5.673,5.661,4.244c12.45-2.688-6.306,2.971,24.083-16.412c-0.96-6.226-2.011,0.778-5.972-7.217c-3.071-6.196,2.119-1.882-1.274-17.686c-2.46-11.46-8.771-10.753-3.752-15.563c3.308-3.172-0.634-5.801,1.206-8.7c-3.537,1.556-2.617-1.698-8.913,0.565c-2.715,0.976-6.085-3.113-24.054,6.154C445.4,167.464,448.953,175.784,443.985,175.67z"/>
            <path id="map_4" vector-effect="non-scaling-stroke" fill="#EBECED" d="M457,137.859c0.547-0.719-0.663-1.803-1.391-0.719C454.813,138.328,456.453,138.578,457,137.859z"/>
            <path id="map_5" vector-effect="non-scaling-stroke" fill="#EBECED" d="M499.907,357.833c14.644-0.849,2.754,5.41,23.765,0.53L519,353.8v-12.097l6.9-0.637c-0.306-2.232,0.134-4.637,0.161-6.685c-9.231,0.954-6.815-10.294-6.923-12.733c-0.105-2.441,2.481-0.638-3.885-2.124c-6.367-1.485-0.829,3.078-6.984,3.609c-6.155,0.53-5.508-4.883-5.826-6.969c-0.318-2.087-10.5-1.097-13.825,0c7.463,17.421-1.341,3.679,4.884,18.747c1.291,3.126-5.659,4.386-7.044,22.214C489.825,353.8,489.943,358.41,499.907,357.833z"/>
            <path id="map_6" vector-effect="non-scaling-stroke" fill="#EBECED" d="M270.808,404.454c3.221-9.997,17.544-13.299,6.932-16.979c0.708,11.035-12.476,6.737-12.025,6.084c8.481-12.321-2.971-3.679-15.563-18.535c-3.85-4.541-4.104,3.254-4.669,3.112c-0.567-0.142-1.751-6.619-8.772-0.564c1.839,7.64-6.01,5.34-3.254,11.035c4.244,8.772-6.65,8.488-0.605,22.778c6.667,15.761-0.526,13.3,3.435,20.657c3.962,7.358-3.828,3.183,3.82,19.384c13.159,27.872,3.113,18.817,5.943,25.608c2.215,5.318,2.971-1.414,5.8,4.528c2.83,5.942,2.828-0.568,12.168,3.536c-8.773-10.612-1.345-5.519-2.406-10.471c-0.845-3.941,3.537-2.617,2.547-6.508s-5.659,0.211-7.004-5.519c-1.182-5.038,5.942-1.345,3.607-7.64c-1.671-4.511,4.599-1.769,3.396-5.234c-1.203-3.467-5.306,2.546-6.366-5.094c-0.361-2.592,11.036,3.041,7.356-2.688c-1.326-2.065,1.557-1.91-1.273-5.376c3.036,0.809,11.793,0.807,14.433-4.952c2.334-5.094-2.972-3.963-2.405-6.508c0.688-3.104-6.438-3.468-4.245-5.377C268.823,416.79,269.617,408.146,270.808,404.454z"/>
            <path id="map_7" vector-effect="non-scaling-stroke" fill="#EBECED" d="M584.586,142.393c-1.45,0.688-2.229,0.135-3.82,0.559c2.227,5.896,4.454,2.972,4.349,4.563c2.442,2.123,2.931,5.205,5.839,2.984C582.322,142.951,590.953,146.983,584.586,142.393z"/>
            <path id="map_8" vector-effect="non-scaling-stroke" fill="#EBECED" d="M923.904,372.9c-0.708-9.762-9.056-3.961-8.915-19.101c0.143-15.139-4.668,0.708-5.659-16.979c-0.787-14.07-7.032,15.351-8.347,18.535c-2.689,6.509-19.243-5.659-16.187-8.206c1.356-1.132,8.688-12.45,2.604-9.763c-6.084,2.688-10.753-3.962-11.602,0c-0.85,3.961-0.989-3.679-9.238,6.508c-8.247,10.188-5.099-9.903-18.211,8.207c-9.183,12.684-6.614-1.239-8.488,7.923c-2.547,12.45-35.148,4.692-30.844,27.448c0.99,5.235-4.245-3.112-0.707,15.139c-1.84,2.265,3.536,10.471-2.405,13.158c-5.943,2.688-0.426,9.621,8.348,4.67c8.771-4.953,16.837,0.282,17.543-4.244c0.481-3.08,35.23-14.998,33.108,4.385c-0.438,3.999,2.842-1.613,5.235-2.829c8.63-4.387,0.424,4.244,0.565,5.093c0.143,0.85,8.206-8.063,4.386,5.235c-1.416,4.93,4.669,10.045,10.754,5.66c6.083-4.388,4.385,4.952,9.621,0c5.233-4.953,8.347,2.688,11.318-7.216c1.569-5.231,21.081-17.545,23.628-29.571c2.547-12.025-3.112-13.864-3.254-17.968C927.017,374.881,924.346,379.01,923.904,372.9z M882.447,443.078c-6.79,10.753,1.699,15.422,9.764,0C887.824,445.059,884.712,444.351,882.447,443.078z"/>
            <path id="map_9" vector-effect="non-scaling-stroke" fill="#EBECED" d="M501.781,117.731c-0.622-0.499-1.7-2.142-0.919-2.264c-8.702-2.688-3.467,2.264-8.277,0.07c-6.366,1.557-0.495,4.528-2.972,3.834c-1.614-0.454-8.064,0.977-9.794-0.014c1.556,1.142,2.497,2.015,2.933,2.547c7.993-1.769,2.759,1.203,8.772,1.132c2.406-0.028,7.216,0.111,7.923-0.793C500.154,121.339,498.739,119.782,501.781,117.731z"/>
            <path id="map_10" vector-effect="non-scaling-stroke" fill="#EBECED" d="M595.516,140.492c-2.441,2.954-2.326,2.173-6.473-0.35c2.334,4.937-1.168,0.686-4.457,2.25c6.367,4.591-2.264,0.559,6.367,8.105c6.685-5.105,1.804-0.579,6.685,1.826C598.136,143.311,603.475,147.09,595.516,140.492z"/>
            <path id="map_11" vector-effect="non-scaling-stroke" fill="#EBECED" d="M203.625,201.875c-0.625-1.938-1.438,0.125-2.063,1.375C205.063,210.625,204.25,203.813,203.625,201.875z"/>
            <path id="map_12" vector-effect="non-scaling-stroke" fill="#EBECED" d="M608.708,198c0.75-0.042,1.083-1.625,0-1.917S607.871,198.047,608.708,198z"/>
            <path id="map_13" vector-effect="non-scaling-stroke" fill="#EBECED" d="M739.938,207.894c-5.943,0.425,6.154-7.853-3.715-6.579c-6.869,0.886-0.787-4.55-7.64-4.55c-2.66,0,1.909,11.872,3.68,17.531c9.408-1.556,2.263-4.71,4.739-4.669c4.173,0.07,2.688,2.476,5.518,6.65C743.194,212.39,743.561,207.634,739.938,207.894z"/>
            <path id="map_14" vector-effect="non-scaling-stroke" fill="#EBECED" d="M538.214,106.235c0.742,0.743-1.592-3.024,3.243-3.024c-0.911-0.706-1.87-3.578-0.59-3.66c5.827-0.372-1.646-1.062-3.078-6.632c-1.152-4.485-5.253-1.221-7.868-3.768c-2.035,2.335-2.318-0.283-4.087,1.557c-1.079,1.123,2.405,2.688-7.569,6.297c3.819,7.286-3.184,3.89,0.31,7.852C525.834,103.211,537.471,105.492,538.214,106.235z"/>
            <path id="map_15" vector-effect="non-scaling-stroke" fill="#EBECED" d="M470.513,112.072c-1.28-0.581-1.526-1.001-1.364-1.423c0.332-0.859,2.364-1.723,0.798-3.953c-4.262-2.317-4.209,0.547-7.145-1.133c-0.67,0.887-2.28,1.116-3.112,1.273C461.506,109.736,467.4,113.416,470.513,112.072z"/>
            <path id="map_16" vector-effect="non-scaling-stroke" fill="#EBECED" d="M164.055,227.954l-0.212,7.104c0-0.742,2.335-0.742,4.563-7.746C165.541,224.129,165.913,228.235,164.055,227.954z"/>
            <path id="map_17" vector-effect="non-scaling-stroke" fill="#EBECED" d="M460.255,250.374c-2.971-0.849-1.698-3.254-3.679-1.697c0.858,2.288-2.269,3.678-4.832,4.296c3.488,8.509,0.075,14.929,2.71,17.634c0.425-0.141,2.485-0.171,3.255-0.354C456.293,251.931,461.182,262.554,460.255,250.374z"/>
            <path id="map_18" vector-effect="non-scaling-stroke" fill="#EBECED" d="M728.371,193.355c0,2.334,15.317,4.189,8.913-1.379C732.403,187.731,729.22,192.083,728.371,193.355z"/>
            <path id="map_19" vector-effect="non-scaling-stroke" fill="#EBECED" d="M226.663,350.972c2.689,4.528-1.218,5.085,0.142,7.075c5.802,8.489,6.723,22.269,9.904,19.525c7.021-6.055,8.205,0.423,8.772,0.564c0.565,0.142,0.819-7.653,4.669-3.112c0.707-9.196,0.282-12.31,14.432-8.206c0.443-11.213-2.83-7.074-2.688-11.461c0.142-4.386-6.508,2.264-6.508-6.365c0-8.632-15.14-3.821-17.403-17.97c-0.806-5.032-5.518,3.679-13.583,2.829C231.05,342.907,223.976,346.444,226.663,350.972z"/>
            <path id="map_20" vector-effect="non-scaling-stroke" fill="#EBECED" d="M507.441,129.086c-17.297-4.104-6.792,3.784-4.458,6.756c0.625,0.642,1.911,1.38,3.078,2.016c0.292-1.731,0.946-2.319,1.928-3.739C508.832,132.898,509.238,131.374,507.441,129.086z"/>
            <path id="map_21" vector-effect="non-scaling-stroke" fill="#EBECED" d="M529.725,358.894c-4.563,2.76-6.048,0.153-10.08,1.35c-4.033,1.197-3.927,0.772-3.82,14.037c-3.396-0.638-3.707,0.429-3.396,10.294c5.199,3.925,0,6.366,2.334,7.321c6.293,2.574,4.279-7.832,9.869-4.775c6.79,3.714,6.048-3.502,8.17-3.502c2.123,0,1.91-5.624,9.232-9.02C539.796,374.046,532.802,367.171,529.725,358.894z"/>
            <path id="map_22" vector-effect="non-scaling-stroke" fill="#EBECED" d="M330.938,312.628c-3.643,0.426-9.621-9.496-14.927-8.164c-3.514,0.883-7.322-3.402-10.116-0.892c-0.952,0.856-2.299,3.008-1.697-0.989c0.408-2.719-7.181-8.366-12.451-4.528c-3.993,2.908,4.58-3.413-3.679-3.395c-6.898,0.015-3.572,3.907-5.8,0.989c-1.308-1.711,7.709-6.721,3.111-8.347c-2.069-0.733-1.751-8.568-3.819-9.479c-3.82,9.337-4.81,10.046-10.187,7.357c-2.061-1.029-1.456-1.604-6.791,1.416c-18.252,10.328-5.519-10.47-12.168-11.744c2.332,3.781-14.078,3.099-13.158,4.387c6.366,8.913-5.276,14.488-8.348,6.649c-3.396,3.112-11.319-0.708-7.641,3.74c2.654,3.21-5.235,0.646-0.824,5.598c2.049,2.299-0.029,13.158-0.734,14.007s-10.185-1.273-9.478,6.792c0.282,3.22-6.226,0.707,0.569,11.035c4.638,7.055,8.356,0,8.421,1.698c0.065,1.698-2.458,4.5,3.178,5.093c8.065,0.85,12.777-7.861,13.583-2.829c2.264,14.148,17.403,9.338,17.403,17.97c0,8.629,6.649,1.979,6.508,6.365c-0.142,4.387,3.132,0.248,2.688,11.461c-0.566,14.29,8.78,4.705,9.196,12.593c0.283,5.376,3.273-2.667,3.961,8.064c10.612,3.68-3.711,6.981-6.932,16.979c4.103,2.405,1.862-1.171,8.348,3.536c10.328,7.499,4.242,8.063,7.355,10.045c1.017-1.881,7.027-16.228,9.479-18.252c4.457-3.679-7.711-17.969,18.818-21.364c3.461-0.443,3.183-6.649,6.225-11.036c4.823-6.955,0.283-23.84,3.962-26.033c4.526-2.698,3.093-7.62,5.094-8.064C335.907,331.993,339.568,311.619,330.938,312.628z"/>
            <path id="map_23" vector-effect="non-scaling-stroke" fill="#EBECED" d="M821.523,275.142c-1.238,1.71-3.246,2.229-3.757,2.84C819.688,279.5,823.359,279.033,821.523,275.142z"/>
            <path id="map_24" vector-effect="non-scaling-stroke" fill="#EBECED" d="M535.35,133.189c-12.311-4.457-3.078,3.82-17.191-1.567c-2.228,3.158,2.829,4.22,0,6.872c1.062,0.637,1.415,2.111,0.866,3.921c6.35-3.443,7.941,2.128,10.647-2.011c0.105-1.379,3.13-0.053,4.563-0.955C532.166,131.491,535.88,137.645,535.35,133.189z"/>
            <path id="map_25" vector-effect="non-scaling-stroke" fill="#EBECED" d="M449.503,238.631c-9.253,0-9.329,6.801-11.512,6.523c-5.116-0.651-4.364,8.056-7.023,9.749c5.518,8.913,6.084-1.557,9.196,4.669c-0.566-4.104-3.395-7.429,8.771-6.226c1.74,0.172,1.569-0.073,2.809-0.373c2.563-0.618,5.69-2.008,4.832-4.296C454.596,250.232,450.775,241.319,449.503,238.631z"/>
            <path id="map_26" vector-effect="non-scaling-stroke" fill="#EBECED" d="M542.317,303.148c0.565,1.98,1.697,4.812,1.697,6.509c7.924-4.775,2.278-4.775,3.855-7.428C546.066,301.593,546.314,306.085,542.317,303.148z"/>
            <path id="map_27" vector-effect="non-scaling-stroke" fill="#EBECED" d="M791.934,249.809c6.791-2.017,2.041-7.747,2.229-9.338c-8.648-0.371-0.796,4.138-7.357,0.564c-0.253,2.184-11.036-4.385-7.073,7.924c3.323,7.853,1.909,1.415,6.083,5.943C797.569,253.755,784.756,251.938,791.934,249.809z"/>
            <path id="map_28" vector-effect="non-scaling-stroke" fill="#EBECED" d="M491.807,285.321c3.396,0.142,8.851,2.967,9.056,0.707c0.565-6.226-11.461-12.167-2.123-19.949c-10.648-14.043,3.82-7.356-0.53-9.903s3.184-6.943-3.855-10.471c0.707,5.094,2.688,0.991,1.741,4.953c-0.434,1.816-3.305,1.813-4.713,6.083c-8.914,27.023-5.659-3.254-14.855,20.091c2.423,3.749,3.184,0.991,3.75,1.981c0.565,0.99-0.532,0.441,0.212,6.225c1.839,0.001,2.688,0.283,4.669,0.283C487.138,285.321,488.411,285.18,491.807,285.321z"/>
            <path id="map_29" vector-effect="non-scaling-stroke" fill="#EBECED" d="M184.641,113.841c0.047,0.784,1.297,2.847,12.109,3.659c2.15-0.796,10-6.083,10.417-1.333c0.292,3.325,5.969,3.071,1.75,6.917c0.417,0.333,1.166,1.356,1.104,1.866c7.268,2.341,6.901-1.756,8.313,0.718c4.542,7.958-3.271,1.521-5.667,6.667c-1.337,2.872-3.386,4.54-3.25,3.333c-0.625,0.5-2.969,2.803-3.833,3.75c5.092-0.584,10.099-3.732,12.955-2.945c0.085-0.222,1.18-1.167,1.045-1.638c-6.206-0.787,6-4.167,9.167-3c6.375-7.575,13.813,0.495,19.188-5.521c11.139-12.466,8.318,0.609,9.003,2.242c1.557-0.989,7.781-2.405,7.781-1.414c0,0.99-1.919,1.455-2.97,1.98c-5.802,2.9-2.633,7.398,2.236,1.981c1.336-1.486,1.901,0,7.808-2.264c5.907-2.265,1.168-0.743,3.255-2.222c0.955-0.678,0.495,1.019,2.83-0.892c2.334-1.911,1.492-5.022-1.274-2.83c-3.198,2.537-1.414,2.688-2.688,3.417c-1.055,0.604,0.354-1.754-3.304-0.021c-1.924,0.911-7.449-3.962-3.63-6.934c1.611-1.253-0.494-0.141-2.264-1.132c-1.855-1.04,7.068-0.195,5.802-3.678c-1.981-5.447-21.506,7.356-21.789,6.79c-0.283-0.564,8.824-7.528,11.319-7.781c4.881-0.495,2.621-4.716,11.318-3.819c18.534,1.909,13.937-2.706,20.799-3.961c11.602-2.124,5.081-3.661,6.933-5.095c4.386-3.396-4.551-5.067-2.405-5.234c5.446-0.425-10.894-6.933-7.074-7.641c3.82-0.708,0.037-14.828-1.697-13.017c-11.178,11.672-14.716,4.952-13.441,2.122c1.272-2.829,4.894-4.705,1.697-4.386c-4.952,0.494-6.155-4.569-6.933-4.598c-17.191-0.638-11.465,3.409-13.441,4.456c-3.467,1.839,3.679,2.405-7.074,7.499c-1.259,0.597,10.824,6.861-10.753,14.007c-1.255,0.416,1.202,3.536-1.273,5.094c-0.813,0.512,1.345,4.386-3.82,5.518c-3.115,0.684-1.839,2.688-3.536,0.425c-1.698-2.264-2.547-5.376-0.566-7.217c1.981-1.839-1.486-1.698,2.547-5.093c0.612-0.516-6.226,0.637-11.036-2.83c-1.171-0.843-6.933-5.376-8.631-4.526c-1.698,0.849-4.364,1.752-2.971-0.425s2.983-4.896,1.414-4.812c-11.53,0.637,12.133-13.846,16.554-13.724c5.094,0.142-3.01-2.047,6.367-3.679c16.271-2.83,3.75-2.688,4.952-5.234c0.632-1.337,2.734,3.423,6.933-0.566c4.245-4.032,4.246-0.068,7.358-0.989c15.775-4.671,7.216-5.095,9.195-6.792c1.981-1.697,7.782-2.405,0.566-4.104s-3.154,1.005-4.244,1.839c-7.57,5.801-6.084,1.133-7.216,2.405c-1.132,1.274,0.85,1.062-1.84,2.831c-2.688,1.768-4.173-1.77-1.132-2.689c3.042-0.92,0.277-4.43-0.849-3.254c-3.184,3.324-4.572,2.693-3.537,1.274c3.041-4.175-1.839-1.027-1.98-2.565s5.941-0.761,3.112-3.095c-1.319-1.088,1.132-2.122,0.142-2.83c-0.99-0.707,0-1.273,1.98-2.264c1.981-0.99,12.633-4.251,11.178-4.669c-12.593-3.608-12.054,4.223-19.242,7.358c-13.301,5.799,3.768,4.656-2.688,8.771c-1.359,0.867-6.154,4.599-8.348,3.82c-2.193-0.779,3.608-1.91,1.415-2.972c-2.194-1.062,6.014-0.424,2.264-3.679s-3.105,0.785-5.801,0.849c-5.943,0.141,4.806,3.277-6.1,3.962c-19.155,1.202-5.502-3.184-15.123-2.547c-9.621,0.636-3.483,3.021-5.094,3.113c-26.176,1.484-11.885-0.707-12.593-2.688c-0.707-1.982-5.659,1.343-10.752-2.688c-3.586-2.839-6.862,0.778-8.349,0.141c-1.485-0.636,2.124-1.696,0.566-2.263c-1.557-0.566-6.594,5.228-6.084,0.849c0.156-1.345,0.708-1.839-2.829-0.565c-3.538,1.272,0.608-0.355-9.621,0.707c-18.575,1.927-9.339,4.244-14.715,3.113c-2.72-0.572,0.409-1.561-7.074-2.405c-3.436,2.547-31.398,25.703-35.91,29.994c0,0,4.312-1.136,4.358,1.415c0.142,7.64,11.972-5.088,7.641,5.234c-3.487,8.31,6.346,7.643-4.951,12.168c-0.676,4.501-5.66,8.63,5.375,20.232l78.525,0.009C182.52,113.85,184.48,111.157,184.641,113.841z M218.81,39.702c1.329-1.025,0.85-4.032,3.927-4.988c3.077-0.954,4.741-3.253-3.714-1.484c-5.837,1.22-4.669,5.518-6.686,5.411c-2.016-0.106,1.587-1.594-0.53-3.395s-1.592,2.334-5.942-0.426c-4.351-2.758-18.836,2.123-20.162,4.988c-1.565,3.382,9.728,1.021,12.31,2.44c2.122,1.167-14.699,0.112-14.432,2.122c0.384,2.88,7.641-0.054,5.625,2.999c-2.098,3.173,15.635-0.846,16.766-1.514c2.334-1.379,0.523,1.591,9.655,1.486c4.991-0.058,1.699-1.805,2.017-2.653c0.318-0.849,3.396,1.009,4.775-0.637C223.798,42.408,215.096,42.567,218.81,39.702z M172.544,37.686c4.298,0,0.445,3.735,3.077,2.76c4.723-1.751,6.678-0.157,7.956-2.017c1.86-2.706,18.459-4.608,17.724-5.849c-1.91-3.224-5.783-0.306-7.905-1.845c-1.248-0.904-11.035-1.061-9.818,1.114C184.277,33.101,169.239,37.686,172.544,37.686z M203.265,28.189c4.51,2.589,8.387,2.595,15.015,1.113c4.51-1.007,6.049,0.806,12.999-2.122c2.34-0.985,0.106-1.751-0.796-1.38c-0.902,0.372-4.244,0.955-1.963-1.751c0.679-0.805-6.738,0.16-5.04,2.424c0.807,1.075-6.367,2.034-5.784-1.469C218.082,22.693,202.605,27.811,203.265,28.189z M202.114,27.394c0.772,0.446,10.382-3.82,12.239-4.104c1.856-0.283,2.759-1.945-0.849-1.132c-2.528,0.569-2.494-1.186-16.837,2.971C192.117,26.448,198.542,25.324,202.114,27.394z M234.25,19.381c0.786-0.491-7.958-2.175-11.832,2.335C222.063,22.13,228.731,22.83,234.25,19.381z M236.319,32.063c-8.324,1.159-0.879,2.438-3.184,3.131c-3.184,0.954-2.669-1.505-4.784-0.638c-3.493,1.433,3.101,5.391,3.961,5.199c2.149-0.477,8.039-1.963,7.189-4.562C238.955,33.516,248.947,30.303,236.319,32.063z M240.829,27.977c-0.318,1.486,5.094,1.486,9.709-2.547c1.136-0.992-0.759-1.1-3.342-1.434c-2.584-0.331-4.797-0.297-5.306,0.956c-0.69,1.697-3.344-2.883-6.103,0.372C233.87,27.587,241.146,26.491,240.829,27.977z M248.629,28.887c7.851,2.723,8.206-1.353,5.729-1.851C253.616,26.886,247.727,28.573,248.629,28.887z M248.535,19.965c2.004-0.142,1.792,1.911,5.293,0.318c3.502-1.591-2.887-4.227-6.933-3.431C242.579,17.701,247.429,20.044,248.535,19.965z M259.028,22.158c8.063,1.66,3.819-3.359,0.565-3.679C256.319,18.158,256.663,21.672,259.028,22.158z M299.315,49.394c-7.895-2.827,9.479-2.051-2.477-8.913c-7.375-4.233-4.88,3.112-8.842-3.607c-1.547-2.624,1.768-4.811-8.49-4.387c-1.816,0.075,0.85,3.82-1.414,3.749c-1.204-0.037,2.334-3.786-3.113-3.324c-9.185,0.778-10.752,4.103-11.46,3.324c-0.707-0.778,2.476-2.193,5.235-2.83c3.531-0.814-5.589-2.415-15.988,5.023c-2.489,1.781,3.749,1.698,3.82,2.547c0.07,0.849-10.824-0.283-1.769,1.98c2.338,0.585,11.368,2.518,12.097,1.062c0.92-1.84,6.722,1.557,7.569-0.919c0.853-2.484,16.578,9.188,4.117,11.389c-8.008,1.415,4.23,3.891-9.705,4.032c-6.65,0.067-7.853,4.244,2.404,2.405c4.594-0.823,2.052,5.235,12.664,8.277c4.495,1.289,5.729,0.425,3.112-2.052c-2.618-2.476-2.052-4.315,1.414-1.132c3.467,3.184,9.551-1.062,4.175-6.649c-2.567-2.669,2.192-6.085,4.032-1.769c1.479,3.469,3.536,2.264,6.649-0.354C306.46,54.629,312.545,54.134,299.315,49.394z M257.966,25.695c11.18,0.657-16.184,7.164,23.452,4.607c4.895-0.317,8.913-5.032-10.294-2.804c-11.178,1.297,0.638-2.44-9.443-3.681C251.599,22.578,256.378,25.602,257.966,25.695z M274.733,20.362c5.198-1.087,7.585,1.17,7.108,1.707c-0.476,0.535-2.617-1.748-4.881-1.178c-4.669,1.178,2.39,1.381-7.216,3.054c-9.825,1.71,8.702,0.688,19.207,1.432c13.124,0.928-2.229-1.856,10.823-4.245c9.568-1.751,3.607-4.396,9.55-4.456c4.818-0.05,6.049-1.486,30.137-5.943c8.923-1.65-8.171-4.351-37.141-1.167c-5.809,0.639-3.607-1.479-20.691,1.592c-2.645,0.475,5.306,3.184,3.839,4.138c-1.466,0.956-5.112-6.153-18.483-0.105C264.509,16.31,269.533,21.45,274.733,20.362z M278.552,49.252c0-0.636-6.79-0.136-6.79,2.865C271.762,53.921,278.552,51.905,278.552,49.252z M242.739,65.24c5.783-1.556,6.245-4.074,7.198-2.617c2.546,3.891,7.245,1.289,5.021-0.142c-7.145-4.599-4.88-5.589-6.508-5.942c-1.627-0.354-5.942,2.836-6.155,4.425c-0.211,1.588-7.711,3.427-2.192,2.721C243.994,63.186,237.668,66.604,242.739,65.24z M292.108,121.623c0.293,1.379,4.695-2.865,5.863,0.53c0.973,2.832,5.942-3.608,2.36-4.245c-2.662-0.473,2.627-1.592,0-2.229c-2.628-0.637,3.58-2.645-2.147-2.759c-10.023-0.198,2.918-7.854,0-7.853c-5.602,0.003-12.204,11.461-15.069,13.158c-1.617,0.959,6.39,1.521,8.993,1.167C296.804,118.758,291.816,120.242,292.108,121.623z M278.234,113.969c0.743-1.074-5.921-4.138-6.791-2.64S277.876,114.487,278.234,113.969z M268.365,121.835c-2.813,1.325,2.335,5.173,5.094,1.697C272.262,123.293,268.152,123.639,268.365,121.835z M89.563,102.946c0.173,1.188,1.804-4.386,4.387-6.65C88.813,95.023,88.783,97.569,89.563,102.946z M96.248,108.357c-4.608-1.229-4.053-1.218-1.485,3.184c3.714,6.367,10.293,4.669,6.366,1.91C97.203,110.692,102.615,110.057,96.248,108.357z M218.667,136.5c-0.041-0.013-0.087-0.017-0.128-0.029C218.518,136.524,218.538,136.548,218.667,136.5z"/>
            <path id="map_30" vector-effect="non-scaling-stroke" fill="#EBECED" d="M516.001,258.581c-1.252,2.32-5.235,0.849-6.934,4.244c-1.697,3.396-6.851,0.355-10.328,3.254c-9.338,7.782,2.688,13.724,2.123,19.949c1.272-3.961-0.106-8.524,7.958-6.083c1.061-9.692,4.351-2.229,10.399-1.429c6.048,0.802-2.335-2.922,17.862-4.089c-5.96-10.816-12.593-8.773-12.026-16.555c0.217-2.977-0.849-3.254-2.405-4.669C522.723,254.976,519.508,252.08,516.001,258.581z"/>
            <path id="map_31" vector-effect="non-scaling-stroke" fill="#EBECED" d="M496.617,209.201c0.141,6.509,3.962,7.642,2.83,10.329c-1.133,2.688-0.215,11.784-1.31,12.684c-1.097,0.898-6.897,8.115-5.341,10.803c1.557,2.688,1.28,0.707,1.557,2.688c7.039,3.527-0.495,7.924,3.855,10.471s-10.118-4.14,0.53,9.903c3.478-2.898,8.631,0.142,10.328-3.254c1.698-3.396,5.682-1.924,6.934-4.244c3.507-6.501,6.722-3.605,6.649-5.377c-0.424-10.328-5.952-1.132-2.98-9.763c2.97-8.63,5.33-7.429,5.33-7.429v-14.077c0,0-23.997-13.336-25.139-13.963S498.917,208,496.617,209.201z"/>
            <path id="map_32" vector-effect="non-scaling-stroke" fill="#EBECED" d="M251.848,481.563c-2.829-5.942-3.585,0.79-5.8-4.528c-2.83-6.791,7.216,2.264-5.943-25.608c-7.648-16.201,0.142-12.025-3.82-19.384c-3.961-7.357,3.232-4.896-3.435-20.657c-6.045-14.29,4.85-14.006,0.605-22.778c-2.756-5.695,5.093-3.396,3.254-11.035c-3.182,2.743-4.103-11.036-9.904-19.525c-2.831,1.484,1.412,1.693-2.831,2.969c3.379,2.109,3.623,34.108,3.255,40.041c-0.566,9.126,5.022,14.007,1.839,25.892c-2.668,9.962,2.405,1.556,3.538,22.921c0.157,2.968,2.404,5.306,2.404,0.142c0.001-8.367,2.437,2.586,3.113,6.226c1.132,6.083-4.387-4.952-3.679,9.197c0.095,1.885,4.457-0.992,5.094,1.272c0.636,2.265-3.679,0.991-2.122,3.82c1.557,2.83,15.209,26.032,35.795,24.194c2.737-0.244,2.159-0.531,3.254-0.849c2.194-0.638-5.069,0.155-12.449-8.772C254.676,480.995,254.678,487.506,251.848,481.563z"/>
            <path id="map_33" vector-effect="non-scaling-stroke" fill="#EBECED" d="M837.986,128.626c1.252,0.588,1.061-15.6-6.685-10.823c-5.736,3.535-5.306-4.458-15.068-5.2c-9.763-0.743-7.747-14.537-28.085-13.795c-4.358,0.159-3.033,2.467-1.202,3.396c1.83,0.928,2.971,11.885-5.306,9.231c1.637,0.764-3.147,9.294,6.791,6.897c3.962-0.956,9.55,3.36,9.02,4.457c-0.531,1.097-8.524-2.653-9.02,1.721c-0.572,5.049-4.175,0.507-4.882,4.222c-0.491,2.583-5.584-1.931-6.685,0.106c-1.875,3.465,10.135,9.085-4.669,9.231c-11.922,0.118-6.615,6.543-15.812,1.485s-18.181,0.854-24.3-6.261c-7.949-9.242-17.934-1.628-17.51-9.55c0.137-2.542-8.029-8.242-13.688-9.763c-9.096,5.196,3.714,11.036-10.188,6.579c-1.375-0.441,4.881,7.321-6.366,8.064c-1.919,0.126,5.729,10.505,4.562,10.399c-3.186-0.29-6.877,6.322-9.443,5.199c-3.396-1.485-7.666,2.315-7.666,4.67c0,4.881,8.833,3.289,5.332,8.064c9.868,4.455,0.037-0.055,9.443,6.554c21.688,15.238-9.624,3.397,14.571,19.215c3.508,2.293,0.701-3.894,10.794,4.3c2.034,1.652,8.574,3.972,13.685,3.887c1.616-0.027,2.76,0.105,2.76,2.44c0.849-1.272,4.032-5.624,8.913-1.379c8.808-1.592,3.714-10.081,17.51-2.229c14.312,8.147,0,8.807,3.288,14.113c3.29,5.306,2.229-0.107,5.518,3.714c3.291,3.82-2.439,2.546,2.335,5.729c4.775,3.184,1.698-1.485,4.881,1.698c3.624,3.622,1.48-5.657,2.76-3.819c10.452-0.319,5.253-4.139,9.02-3.184c10.729,2.719-0.583,3.502,10.577,6.438c7.781-1.062,3.891,5.589,7.499,4.527c1.499-0.44-4.033-3.112,3.395-4.669c3.496-0.732,7.498-4.245,13.3-4.527c1.041-0.051,10.47-7.428,12.592-23.77c0.503-3.866-3.82-1.698-4.244-3.962c-0.17-0.907,8.489-0.426-8.914-14.874c-5.004-4.156,1.338-8.404,3.821-9.179c5.445-1.698-4.741-3.962-6.509-1.414c-2.4,3.456-3.395-3.537-6.226-2.831c-2.83,0.708-5.801-4.951-0.989-3.82c3.43,0.809,2.545-7.78,7.356-5.8c3.632,1.496-0.707,1.769,1.697,4.811c2.405,3.042,1.84-2.972,6.792-1.839c5.129-1.592,2.829-8.278,7.393-6.017c4.563,2.262-1.273-5.976,6.897-3.181C833.636,129.051,834.697,127.081,837.986,128.626z M802.969,220.521c-1.061-1.699-8.913,1.379-6.897,4.986c2.016,3.608,6.367-0.105,5.624-2.122C801.241,222.154,804.03,222.219,802.969,220.521z"/>
            <path id="map_34" vector-effect="non-scaling-stroke" fill="#EBECED" d="M204.591,293.74c10.081,6.154,4.397,9.765,8.21,9.338c16.09-1.805,3.25,2.971,8.908,6.155c0.705-0.849,2.783-11.708,0.734-14.007c-4.411-4.952,3.479-2.388,0.824-5.598c-3.679-4.448,4.244-0.628,7.641-3.74c-5.377-13.724,3.438-15.563-4.527-14.573c-7.966,0.99-0.142-3.819-7.642-3.962c-7.497-0.144-7.709-13.866-1.697-14.716c-0.92-2.335,2.688-1.627,2.264-3.396c-0.846-3.525-4.67,3.113-8.631,3.113c-1.581,0-6.297,1.202-5.941,5.093c0.211,2.33-4.388,6.226-6.226,4.387c1.344,3.042-1.274,3.962-1.698,5.519c1.131,1.131,2.688,11.954,0.565,15.628c-2.121,3.672-4.104-0.489-4.386,5.736C202.257,295.649,198.657,290.117,204.591,293.74z"/>
            <path id="map_35" vector-effect="non-scaling-stroke" fill="#EBECED" d="M588.5,335.583c-1.917,0.166-0.667,1.75,0.5,2.167S589.912,335.461,588.5,335.583z"/>
            <path id="map_36" vector-effect="non-scaling-stroke" fill="#EBECED" d="M501.18,304.154c1.062-10.172,6.58-5.64,5.094-10.84c-1.485-5.199,1.681-5.458,2.547-13.369c-8.064-2.441-6.686,2.122-7.958,6.083c-0.205,2.26-5.66-0.565-9.056-0.707c-2.237,7.706,2.364,0.377,3.537,4.81c0.783,2.961-5.774,2.896-1.879,4.632s1.9,10.649-2.366,7.467c-6.537-4.881-3.147,3.396-6.296,5.941c1.176,1.573,2.123,2.688,2.76,3.891C493.045,307.358,500.119,314.326,501.18,304.154z"/>
            <path id="map_37" vector-effect="non-scaling-stroke" fill="#EBECED" d="M179.229,254.053c-5.978-2.264-2.157,1.202-7.322-1.133c-2.051,3.468,1.84,6.085,2.265,5.236c0.425-0.85-0.425-3.254,6.366,4.811l1.132-4.457C180.628,258.04,179.316,255.097,179.229,254.053z"/>
            <path id="map_38" vector-effect="non-scaling-stroke" fill="#EBECED" d="M507.441,129.086c-0.727-0.925-0.106-2.264-0.708-3.7c-2.972,2.037-5.792-1.713-7.286-3.142c-0.919,1.643-1.446,2.986-2.725,3.729c-3.713,2.157-4.633-0.673-5.411,0c1.376-0.091-0.85,1.732,0.637,2.865c1.485,1.131,3.201-1.206,3.396,0.212c0.707,5.164,5.094,4.173,7.64,6.791C500.649,132.87,490.145,124.982,507.441,129.086z"/>
            <path id="map_39" vector-effect="non-scaling-stroke" fill="#EBECED" d="M207.774,220.521c8.909-0.349,4.882-1.805,1.804-2.76c-3.077-0.955-16.872-16.129-28.863-5.199c-1.686,1.537,5.624-2.123,7.853-2.123c3.715,0-3.077,1.805,5.412,2.972c8.815,1.212,2.924,4.669,7.959,4.351C208.552,217.344,196.904,220.945,207.774,220.521z"/>
            <path id="map_40" vector-effect="non-scaling-stroke" fill="#EBECED" d="M556.041,162.477c1.732-1.521-9.73,2.767-6.367,4.032C552.496,167.569,554.309,163.998,556.041,162.477z"/>
            <path id="map_41" vector-effect="non-scaling-stroke" fill="#EBECED" d="M500.862,115.468c3.607-0.566,1.768-1.485,5.164-3.113c2.571-1.232-10.188-1.432-10.896-5.235c-13.724,2.548-3.465,7.642-2.546,8.419C497.396,117.731,492.16,112.779,500.862,115.468z"/>
            <path id="map_42" vector-effect="non-scaling-stroke" fill="#EBECED" d="M440.164,259.571c-3.112-6.226-3.679,4.244-9.196-4.669c-4.669,2.971-0.515-1.415-8.109,1.273c-0.7,5.942,3.299,4.739-2.009,9.762c-0.35,7.646,4.817,2.477,3.398,11.886c6.844-3.821,11.728-3.466,14.997-2.547C434.505,266.787,443.527,266.298,440.164,259.571z"/>
            <path id="map_43" vector-effect="non-scaling-stroke" fill="#EBECED" d="M502.453,316.165c0.318,2.086-0.318,7.499,5.837,6.969c6.155-0.531,0.637-5.095,7.004-3.609c6.366,1.486,3.82-0.317,3.926,2.124c0.106,2.439-2.229,13.688,7.003,12.733c6.663-0.69,3.501,3.126,7.216,3.077c7.959-0.105,9.15,8.398,10.576,5.199c2.175-4.881-3.784-2.697-3.784-6.336s-1.059-13.613,8.172-12.658c-0.716-0.989-4.388-12.31-4.388-14.007s-1.132-4.528-1.697-6.509c-0.393-1.373,0.307-2.428,1.053-3.544c-0.002,0.002-0.003,0.004-0.005,0.006c0.002-0.002,0.003-0.004,0.005-0.006c0.33-0.493,0.668-0.998,0.927-1.55c5.236-11.153,4.408-15.03,4.104-17.686c-0.566-4.951-7.499,0.991-11.319-5.941c-20.197,1.167-11.814,4.891-17.862,4.089c-6.049-0.801-9.339-8.264-10.399,1.429c-0.866,7.911-4.032,8.17-2.547,13.369c1.486,5.2-4.032,0.668-5.094,10.84c-1.061,10.172-8.135,3.204-13.617,7.907c0.637,1.204,0.698,3.256,1.061,4.104C491.948,315.068,502.135,314.078,502.453,316.165z"/>
            <path id="map_44" vector-effect="non-scaling-stroke" fill="#EBECED" d="M481.055,93.607c-2.064-3.379,2.917-4.368,1.413-5.659c-1.503-1.291-0.618-1.821,0-3.254c0.619-1.432-1.141-0.882-1.979,0c-2.069,2.176-6.367-0.424-3.255,8.913C479.64,94.527,478.437,92.688,481.055,93.607z M483.61,93.693c2.524,2.034,3.407-2.887,2.051-3.858C484.714,89.158,481.086,91.66,483.61,93.693z"/>
            <path id="map_45" vector-effect="non-scaling-stroke" fill="#EBECED" d="M585.01,247.58c0.885,1.307-5.447,5.519,2.158,5.624c0.22-1.561,1.486-1.91,1.486-1.91c-0.52-1.066-2.423,0.675-2.406,0c0.036-1.45,4.245-0.637,1.345-4.456C586.248,245.989,586.814,248.535,585.01,247.58z"/>
            <path id="map_46" vector-effect="non-scaling-stroke" fill="#EBECED" d="M219.576,227.699c1.047,3.43,1.204-1.768,6.196-1.298c5.321,0.501,6.417-1.549,2.196-2.375c-2.404-0.471,0.079-2.227-7.346-2.876C219.438,223.75,220.84,226.648,219.576,227.699z"/>
            <path id="map_47" vector-effect="non-scaling-stroke" fill="#EBECED" d="M192.989,311.566c1.627-11.672,15.315-5.942,11.602-17.826c-5.934-3.623-2.334,1.909-11.602-5.022c-0.051,1.132-4.457,0.353-6.861,10.398c-1.435,5.995,6.225,3.607,2.192,6.933C188.038,308.49,192.65,313.996,192.989,311.566z"/>
            <path id="map_48" vector-effect="non-scaling-stroke" fill="#EBECED" d="M550.17,178.995c-6.722-3.607-7.924,4.315-15.209-0.354c-2.905-1.861-6.407-0.003-6.934-1.203c-3.473,5.563,0.285,5.13,0.105,8.849c-0.181,3.724,0,18.712,0,26.712h37.433c-1.398-2-3.008-3.307-3.369-4.287c-2.953-7.99,4.386,3.499-5.051-11.836c-0.359-0.583-0.998-2.707-1.034-3.662c-0.034-0.955-3.041-2.016-4.598-7.003c-0.82-2.63,0.389-0.178,1.628,0.636c1.576,1.037-1.274-0.178,3.961,4.951c0.354-1.414,1.273-5.447,1.698-6.508c-0.284-0.565-2.193-5.518-2.76-6.508C554.415,179.49,552.232,180.103,550.17,178.995z"/>
            <path id="map_49" vector-effect="non-scaling-stroke" fill="#EBECED" d="M161.713,240.471c-2.114,1.061,0.009,0.212-3.246,2.405c8.771,4.881,6.604,1.297,8.206,1.697C166.071,239.338,165.88,244.916,161.713,240.471z"/>
            <path id="map_50" vector-effect="non-scaling-stroke" fill="#EBECED" d="M485.157,285.321c-1.981,0-2.83-0.282-4.669-0.283c0.242,1.89-1.19,3.028-0.778,5.022C484.333,290.167,486.064,291.726,485.157,285.321z"/>
            <path id="map_51" vector-effect="non-scaling-stroke" fill="#EBECED" d="M566.228,241.213c3.185-0.796,11.461-4.456,18.782,6.367c1.805,0.955,1.238-1.591,2.583-0.742c-9.472-12.474-10.93-4.492-14.856-19.455C570.049,232.214,565.804,228.161,566.228,241.213z"/>
            <path id="map_52" vector-effect="non-scaling-stroke" fill="#EBECED" d="M527.072,84.376c2.849-2.44-2.335-1.856,1.097-6.33c-1.574,0.865-13.459-3.113-15.563,3.678c-0.992,3.203,5.234-3.078,6.226,1.557C523.287,81.158,524.561,85.614,527.072,84.376z"/>
            <path id="map_53" vector-effect="non-scaling-stroke" fill="#EBECED" d="M555.476,263.815c0.707,2.689,6.509,1.698,9.337,13.017c0.723,2.887,2.19-0.863,7.075,2.83c5.802,4.386,2.264-1.415,12.45-1.132c3.875,0.106,3.962-3.537,7.498-3.112c3.539,0.424,11.886-11.461,11.886-11.461s-17.968-0.708-16.554-10.753c-7.605-0.105-1.273-4.317-2.158-5.624c-7.321-10.823-15.598-7.163-18.782-6.367c0.302,9.25-6.543,8.065-7.356,17.51C559.721,266.221,554.769,261.128,555.476,263.815z"/>
            <path id="map_54" vector-effect="non-scaling-stroke" fill="#EBECED" d="M986.951,368.602c-2.56-1.811-4.121,1.874-2.436,3.248C986.202,373.224,988.074,369.396,986.951,368.602z M992.01,365.854c-0.874-0.124-5.847,0.35-3.872,2.256C989.699,369.617,992.884,365.979,992.01,365.854z"/>
            <path id="map_55" vector-effect="non-scaling-stroke" fill="#EBECED" d="M531.741,63.153c2.484-1.657-4.458-2.764-2.352-4.987c2.612-2.76-4.318-3.077-1.15-6.049c2.407-2.257-5.2-2.865-2.653-4.668c0.568-0.403,0.88-0.703,1.083-0.947c-7.153-5.646-8.051-0.523-9.466,1.759c-1.415,2.283-9.421-4.926-10.752-1.344c4.597,3.537,6.579-0.282,8.843,10.046c7.006-0.854,1.325,4.067-2.688,7.074c-4.73,3.543-1.747,3.825-2.264,7.641c-1.045,7.71,11.054,2.563,16.695,2.829C543.467,64.427,528.08,65.595,531.741,63.153z"/>
            <path id="map_56" vector-effect="non-scaling-stroke" fill="#EBECED" d="M472.564,128.839c1.698-3.468-3.112-0.425,0-3.75c-4.881-1.485-0.07-4.881,1.557-5.73c-1.432-0.106,2.666-5.108,1.222-5.018c-4.83,0.304-2.771-1.336-4.83-2.269c-3.112,1.344-9.007-2.336-10.822-5.235c-4.988,0.938-1.133,4.032-4.812,4.174s1.202,3.962-5.518,1.273c-0.841-0.337-2.814-0.862-1.557,0.566c2.617,2.971-1.627,4.314-3.112,2.688c-1.486-1.627-1.345,0.354-4.387,0c-1.968-0.229-1.448,2.561,0.142,2.831c11.673,1.979,7.774,14.956,5.872,16.058c8.212,5.261,6.681,0.886,9.29,2.714c0.728-1.084,1.938,0,1.391,0.719c2.052,1.112,3.02-0.73,4.104-0.107c-1.186-7.768,6.014,0.495,12.734-4.669C475.462,130.748,470.867,132.305,472.564,128.839z M479.533,136.054c-1.394,1.91-4.988,2.918-0.85,5.836C479.427,140.723,480.276,139.768,479.533,136.054z"/>
            <path id="map_57" vector-effect="non-scaling-stroke" fill="#EBECED" d="M271.373,285.181c5.377,2.688,6.366,1.979,10.187-7.357c-4.175-1.84-1.557-2.547-7.216-5.235C267.729,280.369,276.483,278.885,271.373,285.181z"/>
            <path id="map_58" vector-effect="non-scaling-stroke" fill="#EBECED" d="M491.099,302.229c4.267,3.183,6.262-5.731,2.366-7.467s2.662-1.671,1.879-4.632c-1.173-4.433-5.774,2.896-3.537-4.81c-3.396-0.142-4.669,0-6.649,0c0.907,6.404-0.824,4.846-5.447,4.739c2.316,11.213-9.145-0.937,5.093,18.11C487.951,305.625,484.562,297.349,491.099,302.229z"/>
            <path id="map_59" vector-effect="non-scaling-stroke" fill="#EBECED" d="M584.586,142.393c3.289-1.564,6.791,2.687,4.457-2.25c-6.721-4.089-17.934-6.848-19.914-5.503c2.332,2.628,8.276,3.395,5.589,6.649c2.334,0.707,4.987-1.146,6.048,1.662C582.357,142.527,583.136,143.081,584.586,142.393z"/>
            <path id="map_60" vector-effect="non-scaling-stroke" fill="#EBECED" d="M469.947,106.696c1.566,2.23-0.466,3.094-0.798,3.953c1.976-0.337,1.364,1.423,1.364,1.423c2.059,0.933,0,2.572,4.83,2.269c1.444-0.091-2.653,4.911-1.222,5.018c1.91,0.143,3.97-0.989,5.698,0c1.729,0.99,8.18-0.44,9.794,0.014c2.477,0.694-3.395-2.277,2.972-3.834c-0.919-0.777-11.178-5.871,2.546-8.419c-1.559-8.381-1.061,0.921-3.041-9.974c-3.431-5.341-6.986,3.095-11.035-3.538c-2.618-0.919-1.415,0.92-3.821,0c2.037,6.11-3.961,2.707-4.669,5.235C476.172,103.371,467.613,103.371,469.947,106.696z"/>
            <path id="map_61" vector-effect="non-scaling-stroke" fill="#EBECED" d="M448.936,253.346c-12.166-1.203-9.338,2.122-8.771,6.226c3.363,6.727-5.659,7.216-0.919,15.705c6.296,1.769,2.121-0.283,13.371-4.032C446.92,267.105,452.616,263.55,448.936,253.346z"/>
            <path id="map_62" vector-effect="non-scaling-stroke" fill="#EBECED" d="M529.672,140.404c-2.706,4.139-4.298-1.433-10.647,2.011c-2.163,1.174-3.307,0.961-5.11,1.385c-1.38,5.095-1.38-0.318-2.972,4.245c4.257,6.264,5.518,4.033,5.729,4.668c0.213,0.638-2.021,1.096-1.485,2.653c1.981,5.766,1.293,1.356,3.396,3.078c4.104,3.359-0.354-3.856,1.805-2.547c2.157,1.309-1.45-2.531,0.955-1.566s3.147-2.396,0.849-3.209c-2.298-0.814-5.73-6.792-2.229-5.411c3.502,1.379,0.495-2.441,2.865-1.486s3.319-1.772,5.837-0.425C530.998,141.678,529.565,141.784,529.672,140.404z M530.937,164.915c0.058-0.829-7.111-2.802-8.484-1.887C520.068,164.616,530.878,165.745,530.937,164.915z"/>
            <path id="map_63" vector-effect="non-scaling-stroke" fill="#EBECED" d="M398.71,40.409c2.495-2.641,0.389,2.158,7.78,1.981c3.125-0.074,1.217-3.003,1.698-5.802c1.054-6.119,8.419-1.875,9.293-8.347c0.576-4.274-3.791-2.055-3.351-3.537c1.353-4.548,7.145,3.431,6.508-2.829c-0.358-3.524,0.278-7.959,9.479-8.208c4.45-0.12,12.965-3.168-7.868-1.979c-11.463,0.654,6.241-3.396-19.154-4.528c-25.397-1.132-5.482,2.617-20.799,0.849c-20.948-2.418-5.059,3.467-11.921,2.689s-32.187-1.026-28.686,1.414c3.501,2.441-4.775-0.743-12.593,1.557c-7.818,2.3,1.415,0.283-0.141,2.688c-1.557,2.406-18.57,2.122-19.951,3.679c-1.379,1.556,11.387,1.69,9.764,2.264c-5.412,1.91-14.855-2.759-8.63,1.84c5.755,4.251,22.318-3.75,24.618,7.923c1.14,5.784-3.572,4.138-3.82,7.074s8.206-0.496,8.205,2.364c0,2.858-7.002-2.754-9.84,2.446c-1.643,3.01,4.854,2.652,7.011,0.425c2.157-2.228,0.813,4.138-2.972,3.961c-3.784-0.177-10.752,3.891-3.82,21.931c2.641,6.871,5.059-0.53,8.349,4.669c3.681,5.819,9.681-4.856,9.762-5.377c0.85-5.404,6.262-3.325,8.49-8.489c2.729-6.327,13.265-1.54,20.515-8.913c3.791-3.854,17.155-1.734,28.298-8.206C407.028,42.729,395.065,44.266,398.71,40.409z"/>
            <path id="map_64" vector-effect="non-scaling-stroke" fill="#EBECED" d="M161.713,240.471c2.114-1.062-1.248-1.133,4.358-4.67c-1.139,0.064-2.229,0-2.229-0.742l0.212-7.104c-7.003-1.064-7.033,3.255-5.305,4.982c3.819,3.82-3.715-2.441-6.226,7.25c2.226,3.091,4.088,1.657,5.942,2.689C161.722,240.683,159.599,241.531,161.713,240.471z"/>
            <path id="map_65" vector-effect="non-scaling-stroke" fill="#EBECED" d="M414.979,262.967c2.123-3.537,3.086,5.605,5.87,2.971c5.308-5.022,1.309-3.819,2.009-9.762c1.581-13.434-9.576-2.688-10.85-7.641c-5.73,0.495-0.92-0.707-7.64-1.132c1.556,5.942-1.627,0.604-3.962,5.942c1.308,1.425,5.164,3.784,5.659,7.216C409.917,255.5,414.709,256.1,414.979,262.967z"/>
            <path id="map_66" vector-effect="non-scaling-stroke" fill="#EBECED" d="M404.369,247.403c-6.721-0.425-5.943,1.273-9.127,1.273c1.787,2.936,3.113,1.061,3.75,1.626c0.637,0.566-1.539-0.177,1.415,3.043C402.742,248.007,405.925,253.346,404.369,247.403z"/>
            <path id="map_67" vector-effect="non-scaling-stroke" fill="#EBECED" d="M253.971,267.92c-0.85,2.123-6.792-1.557-1.557,6.933c6.649,1.274-6.084,22.072,12.168,11.744c-2.265-7.924-3.396-3.396-3.918-8.349c-0.521-4.951,3.352-0.282,2.927-6.792c-4.178-4.658-3.82-0.496-4.89-1.274c-1.026-0.746,4.535-2.405-3.741-7.356C248.31,269.049,254.819,265.798,253.971,267.92z"/>
            <path id="map_68" vector-effect="non-scaling-stroke" fill="#EBECED" d="M219.576,227.699c1.264-1.051-0.139-3.949,1.047-6.549c-6.8-0.595-3.841,1.237-3.576,2.439c0.914,4.147-5.859,0.671-6.015,2.26C210.879,227.438,218.997,225.804,219.576,227.699z"/>
            <path id="map_69" vector-effect="non-scaling-stroke" fill="#EBECED" d="M181.564,238.348c-0.425-4.209-7.252-3.006-15.493-2.547c-5.606,3.537-2.244,3.608-4.358,4.67c4.167,4.445,4.358-1.133,4.96,4.103c2.829,0.708-0.351,1.421,0.142,1.84C175.374,243.937,161.721,245.068,181.564,238.348z"/>
            <path id="map_70" vector-effect="non-scaling-stroke" fill="#EBECED" d="M510.695,124.505c4.527,0.302,1.415-3.519,7.357-6.349c-1.91-1.557-1.273-0.779-2.429-1.981c-0.614,0.778-1.745,0.142-6.132,0.708c-4.386,0.565-4.456,3.466-7.711,0.849c-3.042,2.051-1.627,3.607-2.334,4.513c1.494,1.429,4.314,5.179,7.286,3.142C508.199,124.381,509.195,124.406,510.695,124.505z"/>
            <path id="map_71" vector-effect="non-scaling-stroke" fill="#EBECED" d="M405.147,64.002c7.324,1.035,22.602-3.501,15.067-7.746c-2.977-1.677-5.008-1.932-9.55,0c-10.229,4.351-3.078-3.714-11.566,0c-6.992,3.059,0.849,1.167,2.228,2.335c1.38,1.167-4.562,0.425-4.456,1.552c0.106,1.129,3.714-0.405,5.198,1.207C402.889,62.239,395.384,62.623,405.147,64.002z"/>
            <path id="map_72" vector-effect="non-scaling-stroke" fill="#EBECED" d="M746.622,205.771c4.139,1.805-1.697-10.138,5.73-12.097c3.796-1.001-0.742-1.805,2.441-3.926c-13.796-7.853-8.702,0.637-17.51,2.229c6.404,5.568-8.913,3.713-8.913,1.379c0-2.335-1.144-2.467-2.76-2.44c2.547,8.595,0.382,6.734-13.052,2.229c-5.644-1.893-17.71-2.856-11.427-10.416c-24.195-15.817,7.117-3.977-14.571-19.215c-1.804,6.71-7.504,0.898-8.808,3.266c-3.184,5.779,8.808,2.065,1.698,17.345c-6.36,13.671-7.534,2.441-10.824,8.701c-3.289,6.262,12.735,11.32-3.926,12.982c2.278,1.393,2.334,5.307,6.509,3.82c1.908-0.679,1.697,2.121-3.054,1.698c-0.693-0.062,5.532,6.961,7.084,6.348c6.58-2.599,1.417-5.925,4.459-5.781c1.702,0.079,1.529,4.193,1.132,7.639c-0.85,7.358,5.66,14.503,7.074,21.506c1.414,7.004,5.234,6.721,8.348,19.95c1.005,4.271,5.517,2.688,5.094,0.283c-0.259-1.47,6.648-4.6,4.951-9.197c-1.526-4.135,3.042-1.414-0.141-12.026c-1.976-6.584,6.438-5.164,6.508-8.771c0.048-2.41,4.882-2.688,6.508-6.933c1.627-4.245,7.287-2.901,6.509-8.207c-0.371-2.534,4.681-1.524,6.58-1.839c-1.771-5.659-6.34-17.531-3.68-17.531c6.853,0,0.771,5.436,7.64,4.55c9.869-1.273-2.229,7.004,3.715,6.579c3.623-0.26,3.257,4.496,2.582,8.384C746.729,212.351,742.483,203.968,746.622,205.771z"/>
            <path id="map_73" vector-effect="non-scaling-stroke" fill="#EBECED" d="M791.474,310.364c-0.425-8.064,4.669-3.112,1.557-9.479c-1.95-3.989-0.85,4.244-6.084-2.688c-4.813-6.375,2.688-1.698-4.669-8.489s-5.801-0.849-14.997-11.885c-4.624-5.547-4.104-2.264-8.206-4.527c-7.183-3.962,4.913,8.712,8.913,13.3c9.621,11.036,1.98,9.338,13.865,22.921C786.792,315.16,791.771,316.031,791.474,310.364z M818.003,325.573c0.841,0.428,0.753-3.742-0.426-3.891c-10.045-1.255,5.47-0.244-6.013-2.971c-8.861-2.104-1.327,0.76-8.489,0c-5.766-0.612,1.185-2.104-10.965-3.678c-1.076-0.141-1.927,2.999-0.849,3.535c12.344,6.155,5.412,0.725,13.652,3.963C814.004,326.104,812.467,322.763,818.003,325.573z M819.099,324.142c0.74,1.434,2.812,1.804,3.183,0.425C822.654,323.187,818.633,323.24,819.099,324.142z M824.298,326.369c1.326,0.425,2.012-2.4,1.273-2.493C823.873,323.664,822.971,325.945,824.298,326.369z M828.649,326.848c3.289-0.479-0.536-2.916-1.274-2.386C824.935,326.213,825.358,327.324,828.649,326.848z M832.733,323.861c-3.077-0.993-3.094,0.093-2.44,0.97C832.469,327.749,835.812,324.855,832.733,323.861z M836.396,330.933c1.113,1.326,4.615,0.105,0.529-2.494c-1.261-0.802-4.374-0.771-3.926,0.425C833.317,329.713,835.281,329.606,836.396,330.933z M841.383,325.673c0.053-1.335-5.041-2.805-5.307,0C835.977,326.727,841.329,327.007,841.383,325.673z M841.967,325.673c0.105,1.212,2.439,0.431,2.28-0.35C844.089,324.54,841.859,324.46,841.967,325.673z M852.177,329.324c-0.198-0.926-0.802-1.199-0.926-2.212c-1.433,0.047-5.061,4.009-4.032,4.669C849.447,333.214,851.063,330.313,852.177,329.324z M798.3,305.253c1.645,0.371,1.813-2.572,0.371-2.653C796.761,302.494,796.655,304.882,798.3,305.253z M826.773,299.47c6.367-2.899,0-9.479,5.518-8.772c5.519,0.707-5.941-5.377-2.122-12.592c-9.126-3.962-8.276,12.45-13.936,10.106c-5.659-2.345-6.792,7.296-12.31-2.254c-3.254,2.264,0.399,19.066,5.659,18.535c12.593-1.273,9.005,5.405,12.169,4.315C829.957,305.978,824.345,300.576,826.773,299.47z M847.643,296.004c-1.131-2.052-11.177,6.438-9.621-2.123c0.911-5.01,13.371,0.85,15.564-3.678c1.006-2.079,0.849-4.527-1.557-0.991c-2.406,3.537-11.502-5.008-15.068,5.307c-5.235,15.139-1.029,11.062-1.203,14.41c-0.424,8.228,3.891,5.255,2.972-0.862c-0.631-4.198,1.839-6.191,2.476-0.744s7.712,2.893,2.547-4.811C840.845,298.177,848.775,298.055,847.643,296.004z M861.438,306.331c-0.284-1.061-4.245-2.404-4.457-0.354C856.77,308.029,861.857,307.903,861.438,306.331z M864.551,299.54c0.197-0.352-2.052-1.485-3.089-0.495C860.426,300.036,863.836,300.812,864.551,299.54z M865.895,283.836c-0.85-0.495-2.334,1.627-1.332,2.122C865.566,286.453,867.319,284.666,865.895,283.836z M862.217,289.919c1.272-0.565,2.029-2.226,1.344-3.254C862.711,285.392,860.942,290.485,862.217,289.919z M863.818,293.103c-0.386-1.945,2.783-0.778,1.511-1.769s1.897-2.286,1.103-3.122c-1.021-1.071-2.022,0.717-3.517,3.264S864.563,296.853,863.818,293.103z M864.563,305.483c1.036,0.732,8.053,2.264,7.911,0.729S861.462,303.29,864.563,305.483z M884.075,301.733c-5.163-12.451-11.835-5.763-8.913-2.308c4.881,5.773,7.004,0.61,7.287,3.016s-9.48-0.849,0.777,5.377c4.431,2.688,9.958,1.625,12.522,6.226c4.456,7.993-3.821,5.729-2.052,10.186c0.709,1.79,6.089-2.796,10.965,2.9l0.99-24.335C882.803,293.387,889.241,314.184,884.075,301.733z M884.43,313.368c-2.264-0.109-2.688,4.637-1.273,5.322S885.278,313.409,884.43,313.368z"/>
            <path id="map_74" vector-effect="non-scaling-stroke" fill="#EBECED" d="M639.553,184.23c4.988-8.915,0-3.715-1.272-7.641c-3.38-10.422-0.213-6.579-0.85-13.689c-0.522-5.847-1.804-2.653-5.836-5.305c-13.457-8.854-10.718-1.062-17.477-1.168c0,3.596-10.078,3.608-10.255,1.062s-6.488-0.391-6.226-5.165c-4.881-2.405,0-6.932-6.685-1.826c-2.908,2.221-3.396-0.861-5.839-2.984c-0.104,1.593-4.029-0.318,1.381,9.573c3.337,6.099,5.837,3.055,4.14,8.467c-1.697,5.411,5.518,4.811,10.399,18.323c1.557-0.283,5.941-2.477,8.489,4.669c1.043,2.926,2.264,1.91,7.074,5.518c8.225,6.169,7.908-0.932,11.178-0.141c4.385,1.06-4.979,7.536,16.129,6.933C643.161,191.445,655.151,196.327,639.553,184.23z"/>
            <path id="map_75" vector-effect="non-scaling-stroke" fill="#EBECED" d="M590.635,165.554c1.697-5.412-0.803-2.368-4.14-8.467c-4.986,1.614-2.652-2.338-7.427,0c0.938,2.699-3.344,0.923-2.865,3.692c1.202,6.968-0.746,7.166-6.704,10.61c0.47,0.985,1.286,2.593,1.894,4.492c5.292-0.614,10.683,6.579,17.969,10.399c2.263,0.354,4.809,0.675,6.014,0.707c0.593-1.397,0.989-5.163,5.659-3.111C596.152,170.364,588.938,170.965,590.635,165.554z"/>
            <path id="map_76" vector-effect="non-scaling-stroke" fill="#EBECED" d="M434.116,95.89c-1.221,1.009-4.67-0.796,1.272-3.449c-1.167-1.061-5.917,0.435-4.722,2.069c1.592,2.176-5.518,0.054-3.82,2.281c0.956,1.256-2.546,1.062,1.114,3.078c1.644,0.904-5.465,1.538-2.812,4.935c1.921,2.459,7.958-2.706,10.239-1.751c0.492,0.206,2.813-2.76,1.009-6.314C435.371,97.226,435.336,94.882,434.116,95.89z"/>
            <path id="map_77" vector-effect="non-scaling-stroke" fill="#EBECED" d="M559.688,174.54c0.124-0.603,0.257-2.021,0.315-2.718c-0.491,0.221-1.039,0.311-1.629,0.209c-0.156,0.563-1.574,6.223-2.334,6.752c0.566,0.99,2.476,5.942,2.76,6.508l0.672-8.131C558.375,177.078,557.923,173.399,559.688,174.54z"/>
            <path id="map_78" vector-effect="non-scaling-stroke" fill="#EBECED" d="M491.524,123.037c-6.014,0.071-0.779-2.9-8.772-1.132c-2.556,0.566-0.634,4.103-5.519,2.688c-2.038-0.591-1.204,1.55-4.669,0.495c-3.112,3.325,1.698,0.282,0,3.75c-1.697,3.466,2.897,1.909,1.273,4.244c6.721-5.164,7.594,0.411,8.241,1.167c9.375,10.93,7.393,5.624,12.84,10.187c1.986,1.663,0.53,2.441,2.122,2.441c1.593,0,2.82,3.873,2.229,4.668c-1.945,2.618,0.046,4.43,1.062,1.381c1.097-3.29,3.571-2.441,1.273-4.032c-2.018-1.397,0.892-5.064,2.44-3.078c2.264,2.9,3.27,0.03,0.954-0.955c-11.211-4.775-1.449-3.501-7.852-5.306c-6.402-1.804-3.572-4.987-7.109-6.473c-3.537-1.486-3.578-6.791,1.273-7.109C490.18,124.311,492.373,124.735,491.524,123.037z M488.234,154.199c-1.273,0.55,7.959,5.836,8.807,4.139c0.85-1.698-1.592-2.38,0.531-5.093C491.205,155.366,492.51,152.354,488.234,154.199z M476.243,143.588c-1.485-0.53-0.88,7.322,2.044,6.367c3.798-1.241,1.532-1.38,1.532-6.367C479.819,140.701,477.729,144.118,476.243,143.588z"/>
            <path id="map_79" vector-effect="non-scaling-stroke" fill="#EBECED" d="M200.629,228.02c7.287,0.601,3.709-1.683,1.733-2.087C196.837,224.801,199.497,227.101,200.629,228.02z"/>
            <path id="map_80" vector-effect="non-scaling-stroke" fill="#EBECED" d="M875.658,131.951c-2.746,3.809-19.101-13.441-9.764,0.99c3.039,4.696-5.871-0.142,0,6.508c2.807,3.18,3.633,0.907,1.415-0.212c-2.685-1.354,1.133-0.495,0.847-1.543c-0.655-2.408,8.067,4.09,6.653,0.27c-1.004-2.706,7.71-2.759,2.899-3.678C875.229,133.812,877.851,128.909,875.658,131.951z M877.851,164.422c-0.071,3.678,3.467-1.274,0-4.527c-1.139-1.069,1.909-8.489-3.749-14.573c-5.659-6.084-6.651-0.991-4.669,1.202c1.979,2.193,3.285,9.454-1.557,11.461c-7.853,3.254,1.272,5.094-8.349,5.022c-2.335-0.018-11.035,6.226-5.093,5.942s-0.708-1.132,6.438-2.335c6.137-1.032,2.354,1.302,4.881,2.972c5.352,3.537,2.477-5.942,4.316-3.396C871.908,168.737,877.922,160.743,877.851,164.422z M858.255,172.132c1.485,2.478,6.461-2.789,4.881-3.961C860.942,166.544,856.77,169.656,858.255,172.132z M855.851,179.632c0.705,0.086,1.774-5.505,0.989-6.845c-2.972-5.066-6.367-2.494-7.428-1.221C853.303,173.123,852.395,179.206,855.851,179.632z"/>
            <path id="map_81" vector-effect="non-scaling-stroke" fill="#EBECED" d="M565.521,183.877c7.216,0-5.093-6.722,5.872-7.995c-0.607-1.899-1.424-3.507-1.894-4.492c-1.218,0.704-5.616,6.066-9.495,0.432c-0.059,0.697-0.191,2.116-0.315,2.718l-0.216,2.62l-0.672,8.131l3.748,1.273C562.549,186.564,564.369,183.877,565.521,183.877z"/>
            <path id="map_82" vector-effect="non-scaling-stroke" fill="#EBECED" d="M599.389,121.17c3.4-0.599,6.881,0.377,6.313,3.849c-0.462,2.831,6.686,3.82-2.546,2.547c-3.272-0.452-7.522,1.271-1.697,4.804c8.701,5.275,3.713,5.701,5.517,8.07c6.579-6.144,4.669,0.921,10.4,1.238l-2.442-12.839l6.262-2.123c0,0,9.02,3.502,12.521,7.481c6.048-1.008,10.081-2.362,13.052,3.727c2.972,6.089,4.881,1.737,6.897,5.239s6.393-3.349,6.897-4.534c1.91-4.485,7.028,0.787,7.641-2.045c0.849-3.926,14.007-0.318,20.691,2.441c1.168,0.105-6.48-10.273-4.562-10.399c11.247-0.743,4.991-8.506,6.366-8.064c13.901,4.457,1.092-1.383,10.188-6.579c-13.689-3.679-22.745-10.47-23.452-6.049c-0.068,0.425-15.563-10.081-14.219-12.521c0.837-1.52-3.184,3.431-11.142,1.061c-7.959-2.369-1.945-4.067-9.232-4.563c-5.105-0.347-7.923,5.095-21.966,4.669c-3.857-0.117,5.694,3.254-0.743,6.579c-2.912,1.504,6.948,1.973,4.563,4.563c-3.289,3.573-10.578-3.997-14.749,0.53c-2.061,2.237-9.692-7.074-18.146-1.379c-4.161,2.803-0.106,4.067-2.123,4.456c-2.016,0.389-4.342-6.498-4.563,4.245c-0.092,4.492,4.458,0.585,9.126,8.171C595.336,122.453,597.348,121.528,599.389,121.17z"/>
            <path id="map_83" vector-effect="non-scaling-stroke" fill="#EBECED" d="M584.338,278.53c-10.187-0.283-6.648,5.518-12.45,1.132c-4.885-3.693-6.353,0.057-7.075-2.83c-2.899-0.247-3.42-0.859-6.543,1.84c7.216,7.321-1.02,11.703,0.955,18.888c21.075,11.535,4.387,5.554,16.625,13.229c6.553-10.335-0.495-2.937,7.64-11.179C580.145,283.638,581.167,284.333,584.338,278.53z"/>
            <path id="map_84" vector-effect="non-scaling-stroke" fill="#EBECED" d="M510.695,137.726c0,0.335,1.414,1.135,1.839,1.83c0.219-0.273,1.477-0.331,2.762-0.435C514.342,130.909,511.959,137.75,510.695,137.726z"/>
            <path id="map_85" vector-effect="non-scaling-stroke" fill="#EBECED" d="M595.375,186.988c5.167,0.141,1.202,2.762,5.942,1.558c-0.983-1.133-1.839-4.386-0.283-4.669C596.364,181.825,595.968,185.591,595.375,186.988z"/>
            <path id="map_86" vector-effect="non-scaling-stroke" fill="#EBECED" d="M668.204,136.584c-0.612,2.832-5.73-2.44-7.641,2.045c2.972,0.396-2.848,2.994,1.168,3.367c9.125,0.849,6.153,4.351,1.061,4.351s-8.857,3.502,8.994,2.548c0-2.354,4.271-6.155,7.666-4.67c2.566,1.123,6.258-5.489,9.443-5.199C682.211,136.266,669.053,132.658,668.204,136.584z"/>
            <path id="map_87" vector-effect="non-scaling-stroke" fill="#EBECED" d="M772.515,225.615c-2.866,9.708,17.296-10.612,14.29,15.42c6.562,3.573-1.291-0.936,7.357-0.564c0.187-1.593,0.58-5.913-7.746-12.946c-10.931-9.232,1.009-2.601-3.609-9.02c-4.351-6.049-1.909,3.193-9.231-7.321c-1.279-1.838,0.864,7.441-2.76,3.819c-4.372,2.406,1.136,1.277-2.688,3.679C769.402,221.795,773.953,220.743,772.515,225.615z"/>
            <path id="map_88" vector-effect="non-scaling-stroke" fill="#EBECED" d="M525.834,90.708c1.769-1.84,2.052,0.778,4.087-1.557c-0.752-0.732-3.335-4.358-2.849-4.775c-2.512,1.238-3.785-3.218-8.241-1.096c1.562,7.304-8.896-5.748-7.896,6.225C513.029,88.373,517.203,87.029,525.834,90.708z"/>
            <path id="map_89" vector-effect="non-scaling-stroke" fill="#EBECED" d="M560.004,171.822c2.681-1.208,3.648-6.337,0.388-5.631c-0.329,1.247-1.86,5.278-2.017,5.841C558.965,172.133,559.513,172.043,560.004,171.822z"/>
            <path id="map_90" vector-effect="non-scaling-stroke" fill="#EBECED" d="M539.381,398.713c-7.905,3.582-3.926,6.526-2.229,7.562C539.726,405.372,543.865,401.26,539.381,398.713z"/>
            <path id="map_91" vector-effect="non-scaling-stroke" fill="#EBECED" d="M420.85,265.938c-2.784,2.635-3.747-6.508-5.87-2.971c-1.271,2.118-1.131,2.122-3.465,5.447c6.685,6.968,10.398,8.701,12.733,9.409C425.667,268.414,420.5,273.584,420.85,265.938z"/>
            <path id="map_92" vector-effect="non-scaling-stroke" fill="#EBECED" d="M479.214,182.319c3.393,15.804-1.797,11.489,1.274,17.686c3.961,7.995,5.012,0.991,5.972,7.217c9.308,0,5.288,4.524,10.157,1.979c2.299-1.202,2.103-1.855,3.244-1.229S525,221.936,525,221.936V221h3c0,0,0-3.77,0-7.978c0-0.012,0,0.978,0-0.022h0.027h0.105c0-8-0.181-22.988,0-26.712c0.18-3.719-3.578-3.283-0.105-8.846c-0.955-2.175-4.104-0.073-6.438-2.831c-3.066-3.624-12.08,0.07-9.764,3.325c1.886,2.647-2.741,6.454-4.668,3.182c-1.627-2.761-8.821-1.233-9.408-4.528c-0.709-3.962-8.084-2.494-12.098-4.881C476.95,180.622,488.114,177.015,479.214,182.319z"/>
            <path id="map_93" vector-effect="non-scaling-stroke" fill="#EBECED" d="M479.819,119.358c-0.531,2.422,0.368,2.829,2.933,2.547C482.316,121.373,481.375,120.5,479.819,119.358z"/>
            <path id="map_94" vector-effect="non-scaling-stroke" fill="#EBECED" d="M515.294,95.306c2.548-0.071,1.786,2.127,2.971,1.699c9.975-3.609,6.49-5.174,7.569-6.297c-8.631-3.679-12.805-2.335-14.898-1.203c0.18,2.161-0.806,1.274-0.028,2.688C513.949,93.649,516.567,92.406,515.294,95.306z"/>
            <path id="map_95" vector-effect="non-scaling-stroke" fill="#EBECED" d="M469.149,110.649c-0.163,0.422,0.083,0.842,1.364,1.423C470.513,112.072,471.125,110.313,469.149,110.649z"/>
            <path id="map_96" vector-effect="non-scaling-stroke" fill="#EBECED" d="M518.158,138.494c-0.419,0.394-1.653,0.53-2.862,0.627c-1.285,0.104-2.543,0.161-2.762,0.435c-0.424,0.53-0.424,4.669,1.38,4.244c1.804-0.424,2.947-0.211,5.11-1.385C519.573,140.605,519.22,139.131,518.158,138.494z"/>
            <path id="map_97" vector-effect="non-scaling-stroke" fill="#EBECED" d="M606.233,339.793c0.036,5.447-3.397,0.918-3.154,6.284c0.219,4.822-15.062,5.955-13.284,14.274c2.547,11.926-5.952,12.408-3.079,17.504c2.318,4.114-1.953,5.799,4.556,9.477c1.956,1.105,3.215-1.411,5.809-1.195c2.468,0.205,8.604-22.389,10.214-26.5c0.731-1.866-0.813-2.299,0.736-4.195c2.31-2.829-0.489-4.012,0.432-4.931c1.002-1.003,1.415,3.219,2.297,0.612c0.882-2.605-0.245-1.567-1.023-7.19C608.763,336.912,606.228,338.983,606.233,339.793z"/>
            <path id="map_98" vector-effect="non-scaling-stroke" fill="#EBECED" d="M555.759,344.992c2.829,5.73,3.572,0.425,4.208,2.76c0.637,2.335-0.424,11.46,3.29,4.881s-7.816-7.534-1.839-16.659c-1.98,0,0.425-6.791-5.659-7.499C560.226,338.202,552.929,339.263,555.759,344.992z"/>
            <path id="map_99" vector-effect="non-scaling-stroke" fill="#EBECED" d="M772.515,269.333c1.72,5.251-0.765,10.292,12.763,19.121c0.66-1.079,1.129-1.452,2.113-1.547c-6.953-7.845,0.546-8.023-7.943-16.584C776.145,274.646,776,269.938,772.515,269.333z M816.233,288.212c5.659,2.344,4.81-14.068,13.936-10.106c1.472-2.777,9.126-1.062-0.99-10.399c-2.127-1.964-4.944,3.692-7.655,7.436c1.836,3.892-1.836,4.358-3.757,2.84c-10.267,12.288-10.589,5.712-13.843,7.977C809.441,295.508,810.574,285.867,816.233,288.212z"/>
            <path id="map_100" vector-effect="non-scaling-stroke" fill="#EBECED" d="M686.25,274.438c1.875-1.75-0.98-8.058-1.25-6.938C683.375,274.25,684.375,276.188,686.25,274.438z M686.884,283.25c0.759,0.125,1.179-7.188,0-7.375S686.125,283.125,686.884,283.25z M684.184,277.813c-1.066,1.313,0.941,6.063,1.35,5.938S684.7,277.177,684.184,277.813z M686.625,284.563c-0.688,0.438,0.113,3,0.994,2.313S687.313,284.125,686.625,284.563z"/>
            <path id="map_101" vector-effect="non-scaling-stroke" fill="#EBECED" d="M437.991,245.154c2.184,0.278,2.259-6.523,11.512-6.523c17.595,0,13.157-11.602,12.875-14.997c-6.618,1.429,1.557-2.971-5.659-4.244c-4.867-0.859-3.962-3.645-3.962-3.645L434.292,201.7c-1.708,0.033-3.125,0.122-5.375,0.16l2.652,35.14h-16.66c0,0-2.9-3.977-4.456,2.744c-1.088,4.697,0.556,4.963,1.556,8.852c1.273,4.952,12.431-5.823,10.85,7.61c7.595-2.688,3.44,1.683,8.109-1.288C433.626,253.226,432.875,244.502,437.991,245.154z"/>
            <path id="map_102" vector-effect="non-scaling-stroke" fill="#EBECED" d="M494,162.188c1.25,1.063,1.563-0.5,0.688-1S492.75,161.125,494,162.188z"/>
            <path id="map_103" vector-effect="non-scaling-stroke" fill="#EBECED" d="M410.453,239.744c1.556-6.721,4.456-2.744,4.456-2.744h16.66l-2.652-35.14c2.25-0.038,3.657-0.066,5.365-0.099L422,192.365V199h-11v8.222l-4,2.476V216h-11.653c3.826,4,0.932,6.203,1.382,7.125c3.219,6.597-0.602,7.229-0.849,12.023C404.781,227.719,404.781,238.611,410.453,239.744z"/>
            <path id="map_104" vector-effect="non-scaling-stroke" fill="#EBECED" d="M633.25,367.083c-1.167-0.834-2.75,1.084-1.75,2.25S634.417,367.917,633.25,367.083z"/>
            <path id="map_105" vector-effect="non-scaling-stroke" fill="#EBECED" d="M158.75,232.937c-1.729-1.728-1.698-6.047,5.305-4.982c1.858,0.281,1.486-3.825,4.352-0.642c0.473-1.488,2.706-8.561,3.926-9.763c2.583-2.547,0.071-3.785-0.849-2.865s-2.867-0.958-4.032,0.105c-1.627,1.485-5.775-0.881-6.474,4.67c-0.849,6.755-7.154,5.292-11.142,6.792c-4.987,1.874-2.192-1.345-5.519-1.063c-3.325,0.283-1.167-2.334-3.819-6.897c-5.345-9.192,3.214-18.362,3.077-20.056c-10.718,0.318-2.865-8.913-9.657-13.901c-3.559-2.612-4.244,4.245-8.17,2.017c-3.927-2.229,0.446-3.806-4.882-8.11c-2.758-2.228-6.26,1.758-6.26,1.758h-8.49l-9.762-5.605l-7.638,0.209c0.428,14.646,2.899,9.144,3.817,14.23c0.644,3.563-3.127,1.94-2.688,3.604c0.99,3.75,4.808,1.831,6.083,5.199c1.77,4.669-3.867,3.649,1.133,6.489c4.414,2.509,2.541,6.276,4.811,4.943c3.253-1.909-0.317-4.529-1.405-4.674c-1.53-0.204,0.486-0.639-2.697-10.331c-3.185-9.691-5.638-10.538-4.245-12.875c1.768-2.972-0.566-6.015,3.537-3.539c4.103,2.477-0.172,6.076,2.405,9.338c12.237,15.493,2.67,8.631,7.216,13.301c18.181,18.676,1.999,15.298,6.79,20.939c8.772,10.328,6.687,4.203,12.946,8.914c21.718,16.34,13.512-7.43,26.104,10.044C155.035,230.495,162.569,236.757,158.75,232.937z"/>
            <path id="map_106" vector-effect="non-scaling-stroke" fill="#EBECED" d="M533.687,126.928c5.285-1.941-0.99-3.891,4.032-3.395c3.937,0.388-3.273-9.204-9.125-6.65C537.152,124.028,531.211,124.807,533.687,126.928z"/>
            <path id="map_107" vector-effect="non-scaling-stroke" fill="#EBECED" d="M714.575,123.745c-0.424,7.922,9.561,0.308,17.51,9.55c6.119,7.115,15.104,1.203,24.3,6.261s3.89-1.368,15.812-1.485c14.804-0.146,2.794-5.767,4.669-9.231c1.101-2.037,6.193,2.477,6.685-0.106c0.707-3.715,4.31,0.827,4.882-4.222c0.495-4.374,8.488-0.624,9.02-1.721c0.53-1.097-5.058-5.413-9.02-4.457c-9.938,2.396-5.154-6.133-6.791-6.897c-11.641-5.436-11.819,7.971-24.407,0.318c-9.833-5.978-13.653,2.299-18.889-5.625c-0.53-0.802-10.934-3.236-11.248-2.758c-2.971,4.526,3.613,6.114,1.911,7.216c-7.004,4.526-8.561-7.782-28.12,3.396C706.546,115.503,714.712,121.203,714.575,123.745z"/>
            <path id="map_108" vector-effect="non-scaling-stroke" fill="#EBECED" d="M510.695,137.726c0-1.434,1.389-4.208-2.706-3.608c-0.981,1.42-1.636,2.008-1.928,3.739c1.167,0.637,2.383,1.592,2.759,2.122C508.917,138.583,509.432,137.702,510.695,137.726z"/>
            <path id="map_109" vector-effect="non-scaling-stroke" fill="#EBECED" d="M422,188.263c0,0,7.786-3.879,10.453-4.669c11.946-3.538-0.782-8.206,11.527-7.924c4.968,0.114,1.417-8.206-0.282-10.895c-1.36,0.702-1.147-1.185-2.191-1.272c-1.043-0.089-5.854,3.059-7.003-1.557c-0.104-0.418-1.982-0.04-2.264,1.132c-1.998,8.312-15.35,9.62-12.239,18.677c1.829,5.316-10.533,8.208-11.54,10.328L422,192.365V188.263z"/>
            <path id="map_110" vector-effect="non-scaling-stroke" fill="#EBECED" d="M561.418,335.974c-5.978,9.125,5.553,10.08,1.839,16.659s-2.653-2.546-3.29-4.881c-0.636-2.335-1.379,2.971-4.208-2.76c-7.146,2.441-10.859,3.29-9.268,6.367c0.828,1.603,16.235,4.563,1.911,24.406c2.015,4.775,2.878,13.255,1.484,12.841c0.583,0.503,0.877,2.313,0.771,3.702c0.418-0.468,1.696,0,2.271-0.307c0.743-3.697-4.793-2.494,7.499-8.276c2.915-1.372,1.238-12.947-0.284-14.362c-1.521-1.413,7.729-12.485,12.311-12.874c2.134-0.182,9.479-7.569,7.074-10.4c-0.939-1.105,0.565-13.441-0.213-14.219C572.028,338.096,563.398,335.974,561.418,335.974z"/>
            <path id="map_111" vector-effect="non-scaling-stroke" fill="#EBECED" d="M759.074,229.718c-0.087-0.796,9.125,15.918,7.78,26.883c2.264-7.924,5.203-4.626-0.411-15.565c-3.267-6.365,1.544-6.365-4.682-13.015s2.546-6.937,6.366-9.339c3.823-2.401-1.685-1.272,2.688-3.679c-3.183-3.184-0.105,1.485-4.881-1.698c-4.774-3.184,0.956-1.909-2.335-5.729c-3.288-3.821-2.228,1.592-5.518-3.714c-3.288-5.307,11.023-5.966-3.288-14.113c-3.184,2.121,1.354,2.925-2.441,3.926c-7.428,1.959-1.592,13.901-5.73,12.097c-4.139-1.803,0.106,6.58-4.103,10.507c4.229,6.236,9.055,2.899,8.488,15.422c-0.157,3.514,3.608,5.234,5.235,2.263C756.852,232.853,759.427,232.972,759.074,229.718z"/>
            <path id="map_112" vector-effect="non-scaling-stroke" fill="#EBECED" d="M512.429,384.574c-0.312-9.865,0-10.932,3.396-10.294c-0.106-13.265-0.213-12.84,3.82-14.037c4.032-1.196,5.518,1.41,10.08-1.35c-1.06-2.849-5.73-0.53-5.73-0.53c-21.011,4.88-9.443-1.379-24.087-0.53c-9.964,0.577-10.081-4.033-13.447-0.707c-0.204,2.628,1.405,4.848,8.106,17.755c2.908,5.605-1.238,16.855,6.861,24.195C502.983,392.32,513.277,411.527,512.429,384.574z"/>
            <path id="map_113" vector-effect="non-scaling-stroke" fill="#EBECED" d="M701.133,182.728c-6.283,7.56,5.783,8.523,11.427,10.416c13.434,4.506,15.599,6.366,13.052-2.229c-5.11,0.085-11.65-2.235-13.685-3.887C701.834,178.833,704.641,185.021,701.133,182.728z"/>
            <path id="map_114" vector-effect="non-scaling-stroke" fill="#EBECED" d="M469.947,106.696c-2.334-3.325,6.225-3.325,2.617-7.854c-1.557-0.282-3.378-1.732-9.762,6.721C465.738,107.243,465.686,104.379,469.947,106.696z"/>
            <path id="map_115" vector-effect="non-scaling-stroke" fill="#EBECED" d="M964.227,442.794c-19.949,16.13-13.615,6.651-30.278,18.536c-2.125,1.516,4.392,3.608,7.5,2.122c16.27-7.782,1.979-3.962,25.75-16.837C967.967,446.199,966.186,441.211,964.227,442.794z M986.724,432.184c-8.299,1.186-0.708-7.923-6.466-12.31c-0.892,2.689,1.722,12.221-4.005,15.531c-8.872,5.126,1.362,0.761-3.254,7.079c-7.357,10.073,3.396,0.109,8.772-3.54C987.148,435.297,995.243,430.968,986.724,432.184z"/>
            <path id="map_116" vector-effect="non-scaling-stroke" fill="#EBECED" d="M179.229,254.053c-0.99-11.885,2.872-10.374,2.335-15.705c-19.844,6.721-6.19,5.589-14.75,8.065c6.084,5.164,0.495,1.98,5.093,6.507C177.072,255.255,173.252,251.789,179.229,254.053z"/>
            <path id="map_117" vector-effect="non-scaling-stroke" fill="#EBECED" d="M498.138,232.214c1.095-0.899,0.177-9.995,1.31-12.684c1.132-2.688-2.689-3.82-2.83-10.329c-4.87,2.545-0.85-1.979-10.157-1.979c-30.389,19.383-11.632,13.724-24.082,16.412c0.282,3.396,4.651,13.44-12.875,14.997c1.272,2.688,5.093,11.602,7.073,10.046c1.98-1.557,0.708,0.849,3.679,1.697c-0.99-13.017,8.489-1.98,12.31-4.951c3.82-2.972,3.679,3.254,7.924,0c4.245-3.255,5.972,3.254,12.309-2.406C491.24,240.329,497.041,233.112,498.138,232.214z"/>
            <path id="map_118" vector-effect="non-scaling-stroke" fill="#EBECED" d="M491.382,256.741c1.408-4.271,4.279-4.267,4.713-6.083c0.946-3.962-1.034,0.141-1.741-4.953c-0.276-1.981,0,0-1.557-2.688c-6.337,5.66-8.063-0.849-12.309,2.406c-4.245,3.254-4.104-2.972-7.924,0c-3.82,2.971-13.3-8.065-12.31,4.951c0.927,12.18-3.962,1.557-2.546,19.879c5.43-1.291,7.445,1.309,8.701,5.518c1.256,4.21,9.6,0.263,10.116,1.062C485.723,253.487,482.468,283.765,491.382,256.741z"/>
            <path id="map_119" vector-effect="non-scaling-stroke" fill="#EBECED" d="M830.135,141.074c-4.563-2.262-2.264,4.425-7.393,6.017c8.916,2.038-1.769,4.739,11.036,8.983c0-4.74,2.617-1.325,3.82-3.891c-2.595-2.277-7.994-2.335-2.689-6.084c5.306-3.749-1.271-1.697,2.123-8.206C828.861,135.099,834.697,143.336,830.135,141.074z"/>
            <path id="map_120" vector-effect="non-scaling-stroke" fill="#EBECED" d="M489.26,62.481c6.084-1.132,1.131-9.409,6.933-10.328c5.801-0.92,7.55-7.319,10.259-5.235c1.331-3.582,9.337,3.627,10.752,1.344c1.415-2.282,2.313-7.406,9.466-1.759c0.707-0.849,0.022-0.972,3.622-1.99c-7.04-1.097,7.816-1.414-8.064-4.103c-3.098-0.525-1.98,1.839-3.678,1.98c-1.698,0.142,5.128-3.591-8.207-1.062c-5.476,1.039-1.272,2.193-2.688,2.618c-1.415,0.425-1.856-1.539-9.054,0.92c-3.254,1.111,1.362,1.628-0.708,2.899c-2.07,1.273,0.211-4.935-9.339,1.557c-2.559,1.739,6.409-0.288,5.235,1.062c-13.142,15.104-23.044,18.5-25.043,18.605s-0.249,10.981,2.264,12.592c5.739,3.68,7.871-1.816,9.762-1.98c3.255-0.283,0.831-3.078,3.255-0.283C491.948,73.021,483.175,63.613,489.26,62.481z M515.646,15.154c-16.483-2.405-4.951,0.283-18.393,0C499.234,16.71,511.826,19.187,515.646,15.154z M484.873,19.116c2.567,1.744,5.235-0.283,7.004,0.447c1.769,0.729-7.431,0.472-1.557,3.515c7.336,3.798,7.379-2.557,9.339-3.255c6.155-2.192,3.112,5.095,12.31,1.471c-7.146-2.49-11.178-3.521-16.201-5.549c-5.022-2.026-2.404,1.673-4.527,0.542C489.118,15.154,479.003,15.127,484.873,19.116z"/>
            <path id="map_121" vector-effect="non-scaling-stroke" fill="#EBECED" d="M624.379,210.121c0,0,2.228,0.531,0,9.976c-3.077,1.485-6.791,2.971-9.338,3.82l4.244,8.632c8.991-2.583,4.458-4.883,9.056-4.812c3.612,0.056,0.495-3.041,4.103-3.396c3.608-0.354-3.467-2.406,6.792-11.885c0.894-0.826-1.84-0.637-3.679-5.377c-0.553-1.424-5.447,1.202-7.781-5.093C626.396,205.311,625.546,197.282,624.379,210.121z"/>
            <path id="map_122" vector-effect="non-scaling-stroke" fill="#EBECED" d="M668.628,192.824c3.29-6.26,4.464,4.97,10.824-8.701c7.109-15.279-4.882-11.565-1.698-17.345c1.304-2.367,7.004,3.444,8.808-3.266c-9.406-6.608,0.425-2.099-9.443-6.554c-2.13,2.904-10.778,3.197-9.339,4.455c4.007,3.503-0.477,4.363,0.425,5.837c2.334,3.82-4.882,2.335-4.352,7.429c0.531,5.094-9.125,2.229-7.853,7.004c1.423,5.331-11.777,3.607-16.447,2.547c15.599,12.097,3.608,7.215,4.352,16.625c22.283-0.638,14.431,1.06,20.798,4.951C681.363,204.145,665.339,199.086,668.628,192.824z"/>
            <path id="map_123" vector-effect="non-scaling-stroke" fill="#EBECED" d="M559.473,177.16l0.216-2.62C557.923,173.399,558.375,177.078,559.473,177.16z"/>
            <path id="map_124" vector-effect="non-scaling-stroke" fill="#EBECED" d="M198.508,261.835c-6.544-7.251-9.091,0-13.238-0.673c-2.646-0.429-1.088-1.521-3.6-2.652l-1.132,4.457c6.65,1.202,4.74,4.952,7.924,3.962c3.183-0.991-2.052-2.477,1.697-4.245c2.024-0.954,1.557-2.547,3.82-0.99c2.264,1.556-0.708,3.254,2.83,5.66C197.233,265.797,199.852,264.877,198.508,261.835z"/>
            <path id="map_125" vector-effect="non-scaling-stroke" fill="#EBECED" d="M926.945,323.381c-6.932-6.579,8.277-4.598-3.395-8.843c-5.08-1.847,4.951-2.335-17.898-11.743l-0.99,24.335c0.993,1.161,5.253,0.661,7.711-2.405c6.014-7.498,11.632,4.655,12.733,5.094C941.307,336.257,932.13,328.301,926.945,323.381z M940.953,308.666c-1.98-1.203-0.546,5.851-11.602,5.518C935.809,321.4,946.146,311.819,940.953,308.666z M953.191,318.569c1.557-1.271-3.537-7.215-3.82-5.897C949.088,313.988,951.967,319.572,953.191,318.569z M944.49,310.506c1.062-1.697-1.062-4.6-1.415-3.184C942.722,308.737,943.987,311.311,944.49,310.506z"/>
            <path id="map_126" vector-effect="non-scaling-stroke" fill="#EBECED" d="M250.15,375.024c12.593,14.856,24.045,6.214,15.563,18.535c-0.45,0.653,12.733,4.951,12.025-6.084c-0.688-10.731-3.678-2.688-3.961-8.064c-0.416-7.888-9.763,1.697-9.196-12.593C250.433,362.715,250.857,365.828,250.15,375.024z"/>
            <path id="map_127" vector-effect="non-scaling-stroke" fill="#EBECED" d="M226.805,358.047c-1.359-1.99,2.548-2.547-0.142-7.075c-2.688-4.527,4.387-8.064-2.264-17.12c-5.636-0.593-3.112-3.395-3.178-5.093c-0.064-1.698-3.783,5.356-8.421-1.698c-6.795-10.328-0.287-7.815-0.569-11.035c-0.707-8.065,8.772-5.943,9.478-6.792c-5.658-3.185,7.182-7.96-8.908-6.155c-3.813,0.427,1.871-3.184-8.21-9.338c3.714,11.884-9.975,6.154-11.602,17.826c-0.339,2.43-4.951-3.076-4.669-5.518c-3.25,2.68-3.54,4.672-2.547,6.438c1.909,3.396-0.637,1.132,0,2.971c0.637,1.84,2.405-3.325,17.189,25.964c1.734,3.435-5.163,3.253,21.011,19.595C228.217,359.74,223.974,359.531,226.805,358.047z"/>
            <path id="map_128" vector-effect="non-scaling-stroke" fill="#EBECED" d="M838.836,226.357c-2.979-3.687-5.014,0.472-4.125,3.183c2.573,7.853-4.152,2.548-0.97,6.367c1.683,2.019,3.184,8.808,5.752,7.003c2.567-1.803-0.657-2.546-0.657-6.472C838.836,233.727,845.096,234.105,838.836,226.357z M836.184,243.865c1.378,1.698,2.015,3.715,4.031,4.67C840.108,244.927,839.047,244.184,836.184,243.865z M827.693,262.86c0.744,0.636,8.276-8.33,6.792-8.701C833.636,253.947,826.951,262.224,827.693,262.86z M852.948,252.886c1.911,0.106-1.232-5.919-2.334-5.518c-1.167,0.424-0.318,8.064,1.473,8.808C853.877,256.918,851.039,252.779,852.948,252.886z M842.338,250.444c-0.366-0.065-0.743,3.185,0,4.67C843.929,253.947,848.563,251.577,842.338,250.444z M846.829,260.065c0.778-0.565,0.744-6.893-0.318-6.72C843.681,253.806,846.051,260.632,846.829,260.065z M849.129,258.192c1.132,0.813,2.192-1.346,1.415-1.771C849.765,255.998,847.996,257.377,849.129,258.192z M843.363,266.713c-0.828,3.047,4.208-3.499,6.049-1.164c1.839,2.335-1.345,2.335,2.652,6.296c3.996,3.962,2.547-2.476,2.972-4.031c0.424-1.557,5.411,4.385,1.485-7.5c-1.89-5.72-2.834,0.467-5.271,2.016C848.139,264.311,845.159,260.1,843.363,266.713z M841.91,241.625c-1.09,1.188,5.777,7.5,6.34,5.724S843.776,239.591,841.91,241.625z"/>
            <path id="map_129" vector-effect="non-scaling-stroke" fill="#EBECED" d="M495.131,107.119c0.708,3.804,13.467,4.003,10.896,5.235c5.306,2.194,5.517-1.485,10.61,1.769c0.284-5.8,7.043-3.479,1.938-9.267c-3.493-3.962,3.51-0.565-0.31-7.852c-1.185,0.428-0.423-1.771-2.971-1.699c-2.547,0.071-5.306,0.708-8.064-0.424c-2.23,3.588-0.001-4.828-15.14,2.264C494.07,108.04,493.572,98.738,495.131,107.119z"/>
            <path id="map_130" vector-effect="non-scaling-stroke" fill="#EBECED" d="M432.419,141.042c-0.425-1.168-4.352-2.653-7.11-1.31c2.592,6.354-4.74,10.187-1.698,12.734c1.384,1.157-0.282,5.659,0,5.234c0.283-0.425,2.477,0.327,4.669-0.614C430.189,141.89,432.843,142.209,432.419,141.042z"/>
            <path id="map_131" vector-effect="non-scaling-stroke" fill="#EBECED" d="M238.547,227.737c1.381-1.415,1.77-1.911-4.032-1.911C233.772,228.904,235.54,227.737,238.547,227.737z"/>
            <path id="map_132" vector-effect="non-scaling-stroke" fill="#EBECED" d="M611.787,204.251c-0.991-0.566,2.331-2.973-0.425-5.943c-1.503-1.62-1.839,2.405-2.688,2.405C609.523,201.845,609.559,203.692,611.787,204.251z"/>
            <path id="map_133" vector-effect="non-scaling-stroke" fill="#EBECED" d="M533.687,126.928c-2.476-2.121,3.466-2.899-5.093-10.045c-7.782,3.396-8.13,0.125-10.541,1.273c-5.942,2.83-2.83,6.65-7.357,6.349c7.993,5.183,1.072,4.677,7.463,7.117c14.113,5.388,4.881-2.89,17.191,1.567c-0.531-4.457,3.023-2.282,2.864-5.359C535.738,126.186,536.162,129.051,533.687,126.928z"/>
            <path id="map_134" vector-effect="non-scaling-stroke" fill="#EBECED" d="M515.294,95.306c1.273-2.899-1.345-1.656-4.387-3.112c0.777,1.414-2.459,0.726-3.678,2.688C509.988,96.014,512.747,95.377,515.294,95.306z M527.072,84.376c-0.486,0.417,2.097,4.043,2.849,4.775c2.615,2.547,6.716-0.718,7.868,3.768c1.433,5.57,8.905,6.26,3.078,6.632c-1.28,0.082-0.321,2.954,0.59,3.66c1.776,1.378,7.395-4.368,11.082,4.829c1.356,3.384,13.604,2.069,13.849,5.252c0.636,8.331-3.396,2.813-4.51,7.693c4.208-1.132,4.067,0.92,0.035,1.627c-3.095,0.543,4.543,2.052-2.688,5.235c-2.667,1.175,6.579,3.042,9.904,6.792c1.98-1.345,13.193,1.414,19.914,5.503c4.146,2.522,4.031,3.304,6.473,0.35c-9.748-8.08-1.273-6.562-7.356-10.381c-2.31-1.449,2.581-2.229,6.083-6.366c-4.668-7.586-9.218-3.679-9.126-8.171c0.221-10.743,2.547-3.856,4.563-4.245c2.017-0.389-2.038-1.653,2.123-4.456c8.453-5.695,16.085,3.616,18.146,1.379c4.171-4.527,11.46,3.043,14.749-0.53c2.386-2.591-7.475-3.06-4.563-4.563c6.438-3.325-3.114-6.696,0.743-6.579c14.043,0.426,16.86-5.016,21.966-4.669c7.287,0.495,1.273,2.193,9.232,4.563c7.958,2.37,11.979-2.58,11.142-1.061c-1.344,2.44,14.15,12.946,14.219,12.521c0.707-4.421,9.763,2.37,23.452,6.049c19.56-11.178,21.116,1.131,28.12-3.396c1.702-1.102-4.882-2.689-1.911-7.216c0.314-0.479,10.718,1.956,11.248,2.758c5.235,7.924,9.056-0.353,18.889,5.625c12.588,7.652,12.767-5.754,24.407-0.318c8.276,2.653,7.136-8.304,5.306-9.231c-1.831-0.93-3.156-3.237,1.202-3.396c20.338-0.742,18.322,13.052,28.085,13.795c9.763,0.742,9.332,8.735,15.068,5.2c7.745-4.776,7.937,11.411,6.685,10.823c-3.289-1.545-4.351,0.425-0.954,9.268c3.395-6.509,9.619,5.094,11.036-6.084c0.304-2.403,3.537-6.72,1.979-9.763c-1.556-3.042,3.679-9.196-2.263-12.026c-5.028-2.395,2.192-7.782-11.319-13.441c-6.556-2.746-2.972,1.84-5.941,1.557c-2.972-0.282-3.914-3.721-6.934-3.537c-7.004,0.425-2.194-1.697,1.264-9.086c2.098-4.483-2.608-8.812,11.47-7.326c8.913,0.94,4.74-3.891,10.612-0.99c2.753,1.359,18.108,4.386,10.47,0.142c-5.92-3.289,1.201-11.319,7.924-5.235c6.304,5.707,3.112-4.669,4.668-5.234c1.557-0.566,6.793,4.739,3.963,6.791c-2.831,2.051,1.838,9.338-3.538,9.904c-2.392,0.251,1.909,1.061,0.425,3.396c-0.507,0.796,20.939,22.213,20.516,20.09c-0.425-2.121,2.231-1.169,0-5.093c-3.197-5.623,3.979-7.46,0.849-9.055c-7.358-3.749,2.758-4.953-2.688-5.802c-4.578-0.713-1.11-3.916-5.235-3.82c-6.014,0.142-2.404-3.466-3.961-4.81c-1.558-1.345,2.264-5.094,4.952-2.547c2.687,2.546-0.638-5.022,9.479-0.282c3.448,1.615-1.558-6.722,12.592-7.641c8.826-0.574-15.692-7-10.612-7.499c7.924-0.778-1.414-4.245-0.424-5.094s3.326,2.901,7.64,2.264c4.315-0.637,7.146,3.537,8.772,2.547s14.997,4.739,3.112-2.688c-1.615-1.01,12.31,0.708-4.951-4.245c-7.785-2.232-6.118-0.482-9.055-1.131c-68.551-15.14-28.369-4.811-59.424-7.005c-21.899-1.546-7.43-5.517-27.731-4.314c-13.108,0.776-7.754-1.644-24.619-3.961c-26.246-3.608-6.58,5.164-20.232,2.264c-21.678-4.606,2.264,6.773-15.422,0.424c-13.101-4.703,2.191-2.776-10.471-6.367c-19.315-5.476,3.566,7.14-33.106-0.565c-5.056-1.063-20.127,3.997-12.451,0.142c10.731-5.389,8.878-9.303-10.046-7.781c-4.477,0.359-1.572-3.979-10.187-3.679c-8.613,0.301,1.998,5.394-13.441,4.527c-4.619-0.26-21.647,3.307-12.45,6.084c1.441,0.435-13.333,1.202-13.725,1.556c-1.69,1.532,7.641,3.82,7.358,5.094c-0.284,1.273-8.508-4.121-14.291-0.424c-1.056,0.675,5.094,1.273,4.952,1.98c-0.141,0.707-6.193-0.131-6.791-2.264c-0.867-3.096-6.707,0.883-0.849,3.679c1.899,0.907-1.187,1.185,1.839,4.527c2.221,2.454,4.138-1.114,6.649,0.99c1.104,0.924-5.368-0.451-2.264,2.83c1.457,1.539-1.576,5.695-4.6,5.659c-3.023-0.035-10.505-2.158-3.323-1.557c3.472,0.292,7.356-5.11,2.547-6.366c-2.773-0.724-3.381-7.341-5.234-7.498c-4.972-0.426,4.526-4.882-6.51-5.095c-8.334-0.159-0.424,4.139-5.234,4.599c-2.045,0.196-0.976,1.583,0.142,1.769c2.228,0.371-0.796,3.661,2.83,4.032c1.409,0.144,5.518,2.193,4.527,3.325c-0.991,1.132-8.578-4.016-18.534-4.386c-5.98-0.223-7.216-2.688-7.782-1.557s9.957,3.59,5.942,5.518s1.928-1.715-8.631,0.425c-10.56,2.14-2.334-3.538-13.158,0c-9.895,3.234-4.191,4.898-8.631,5.094c-2.3,0.101-6.861-3.007-3.112-2.83c2.886,0.136,3.042-2.565-2.688-2.972c-6.836-0.484-0.398-0.018-1.415,2.688c-1.27,3.383,3.166,0.742,1.981,5.094c-0.325,1.192-2.211-3.131-10.045,1.84c-1.601,1.014,7.728,6.225-4.528,2.264c-2.372-0.767-3.879,0.605-1.698,0.99c3.608,0.637,3.184,3.713-2.688,1.415c-7.863-3.079,2.156-3.963-9.764-8.914c-1.306-0.542,6.811,1.31,12.311,2.547s14.572-2.795,2.405-6.65c-6.106-1.935-16.933-4.34-19.95-4.811c-3.6,1.018-2.915,1.141-3.622,1.99c0.001,0,0.001,0.001,0.002,0.001c-0.001,0-0.001-0.001-0.002-0.001c-0.203,0.244-0.515,0.544-1.083,0.947c-2.547,1.803,5.061,2.411,2.653,4.668c-3.168,2.972,3.763,3.289,1.15,6.049c-2.106,2.224,4.836,3.33,2.352,4.987c-3.661,2.441,11.726,1.273-4.704,11.354c7.345,0.346,2.706,2.671,1.132,3.538C524.737,82.52,529.921,81.936,527.072,84.376z M590.705,41.683c-20.939-13.724,15.987-14.997,15.987-17.261s-27.306-0.294-28.579,11.603C577.855,38.432,566.653,38.995,590.705,41.683z M665.409,18.196c-1.839-3.112-9.337-4.386-13.3-2.688C648.148,17.206,666.215,19.559,665.409,18.196z M678.143,19.47c-12.723-5.341-10.753-1.133-11.035,0.849C666.824,22.3,675.029,20.318,678.143,19.47z M652.393,14.752c4.386-1.366,2.122-2.923-5.801-2.073C644.951,12.854,648.007,16.117,652.393,14.752z M844.884,101.143c3.679,4.704,6.721,5.412,14.22,19.1c2.225,4.062,3.554,5.213,3.502,3.502c-0.09-2.937,5.305,1.276-2.335-4.774c-2.717-2.151-3.289-7.699,2.335-4.563c-6.155-3.926-19.702-20.443-18.677-16.66C844.505,99.871,841.205,96.438,844.884,101.143z"/>
            <path id="map_135" vector-effect="non-scaling-stroke" fill="#EBECED" d="M543.37,299.604c-0.746,1.116-1.445,2.171-1.053,3.544c3.997,2.937,3.749-1.556,5.553-0.919c1.804,0.636,0.318-3.185-0.53-4.67C545.482,299.371,545.651,296.681,543.37,299.604z"/>
            <path id="map_136" vector-effect="non-scaling-stroke" fill="#EBECED" d="M595.375,186.988c-1.205-0.032-3.751-0.353-6.014-0.707c-7.286-3.82-12.677-11.014-17.969-10.399c-10.965,1.273,1.344,7.995-5.872,7.995c-1.151,0-2.972,2.688-2.972,2.688l-3.748-1.273c-1.274,10.753-0.79-1.967,6.933,14.999c3.961,8.699,5.941,1.625,7.57,14.714c0.765,6.152,5.517,0.494,12.45,18.394c3.045-7.993,13.9,0.281,15.563-4.388c1.662-4.67,11.177-4.244,13.724-5.093c2.547-0.85,6.261-2.335,9.338-3.82c2.228-9.444,0-9.976,0-9.976l-8.384-0.954l-4.208-4.916c-2.229-0.559-2.264-2.406-3.112-3.538c-0.849,0-0.355-4.104-7.357-12.167C596.577,189.75,600.542,187.129,595.375,186.988z"/>
            <path id="map_137" vector-effect="non-scaling-stroke" fill="#EBECED" d="M404.369,247.403c6.72,0.425,1.909,1.627,7.64,1.132c-1-3.889-2.644-4.216-1.556-8.913c-5.672-1.133-5.672-12.027-14.573-4.599c-0.159,3.073-2.405,4.174-3.043,4.456c-0.636,0.284,2.123,0.62,2.214,4.457c3.446,0.07,5.002-1.697,7.055,0c2.051,1.698,1.697,2.405-1.062,0.708c-2.759-1.698-2.972,1.415-6.155,1.132c-0.07,0.92-0.018,2.287,0.354,2.9C398.426,248.677,397.648,246.979,404.369,247.403z"/>
            <path id="map_138" vector-effect="non-scaling-stroke" fill="#EBECED" d="M515.296,139.121c1.209-0.097,2.443-0.233,2.862-0.627c2.829-2.652-2.228-3.714,0-6.872c-6.391-2.44,0.53-1.935-7.463-7.117c-1.5-0.099-2.496-0.124-3.962,0.881c0.602,1.437-0.019,2.775,0.708,3.7c1.797,2.288,1.391,3.813,0.548,5.032c4.095-0.601,2.706,2.174,2.706,3.608C511.959,137.75,514.342,130.909,515.296,139.121z"/>
            <path id="map_139" vector-effect="non-scaling-stroke" fill="#EBECED" d="M619.583,319.167c-1.25-0.416-1.75,1.166-0.916,1.666S620.833,319.583,619.583,319.167z"/>
            <path id="map_140" vector-effect="non-scaling-stroke" fill="#EBECED" d="M406.066,260.562c0.962,6.662,4.44,6.803,5.448,7.853c2.334-3.325,2.194-3.329,3.465-5.447C414.709,256.1,409.917,255.5,406.066,260.562z"/>
            <path id="map_141" vector-effect="non-scaling-stroke" fill="#EBECED" d="M785.277,288.454c1.104,0.721,3.734,0.282,2.113-1.547C786.406,287.002,785.938,287.375,785.277,288.454z"/>
            <path id="map_142" vector-effect="non-scaling-stroke" fill="#EBECED" d="M500.862,115.468c-0.781,0.122,0.297,1.765,0.919,2.264c3.255,2.617,3.325-0.283,7.711-0.849c4.387-0.566,5.518,0.07,6.132-0.708c0.613-0.777,0.972-1.204,1.013-2.052c-5.094-3.254-5.305,0.426-10.61-1.769C502.63,113.982,504.47,114.901,500.862,115.468z"/>
            <path id="map_143" vector-effect="non-scaling-stroke" fill="#EBECED" d="M496.723,125.974c1.278-0.743,1.806-2.087,2.725-3.729c-0.707,0.904-5.517,0.765-7.923,0.793c0.849,1.698-1.345,1.273-0.213,2.937C492.09,125.301,493.01,128.131,496.723,125.974z"/>
            <path id="map_144" vector-effect="non-scaling-stroke" fill="#EBECED" d="M972.646,333.073c0.284-0.496-2.477-2.264-3.043-1.557C969.038,332.224,972.363,333.567,972.646,333.073z M964.298,327.979c-0.425,1.416,4.075,1.881,4.103,1.628C968.472,328.969,964.722,326.563,964.298,327.979z M970.665,328.969c0.07-0.212-1.186-5.259-2.263-5.163C965.998,324.018,970.595,329.183,970.665,328.969z M965.43,324.301c0.496-0.495-3.891-4.599-4.599-3.538C960.124,321.824,964.934,324.795,965.43,324.301z M958.567,320.589c0-0.812-2.477-3.362-3.679-2.727C953.687,318.499,958.567,321.333,958.567,320.589z"/>
            <path id="map_145" vector-effect="non-scaling-stroke" fill="#EBECED" d="M587.168,253.204c-1.414,10.045,16.554,10.753,16.554,10.753s-8.347,11.885-11.886,11.461c-3.536-0.425-3.623,3.219-7.498,3.112c-3.171,5.803-4.193,5.107-0.849,21.08c3.996-4.047,1.415-5.129,12.098-13.582c12.826-10.149,14.413-28.438,17.614-30.277c1.215-0.698,1.663-5.73-0.354-6.014c-2.016-0.282-0.84,3.714-9.408,3.043c-4.068-0.319-11.001,6.295-14.785-1.486C588.654,251.294,587.388,251.644,587.168,253.204z"/>
            <path id="map_146" vector-effect="non-scaling-stroke" fill="#EBECED" d="M550.657,392.309c-5.148,5.769-6.66-5.454-0.771-3.702c1.394,0.414,0.53-8.065-1.484-12.841c-1.417,1.965-3.365-0.425-6.368-1.167c-7.322,3.396-7.109,9.02-9.232,9.02c-2.122,0-1.38,7.216-8.17,3.502c-5.59-3.057-3.576,7.35-9.869,4.775c-2.334-0.955,2.865-3.396-2.334-7.321c0.849,26.953-9.445,7.746-11.001,14.502c1.306,1.182,7.781,14.431,4.387,14.785c-1.831,0.19,4.544,9.709,6.649,6.932c1.099-1.448,13.813-0.671,15.775-2.616s8.489,1.768,18.039-14.361c2.344-3.957,4.774-2.476,6.65-11.813C552.354,392.309,551.075,391.841,550.657,392.309z M537.152,406.274c-1.697-1.035-5.677-3.979,2.229-7.562C543.865,401.26,539.726,405.372,537.152,406.274z"/>
            <path id="map_147" vector-effect="non-scaling-stroke" fill="#EBECED" d="M833.778,156.074c2.775,0.92-2.053-1.202,3.536,9.976c1.263,2.525,6.438-2.193,7.641-1.415c1.202,0.777,1.909-4.315-7.356-12.451C836.396,154.749,833.778,151.334,833.778,156.074z"/>
            <path id="map_148" vector-effect="non-scaling-stroke" fill="#EBECED" d="M537.082,274.428c3.82,6.933,10.753,0.99,11.319,5.941c6.579-2.653,4.881,2.612,9.868-1.697c3.123-2.699,3.644-2.087,6.543-1.84c-2.828-11.318-8.63-10.327-9.337-13.017c-0.707-2.688,4.245,2.405,3.396-5.093c-0.528-4.658-3.537-2.087-3.396-7.782c0.074-2.983-2.547-2.405-3.82,4.527c-1.312,7.141-3.414-3.274-11.035,3.82c-6.367,5.926-4.246-8.489-15.564-1.415C524.489,265.654,531.122,263.611,537.082,274.428z"/>
            <path id="map_149" vector-effect="non-scaling-stroke" fill="#EBECED" d="M457,137.859c-0.547,0.719-2.188,0.469-1.391-0.719c-2.609-1.828-1.078,2.547-9.29-2.714c-4.032,2.335-25.396-5.447-21.011,5.306c2.759-1.344,6.686,0.142,7.11,1.31c0.424,1.167-2.229,0.848-4.14,16.045c2.193-0.942,4.099,5.651,5.659,3.868c4.253-4.854,9.232-0.627,10.329-2.405c2.052-3.324,4.576-2.063,4.527-3.678c-0.07-2.335,2.84-2.559,2.406-3.679c-3.539-9.127,10.681-8.349,9.902-13.441C460.02,137.129,459.052,138.972,457,137.859z M461.069,147.514c-2.123-0.954-3.078,0.849-1.911,1.593C460.326,149.849,461.85,147.865,461.069,147.514z"/>
            <path id="map_150" vector-effect="non-scaling-stroke" fill="#EBECED" d="M707.289,257.59c-1.556,8.064-0.083,16.778,4.104,13.158C716.627,266.221,711.817,260.986,707.289,257.59z"/>
            <path id="map_151" vector-effect="non-scaling-stroke" fill="#EBECED" d="M528,213.022c0,4.208,0,7.978,0,7.978h-3v0.936v14.077c0,0-2.36-1.201-5.33,7.429c-2.972,8.631,2.41-0.565,2.834,9.763c1.557,1.415,2.695,1.692,2.479,4.669c11.318-7.074,9.234,7.341,15.602,1.415c7.621-7.095,9.741,3.32,11.053-3.82c1.273-6.933,3.904-7.511,3.83-4.527c-0.142,5.695,2.871,3.124,3.399,7.782c0.813-9.444,7.661-8.26,7.359-17.51c-0.424-13.052,3.822-8.999,6.51-13.83c-0.36-1.377-4.351,0.113-5.093-7.421c-0.318-3.235-1.152-4.961-2.077-6.961H528C528,214,528,213.011,528,213.022z"/>
            <path id="map_152" vector-effect="non-scaling-stroke" fill="#EBECED" d="M260.664,278.248c0.521,4.953,1.653,0.425,3.918,8.349c5.335-3.02,4.73-2.445,6.791-1.416c5.11-6.296-3.644-4.812,2.971-12.593c-2.887-1.371-9.781-0.048-10.753-1.132C264.016,277.966,260.143,273.297,260.664,278.248z"/>
            <path id="map_153" vector-effect="non-scaling-stroke" fill="#EBECED" d="M550.657,392.309c0.106-1.39-0.188-3.199-0.771-3.702C543.997,386.854,545.509,398.077,550.657,392.309z"/>
            <path id="map_154" vector-effect="non-scaling-stroke" fill="#EBECED" d="M506.451,46.918c-2.709-2.084-4.458,4.315-10.259,5.235c-5.802,0.919-0.849,9.196-6.933,10.328c-6.085,1.132,2.688,10.54-5.234,16.837c2.453,2.828-0.514,3.731,3.537,7.357c2.29,2.05-1.103,5.341,3.82,5.234c3.698-0.078-2.088-3.448,3.819-2.971c5.935,0.479,0.631-6.914,5.095-8.772c13.086-5.447-12.486-6.189,5.8-16.059c7.743-4.178-3.696-5.571,9.197-7.145C513.03,46.636,511.048,50.455,506.451,46.918z"/>
            <path id="map_155" vector-effect="non-scaling-stroke" fill="#EBECED" d="M479.819,119.358c-1.729-0.989-3.788,0.143-5.698,0c-1.627,0.85-6.438,4.245-1.557,5.73c3.465,1.055,2.631-1.086,4.669-0.495c4.885,1.414,2.963-2.122,5.519-2.688C480.188,122.188,479.288,121.781,479.819,119.358z"/>
            <path id="map_156" vector-effect="non-scaling-stroke" fill="#EBECED" d="M560.004,171.822c3.879,5.634,8.277,0.272,9.495-0.432c5.958-3.445,7.906-3.643,6.704-10.61c-0.479-2.77,3.804-0.993,2.865-3.692c-0.814-2.338-7.676,3.586-10.718,1.138c-1.708-1.375-1.911,2.448-5.094,0.432c-3.184-2.017-0.105,3.714-3.396,3.184c-0.283,2.582,1.305,1.415,0.53,4.351C563.652,165.485,562.685,170.613,560.004,171.822z"/>
            <path id="map_157" vector-effect="non-scaling-stroke" fill="#EBECED" d="M470.625,291.688c-0.75-0.438-2.125,1.125-1.063,1.875S471.375,292.125,470.625,291.688z"/>
            <path id="map_158" vector-effect="non-scaling-stroke" fill="#EBECED" d="M832.894,200.89c-5.376,2.149-3.502,10.506,0,11.566C832.574,210.971,837.138,199.191,832.894,200.89z"/>
            <path id="map_159" vector-effect="non-scaling-stroke" fill="#EBECED" d="M671.786,148.895c-17.852,0.954-14.087-2.548-8.994-2.548c-2.972-5.093-5.729-0.954-6.048,1.167c-0.318,2.123-6.049-0.318-2.017,3.184s-0.318,3.865,1.167,6.39c3.926,3.267,9.551-9.147,11.036-2.338c2.113,9.69,3.733-0.705,10.188,2.21C680.619,152.184,671.786,153.775,671.786,148.895z"/>
            <path id="map_160" vector-effect="non-scaling-stroke" fill="#EBECED" d="M559.225,297.56c-1.847-1.011-10.86-0.999-11.885,0c0.849,1.485,2.334,5.306,0.53,4.67c-1.577,2.652,4.068,2.652-3.855,7.428c0,1.697,3.672,13.018,4.388,14.007s4.391,4.466,7.356,4.811c6.084,0.708,3.679,7.499,5.659,7.499s10.61,2.122,17.897-4.104c-0.777-0.778-4.704-2.582-3.041-11.248c0.751-3.921-5.696-1.521-0.425-9.833C563.611,303.113,580.3,309.095,559.225,297.56z"/>
            <path id="map_161" vector-effect="non-scaling-stroke" fill="#EBECED" d="M786.805,241.035c3.006-26.032-17.156-5.712-14.29-15.42c1.438-4.872-3.112-3.82-4.387-6.934c-3.82,2.402-12.592,2.689-6.366,9.339s1.415,6.649,4.682,13.015c5.614,10.939,2.675,7.642,0.411,15.565c-1.344,10.965,2.971,4.527,5.66,12.732c3.485,0.604,3.63,5.313,6.933,0.99c-3.386-3.413-6.017-0.998-6.296-4.456c-0.565-7.004-1.609-5.361-2.9-6.438c-3.396-2.829,1.556-9.197,0.778-13.583c-0.428-2.405,2.283-2.602,2.617-0.424c0.565,3.679,5.239,1.543,6.085,3.536C775.769,236.65,786.552,243.219,786.805,241.035z"/>
            <path id="map_162" vector-effect="non-scaling-stroke" fill="#EBECED" d="M401.044,244.645c2.759,1.697,3.112,0.99,1.062-0.708c-2.053-1.697-3.608,0.07-7.055,0c0.02,0.778-0.091,0.92-0.162,1.84C398.072,246.06,398.285,242.946,401.044,244.645z"/>
            <path id="map_163" vector-effect="non-scaling-stroke" fill="#EBECED" d="M857.034,324.745c-6.479,1.107-2.547,2.262-5.783,2.367c0.124,1.013,0.728,1.286,0.926,2.212C853.291,328.336,867.248,323,857.034,324.745z"/>
            <path id="map_164" vector-effect="non-scaling-stroke" fill="#EBECED" d="M451.744,252.973c-1.239,0.3-1.068,0.545-2.809,0.373c3.681,10.204-2.016,13.76,3.681,17.898c0.557-0.187,1.413-0.495,1.838-0.638C451.819,267.901,455.232,261.481,451.744,252.973z"/>
            <path id="map_165" vector-effect="non-scaling-stroke" fill="#EBECED" d="M475.462,166.756c-5.02,4.811,1.292,4.104,3.752,15.563c8.9-5.305-2.264-1.697,6.438-10.61c-2.505-1.491-0.99-1.981-1.769-2.547c-0.778-0.566-4.51,1.114-1.557-2.052c4.836-5.184-1.256-5.271,1.345-7.853c1.407-1.397,0.477-2.382-0.85-0.849c-0.754,0.871,0.009-3.065-6.154-0.354C474.828,160.955,478.77,163.584,475.462,166.756z"/>
            <path id="map_166" vector-effect="non-scaling-stroke" fill="#EBECED" d="M563.257,158.656c3.183,2.017,3.386-1.807,5.094-0.432c3.042,2.448,9.903-3.476,10.718-1.138c4.774-2.338,2.44,1.614,7.427,0c-5.41-9.892-1.485-7.98-1.381-9.573c0.105-1.591-2.122,1.333-4.349-4.563c-1.061-2.809-3.714-0.955-6.048-1.662c-2.689,3.254-4.245,0.99-8.262,2.511c-4.02,1.521-6.383-3.572-9-2.794s-0.99-3.82-11.813,0.566c-7.652,3.101-10.611-0.071-11.408-2.123c-1.433,0.902-4.457-0.424-4.563,0.955c-0.106,1.38,1.326,1.273-1.008,3.396c4.396,2.354,4.032-3.289,10.255,0.625c2.868,1.803-10.897-0.751-9.937,3.089c0.884,3.537,2.333-0.368,2.121,5.943c-0.167,5.022,5.207,2.817,8.67,6.36c3.464,3.543,2.048-2.611,6.824-0.843c4.774,1.769,3.536,4.173,8.064,0.53c1.856-1.493,2.07,0.381,4.031-0.425c3.538-1.45,1.45,0.178,1.168,2.76C563.151,162.37,560.073,156.64,563.257,158.656z"/>
            <path id="map_167" vector-effect="non-scaling-stroke" fill="#EBECED" d="M652.393,156.322c0-4.351-13.9-5.73-14.877-10.054c-0.965-4.27-3.87-4.283-5.709-3.876c-3.316,0.733,1.891-3.031-4.351-4.048c-12.097-1.973-4.351,3.651-10.08,3.333c-5.731-0.317-3.821-7.382-10.4-1.238c1.098,1.443,1.38-3.606,5.094,1.415c3.714,5.023-4.528-0.919-3.112,3.962c1.415,4.881,5.161,0.637,5.161,10.611c6.759,0.106,4.02-7.686,17.477,1.168c4.032,2.651,5.313-0.542,5.836,5.305C646.026,165.872,642.843,157.087,652.393,156.322z"/>
            <path id="map_168" vector-effect="non-scaling-stroke" fill="#EBECED" d="M548.401,280.369c0.304,2.655,1.132,6.532-4.104,17.686c-0.259,0.552-0.597,1.057-0.927,1.55c2.281-2.924,2.112-0.233,3.97-2.045c1.024-0.999,10.038-1.011,11.885,0c-1.975-7.185,6.261-11.566-0.955-18.888C553.282,282.981,554.98,277.716,548.401,280.369z"/>
            <path id="map_169" vector-effect="non-scaling-stroke" fill="#EBECED" d="M518.053,118.156c2.411-1.148,2.759,2.122,10.541-1.273c5.852-2.554,13.062,7.038,9.125,6.65c-5.022-0.496,1.253,1.453-4.032,3.395c2.476,2.123,2.052-0.742,4.527,0.902c-0.063-1.22-0.567-2.178,2.706-4.51c4.244-3.024,1.777,1.622,5.358,1.433c8.012-0.425-2.442,2.299,1.274,2.653c4.455,0.424,0.317,2.546,2.228,3.501c1.909,0.955,3.715-2.864,6.897-2.068c2.182,0.545,1.22-2.495-1.061-1.593c-2.281,0.902-7.058-4.722,6.261-6.261c1.113-4.881,5.146,0.638,4.51-7.693c-0.244-3.183-12.492-1.868-13.849-5.252c-3.688-9.197-9.306-3.451-11.082-4.829c-4.835,0-2.501,3.768-3.243,3.024c-0.743-0.743-12.38-3.024-19.64-1.379c5.105,5.788-1.653,3.467-1.938,9.267c-0.041,0.848-0.399,1.274-1.013,2.052C516.779,117.377,516.143,116.6,518.053,118.156z"/>
            <path id="map_170" vector-effect="non-scaling-stroke" fill="#EBECED" d="M624.379,210.121c1.167-12.839,2.017-4.811,3.396-8.134c-0.788-2.126-0.708-2.547-0.708-3.962s-4.598,3.962-5.376,6.014c-0.779,2.051-8.914,0.778-9.904,0.212l4.208,4.916L624.379,210.121z"/>
            <path id="map_171" vector-effect="non-scaling-stroke" fill="#EBECED" d="M437.937,88.727c-2.466,3.396,2.334,3.661,2.016,1.698c-0.238-1.467,1.791,0.737,0.954,2.122c-2.016,3.343,4.723-0.742,3.29,2.229c-0.651,1.352,2.351,0.755,1.38,2.123c-1.168,1.644,2.172,2.918-2.016,1.909c-2.742-0.659-0.744,2.916-2.441,3.979c-5.252,3.289,1.008,1.326,1.062,2.493c0.047,1.028,3.191,0.072,2.759,0.637c-0.689,0.903-2.166,0.302-4.987,2.229c-2.175,1.486-3.448,3.025-0.743,1.593c1.119-0.593,3.714,0.795,3.927-0.531c0.212-1.326,15.182-0.145,12.203-3.715c-1.583-1.897,4.298-1.379,2.652-4.669c-1.382-2.764-3.873,1.115-4.563-0.424c-0.227-0.506,2.652-2.6-2.017-5.624c-1.762-1.141,0.054-3.131-5.199-5.837c-0.87-0.448,3.819-2.175,3.502-4.563c-0.191-1.436-5.73,0.637-5.943-0.955c-0.121-0.907,3.29-1.22,3.185-2.632c-0.047-0.618-4.299,0.298-4.775-0.021c-0.478-0.318-1.348,0.574-1.91,2.121c-1.329,3.658-2.203,0.202-3.242,1.593C435.442,86.604,441.172,84.271,437.937,88.727z M434.116,95.89c1.22-1.008,1.255,1.336,2.281,0.849c-0.302-0.593,3.979-0.213,1.751-3.131c-1.791-2.345-2.12-0.585-2.76-1.167C429.446,95.094,432.896,96.898,434.116,95.89z"/>
            <path id="map_172" vector-effect="non-scaling-stroke" fill="#EBECED" d="M83.763,75.498c19.362,0.002,3.362,21.002,14.856,18.11c11.297-4.525,1.464-3.858,4.951-12.168c4.331-10.322-7.499,2.405-7.641-5.234c-0.047-2.551-4.358-1.415-4.358-1.415c4.512-4.291,32.475-27.447,35.91-29.994c-22.567-2.548-9.373-1.991-23.628-4.528c-8.348-1.486-4.316,1.285-11.178,1.132c-9.479-0.213-15.271,4.866-21.788,5.234c-7.5,0.425-8.489,2.264-9.479,2.264c-0.991,0,3.042,1.203,1.557,2.972c-1.486,1.769,3.797,2.704,0.848,3.396c-7.852,1.838-4.386-0.283-4.245-0.708c0.144-0.425-16.44,2.313-14.431,3.254c3.324,1.557-2.971,2.264,0.566,3.396s6.65,0.849,8.772-0.283c2.122-1.131,2.64-0.259,1.272,0.99c-4.951,4.528-6.469,2.099-8.914,3.396c-3.466,1.839,0.003-1.473-10.045,2.547c-11.319,4.527-2.999,3.938-5.942,5.941c-4.882,3.325,4.827,1.261,2.122,4.104c-4.174,4.386-1.839,3.112,0.85,2.122c2.688-0.99,1.769,2.547,4.244,0.425c2.477-2.122,4.996-0.978,2.547,0.85c-7.864,5.865-16.553,6.933-17.402,8.276s3.289,0.254,5.941-0.638c39.404-13.229,17.051-7.709,26.034-11.742s15.28-5.942,14.148-4.527s-5.996,1.316-6.65,2.546c-1.203,2.264-6.226,3.396-3.962,3.396c2.265,0,8.065-3.112,10.895-2.546c2.831,0.566,4.174-5.093,8.772-3.537C82.984,74.084,76.333,75.497,83.763,75.498z M247.938,126.313c-5.375,6.016-12.813-2.054-19.188,5.521c3.167,1.167-3.25,3.75-9.167,3c0.134,0.471-0.96,1.417-1.045,1.638c0.042,0.012,0.087,0.016,0.128,0.029c2.289,0.74-6.166,3.667-8.583,4.5s-8.38-1.138-4.5-1.583c0.864-0.947,3.208-3.25,3.833-3.75c0.604-5.333-3.766-0.083-3.583-2.388c0.107-1.357,5.826-4.097,3.083-6.029c-3.266-2.301-10.154,3.938-10.917,7.717c-1.083,5.366-9.375,9.72-3.417-1.688c3.553-6.803,12.542-9.262,15.437-8.33c0.062-0.509-0.687-1.532-1.104-1.866c-1.417,1.292-0.729-1.146-5.728,0c-4.414,1.012-0.272-3.667-6.855-1.583c-5.73,1.813-13.083,1,0.417-4c-10.813-0.813-12.063-2.875-12.109-3.659c-0.161-2.684-2.121,0.009-2.121,0.009l-78.525-0.009c0.283,6.084-6.063,0.712-6.366,1.98c-3.75,15.705-14.715,19.666-13.865,23.346c0.548,2.377-4.103,5.519-3.396,7.711s-1.374,2.17-0.284,11.39c2.193,18.534,8.224,1.851,8.632,15.987c0,0.019,0.001,0.035,0.002,0.054l7.638,0.086l9.762,5.605h8.49c0,0,3.502-3.986,6.26-1.758c5.328,4.304,0.955,6.177,4.882,8.406c3.926,2.229,4.611-4.777,8.17-2.165c6.792,4.988-1.061,14.146,9.657,13.827c-0.796-9.815,6.48-9.013,9.656-11.603c7.481-6.102,13.583,1.997,14.75-0.442c0.884-1.848,3.077,1.954,3.714,0.203s-5.196-3.718,4.563-4.249c10.718-0.584,6.131,4.369,9.551,2.226c3.979-2.493,6.343,3.248,4.563,5.411c-1.964,2.388,1.91,5.04,1.698,7.852c-0.113,1.485,2.174,1.274,1.909,5.094c9.904-4.209-4.951-22.178,8.206-28.262c3.249-1.503,4.811-5.518,6.933-5.376c2.123,0.142,3.266-2.712,6.226-2.972c4.032-0.354,5.146-10.608,5.235-12.593c0.176-3.961,1.788-0.785,0.99,1.698c-1.273,3.962,4.599-4.669,8.064-7.994c3.467-3.325-2.936-3.042,6.791-5.306c3.869-0.9,5.681,0.17,6.084-2.971c0.778-6.049,12.876-9.479,14.432-10.471C256.256,126.922,259.076,113.846,247.938,126.313z M113.622,132c-2.699,0-5.622,0-6.622z"/>
            <path id="map_173" vector-effect="non-scaling-stroke" fill="#EBECED" d="M279.155,407.99c-6.485-4.707-4.245-1.131-8.348-3.536c-1.19,3.692-1.984,12.336,0.848,15.279c0.834-0.726,10.54,6.296,14.855-1.698C283.397,416.053,289.483,415.489,279.155,407.99z"/>
            <path id="map_174" vector-effect="non-scaling-stroke" fill="#EBECED" d="M661.731,141.996c-4.016-0.373,1.804-2.971-1.168-3.367c-0.505,1.186-4.881,8.036-6.897,4.534s-3.926,0.85-6.897-5.239c-2.971-6.089-7.004-4.734-13.052-3.727c-3.502-3.979-12.521-7.481-12.521-7.481l-6.262,2.123l2.442,12.839c5.729,0.318-2.017-5.306,10.08-3.333c6.241,1.017,1.034,4.781,4.351,4.048c1.839-0.407,4.744-0.394,5.709,3.876c0.977,4.323,14.877,5.703,14.877,10.054c0,1.469,2.764,0.149,3.502,0.765c-1.485-2.524,2.865-2.888-1.167-6.39s1.698-1.061,2.017-3.184c0.318-2.121,3.076-6.26,6.048-1.167C667.885,146.347,670.856,142.845,661.731,141.996z"/>
            <path id="map_175" vector-effect="non-scaling-stroke" fill="#EBECED" d="M218.739,267.354c7.5,0.143-0.324,4.952,7.642,3.962c7.965-0.99-0.85,0.85,4.527,14.573c3.071,7.839,14.714,2.264,8.348-6.649c-0.92-1.288,15.49-0.605,13.158-4.387c-5.235-8.489,0.707-4.81,1.557-6.933c0.849-2.122-5.661,1.129,0.989-5.095c-2.308-1.38-2.829,0-4.103-0.849c-1.274-0.849,5.941-2.193-2.83-4.811c-5.363-1.601,1.485-5.377-6.933-1.415c-5.687,2.677-2.193-2.617-9.622-0.849c-5.709,1.359,0.354-5.448-11.601-2.265c-3.028,0.807,0.569,9.195-2.547,7.499c-4.033-2.193,1.216-3.695-0.283-7.499C211.03,253.487,211.242,267.21,218.739,267.354z"/>
            <path id="map_176" vector-effect="non-scaling-stroke" fill="#EBECED" d="M782.595,208c-3.767-0.955,1.433,2.864-9.02,3.184c7.322,10.515,4.881,1.272,9.231,7.321c4.618,6.419-7.321-0.213,3.609,9.02c8.326,7.033,7.933,11.354,7.746,12.946c-0.188,1.591,4.563,7.321-2.229,9.338c-7.178,2.13,5.636,3.946-6.119,5.094c2.926,3.174,1.246,0.951,1.415,4.386c0.293,6.013,0.963,0.508,3.395,0c5.094-1.062,0.991-3.112,2.123-4.245c1.132-1.131,0.877,0.474,3.679-0.707c9.903-4.174,1.155-19.793-2.405-21.93c-12.38-7.429-5.017-17.4-0.849-17.969C782.012,211.502,793.323,210.719,782.595,208z"/>
            <path id="map_177" vector-effect="non-scaling-stroke" fill="#EBECED" d="M407,209.697l4-2.476V199h11v-6.635l-13.538-0.282c-4.598,9.691-5.938,3.112-10.253,16.624c-1.089,3.409-2.828,2.55-2.969,7.059c0.039,0.036,0.069,0.234,0.107,0.234H407V209.697z"/>
            <path id="map_178" vector-effect="non-scaling-stroke" fill="#EBECED" d="M601.317,229.01c-1.663,4.669-12.519-3.605-15.563,4.388c3.079,7.951-0.213,12.874,5.376,13.582c4.638,0.587,3.184-3.608,12.31-4.81c3.582-0.472,3.115-2.284,5.093-2.831c11.531-3.184,5.586-5.306,10.753-6.79l-4.244-8.632C612.494,224.766,602.979,224.34,601.317,229.01z"/>
            <path id="map_179" vector-effect="non-scaling-stroke" fill="#EBECED" d="M540.23,336.322c0,3.639,5.959,1.455,3.784,6.336c-1.426,3.199-2.617-5.305-10.576-5.199c-3.715,0.049-0.553-3.768-7.216-3.077c-0.027,2.048-0.628,4.452-0.322,6.685l-6.9,0.637V353.8l4.672,4.563c0,0,4.832-2.318,5.892,0.53c13.583,1.804,8.464-9.974,16.847-7.534c-1.592-3.077,2.163-3.926,9.309-6.367c-2.83-5.729,4.486-6.79,0.02-16.518c-2.966-0.345-6.63-3.821-7.346-4.811C539.162,322.709,540.23,332.684,540.23,336.322z"/>
            <path id="map_180" vector-effect="non-scaling-stroke" fill="#EBECED" d="M529.725,358.894c3.077,8.277,10.071,15.152,12.31,15.705c3.003,0.742,4.951,3.132,6.368,1.167c14.324-19.844-1.083-22.804-1.911-24.406C538.107,348.92,543.308,360.697,529.725,358.894z"/>
          </g>
          <g id="map_points"></g>
          </svg> </div>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<!--end map-preview--> 

<span id="map-tip"></span> <span id="scroll-top"><a class="scrollup"></a></span> 

<script>$(function(){addEvent('map_1');addEvent('map_2');addEvent('map_3');addEvent('map_4');addEvent('map_5');addEvent('map_6');addEvent('map_7');addEvent('map_8');addEvent('map_9');addEvent('map_10');addEvent('map_11');addEvent('map_12');addEvent('map_13');addEvent('map_14');addEvent('map_15');addEvent('map_16');addEvent('map_17');addEvent('map_18');addEvent('map_19');addEvent('map_20');addEvent('map_21');addEvent('map_22');addEvent('map_23');addEvent('map_24');addEvent('map_25');addEvent('map_26');addEvent('map_27');addEvent('map_28');addEvent('map_29');addEvent('map_30');addEvent('map_31');addEvent('map_32');addEvent('map_33');addEvent('map_34');addEvent('map_35');addEvent('map_36');addEvent('map_37');addEvent('map_38');addEvent('map_39');addEvent('map_40');addEvent('map_41');addEvent('map_42');addEvent('map_43');addEvent('map_44');addEvent('map_45');addEvent('map_46');addEvent('map_47');addEvent('map_48');addEvent('map_49');addEvent('map_50');addEvent('map_51');addEvent('map_52');addEvent('map_53');addEvent('map_54');addEvent('map_55');addEvent('map_56');addEvent('map_57');addEvent('map_58');addEvent('map_59');addEvent('map_60');addEvent('map_61');addEvent('map_62');addEvent('map_63');addEvent('map_64');addEvent('map_65');addEvent('map_66');addEvent('map_67');addEvent('map_68');addEvent('map_69');addEvent('map_70');addEvent('map_71');addEvent('map_72');addEvent('map_73');addEvent('map_74');addEvent('map_75');addEvent('map_76');addEvent('map_77');addEvent('map_78');addEvent('map_79');addEvent('map_80');addEvent('map_81');addEvent('map_82');addEvent('map_83');addEvent('map_84');addEvent('map_85');addEvent('map_86');addEvent('map_87');addEvent('map_88');addEvent('map_89');addEvent('map_90');addEvent('map_91');addEvent('map_92');addEvent('map_93');addEvent('map_94');addEvent('map_95');addEvent('map_96');addEvent('map_97');addEvent('map_98');addEvent('map_99');addEvent('map_100');addEvent('map_101');addEvent('map_102');addEvent('map_103');addEvent('map_104');addEvent('map_105');addEvent('map_106');addEvent('map_107');addEvent('map_108');addEvent('map_109');addEvent('map_110');addEvent('map_111');addEvent('map_112');addEvent('map_113');addEvent('map_114');addEvent('map_115');addEvent('map_116');addEvent('map_117');addEvent('map_118');addEvent('map_119');addEvent('map_120');addEvent('map_121');addEvent('map_122');addEvent('map_123');addEvent('map_124');addEvent('map_125');addEvent('map_126');addEvent('map_127');addEvent('map_128');addEvent('map_129');addEvent('map_130');addEvent('map_131');addEvent('map_132');addEvent('map_133');addEvent('map_134');addEvent('map_135');addEvent('map_136');addEvent('map_137');addEvent('map_138');addEvent('map_139');addEvent('map_140');addEvent('map_141');addEvent('map_142');addEvent('map_143');addEvent('map_144');addEvent('map_145');addEvent('map_146');addEvent('map_147');addEvent('map_148');addEvent('map_149');addEvent('map_150');addEvent('map_151');addEvent('map_152');addEvent('map_153');addEvent('map_154');addEvent('map_155');addEvent('map_156');addEvent('map_157');addEvent('map_158');addEvent('map_159');addEvent('map_160');addEvent('map_161');addEvent('map_162');addEvent('map_163');addEvent('map_164');addEvent('map_165');addEvent('map_166');addEvent('map_167');addEvent('map_168');addEvent('map_169');addEvent('map_170');addEvent('map_171');addEvent('map_172');addEvent('map_173');addEvent('map_174');addEvent('map_175');addEvent('map_176');addEvent('map_177');addEvent('map_178');addEvent('map_179');addEvent('map_180');})</script> 
<script>
	var map_config = {
		'default':{'borderColor':'#9CA8B6','mapShadow':'#fff','shadowOpacity':'35','hoverShadow':'#666666','lakesColor':'#66CCFF','namesColor':'#919191',},
	'map_1':{
		'hover': 'AFGHANISTAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_2':{
		'hover': 'ALBANIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_3':{
		'hover': 'ALGERIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_4':{
		'hover': 'ANDORRA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_5':{
		'hover': 'ANGOLA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_6':{
		'hover': 'ARGENTINA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_7':{
		'hover': 'ARMENIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_8':{
		'hover': 'AUSTRALIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_9':{
		'hover': 'AUSTRIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_10':{
		'hover': 'AZERBAIJAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_11':{
		'hover': 'BAHAMAS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_12':{
		'hover': 'BAHRAIN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_13':{
		'hover': 'BANGLADESH','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_14':{
		'hover': 'BELARUS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_15':{
		'hover': 'BELGIUM','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_16':{
		'hover': 'BELIZE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_17':{
		'hover': 'BENIN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_18':{
		'hover': 'BHUTAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_19':{
		'hover': 'BOLIVIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_20':{
		'hover': 'BOSNIA AND HERZEGOVINA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_21':{
		'hover': 'BOTSWANA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_22':{
		'hover': 'BRAZIL','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_23':{
		'hover': 'BRUNEI','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_24':{
		'hover': 'BULGARIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_25':{
		'hover': 'BURKINA FASO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_26':{
		'hover': 'BURUNDI','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_27':{
		'hover': 'CAMBODIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_28':{
		'hover': 'CAMEROON','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_29':{
		'hover': 'CANADA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_30':{
		'hover': 'CENTRAL AFRICAN REPUBLIC','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_31':{
		'hover': 'CHAD','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_32':{
		'hover': 'CHILE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_33':{
		'hover': 'CHINA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_34':{
		'hover': 'COLOMBIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_35':{
		'hover': 'COMOROS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_36':{
		'hover': 'CONGO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_37':{
		'hover': 'COSTA RICA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_38':{
		'hover': 'CROATIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_39':{
		'hover': 'CUBA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_40':{
		'hover': 'CYPRUS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_41':{
		'hover': 'CZECH REPUBLIC','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_42':{
		'hover': 'CÔTE D&#39;IVOIRE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_43':{
		'hover': 'DEMOCRATIC REPUBLIC OF THE CONGO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_44':{
		'hover': 'DENMARK','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_45':{
		'hover': 'DJIBOUTI','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_46':{
		'hover': 'DOMINICAN REPUBLIC','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_47':{
		'hover': 'ECUADOR','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_48':{
		'hover': 'EGYPT','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_49':{
		'hover': 'EL SALVADOR','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_50':{
		'hover': 'EQUATORIAL GUINEA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_51':{
		'hover': 'ERITREA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_52':{
		'hover': 'ESTONIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_53':{
		'hover': 'ETHIOPIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_54':{
		'hover': 'FIJI','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_55':{
		'hover': 'FINLAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_56':{
		'hover': 'FRANCE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_57':{
		'hover': 'FRENCH GUIANA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_58':{
		'hover': 'GABON','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_59':{
		'hover': 'GEORGIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_60':{
		'hover': 'GERMANY','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_61':{
		'hover': 'GHANA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_62':{
		'hover': 'GREECE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_63':{
		'hover': 'GREENLAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_64':{
		'hover': 'GUATEMALA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_65':{
		'hover': 'GUINEA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_66':{
		'hover': 'GUINEA-BISSAU','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_67':{
		'hover': 'GUYANA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_68':{
		'hover': 'HAITI','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_69':{
		'hover': 'HONDURAS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_70':{
		'hover': 'HUNGARY','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_71':{
		'hover': 'ICELAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_72':{
		'hover': 'INDIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_73':{
		'hover': 'INDONESIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_74':{
		'hover': 'IRAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_75':{
		'hover': 'IRAQ','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_76':{
		'hover': 'IRELAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_77':{
		'hover': 'ISREAL','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_78':{
		'hover': 'ITALY','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_79':{
		'hover': 'JAMAICA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_80':{
		'hover': 'JAPAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_81':{
		'hover': 'JORDAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_82':{
		'hover': 'KAZAKHSTAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_83':{
		'hover': 'KENYA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_84':{
		'hover': 'KOSOVO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_85':{
		'hover': 'KUWAIT','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_86':{
		'hover': 'KYRGYZSTAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_87':{
		'hover': 'LAOS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_88':{
		'hover': 'LATVIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_89':{
		'hover': 'LEBANON','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_90':{
		'hover': 'LESOTHO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_91':{
		'hover': 'LIBERIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_92':{
		'hover': 'LIBYA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_93':{
		'hover': 'LIECHTENSTEIN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_94':{
		'hover': 'LITHUANIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_95':{
		'hover': 'LUXEMBOURG','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_96':{
		'hover': 'MACEDONIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_97':{
		'hover': 'MADAGASCAR','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_98':{
		'hover': 'MALAWI','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_99':{
		'hover': 'MALAYSIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_100':{
		'hover': 'MALDIVES','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_101':{
		'hover': 'MALI','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_102':{
		'hover': 'MALTA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_103':{
		'hover': 'MAURITANIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_104':{
		'hover': 'MAURITIUS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_105':{
		'hover': 'MEXICO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_106':{
		'hover': 'MOLDOVA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_107':{
		'hover': 'MONGOLIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_108':{
		'hover': 'MONTENEGRO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_109':{
		'hover': 'MOROCCO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_110':{
		'hover': 'MOZAMBIQUE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_111':{
		'hover': 'MYANMAR','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_112':{
		'hover': 'NAMIBIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_113':{
		'hover': 'NEPAL','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_114':{
		'hover': 'NETHERLANDS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_115':{
		'hover': 'NEW ZEALAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_116':{
		'hover': 'NICARAGUA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_117':{
		'hover': 'NIGER','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_118':{
		'hover': 'NIGERIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_119':{
		'hover': 'NORTH KOREA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_120':{
		'hover': 'NORWAY','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_121':{
		'hover': 'OMAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_122':{
		'hover': 'PAKISTAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_123':{
		'hover': 'PALESTINE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_124':{
		'hover': 'PANAMA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_125':{
		'hover': 'PAPUA NEW GUINEA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_126':{
		'hover': 'PARAGUAY','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_127':{
		'hover': 'PERU','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_128':{
		'hover': 'PHILIPPINES','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_129':{
		'hover': 'POLAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_130':{
		'hover': 'PORTUGAL','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_131':{
		'hover': 'PUETRO RICO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_132':{
		'hover': 'QATAR','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_133':{
		'hover': 'ROMANIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_134':{
		'hover': 'RUSSIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_135':{
		'hover': 'RWANDA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_136':{
		'hover': 'SAUDI ARABIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_137':{
		'hover': 'SENEGAL','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_138':{
		'hover': 'SERBIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_139':{
		'hover': 'SEYCHELLES','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_140':{
		'hover': 'SIERRA LEONE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_141':{
		'hover': 'SINGAPORE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_142':{
		'hover': 'SLOVAKIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_143':{
		'hover': 'SLOVENIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_144':{
		'hover': 'SOLOMON ISLANDS','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_145':{
		'hover': 'SOMALIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_146':{
		'hover': 'SOUTH AFRICA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_147':{
		'hover': 'SOUTH KOREA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_148':{
		'hover': 'SOUTH SUDAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_149':{
		'hover': 'SPAIN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_150':{
		'hover': 'SRI LANKA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_151':{
		'hover': 'SUDAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_152':{
		'hover': 'SURINAME','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_153':{
		'hover': 'SWAZILAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_154':{
		'hover': 'SWEDEN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_155':{
		'hover': 'SWITZERLAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_156':{
		'hover': 'SYRIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_157':{
		'hover': 'SÃO TOMÉ AND PRÍNCIPE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_158':{
		'hover': 'CHINA TAIWAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_159':{
		'hover': 'TAJIKISTAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_160':{
		'hover': 'TANZANIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_161':{
		'hover': 'THAILAND','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_162':{
		'hover': 'THE GAMBIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_163':{
		'hover': 'TIMOR-LESTE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_164':{
		'hover': 'TOGO','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_165':{
		'hover': 'TUNISIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_166':{
		'hover': 'TURKEY','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_167':{
		'hover': 'TURKMENISTAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_168':{
		'hover': 'UGANDA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_169':{
		'hover': 'UKRAINE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_170':{
		'hover': 'UNITED ARAB EMIRATES','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_171':{
		'hover': 'UNITED KINGDOM','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_172':{
		'hover': 'UNITED STATES<br><span style="color: yellow;">*Link each country to any webpage*</span>','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_173':{
		'hover': 'URUGUAY','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_174':{
		'hover': 'UZBEKISTAN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_175':{
		'hover': 'VENEZUELA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_176':{
		'hover': 'VIETNAM','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_177':{
		'hover': 'WESTERN SAHARA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_178':{
		'hover': 'YEMEN','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_179':{
		'hover': 'ZAMBIA','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
	'map_180':{
		'hover': 'ZIMBABWE','upColor':'#00B287','overColor':'#ffcc5f','downColor':'#477cb2','enable':true,
	},
}


	</script> 
<script type="text/javascript">
var pin_config = {
	'default':{		'pinShadow':'#000',		'pinShadowOpacity':'50',	},
	'points':[

	{
		'shape':'circle',
		'hover': 'hangzhou, China',
		'pos_X':820,
		'pos_Y':185,
		'diameter':12,
		'outline':'#FFCECE',
		'thickness':1,
		'upColor':'#FF0000',
		'overColor':'#FFEE88',
		'downColor':'#D15B2C',
		'enable':true,
	},
	{
		'shape':'circle',
		'hover': 'Canada',
		'pos_X':150,
		'pos_Y':85,
		'diameter':12,
		'outline':'#FFCECE',
		'thickness':1,
		'upColor':'#FF0000',
		'overColor':'#FFEE88',
		'downColor':'#D15B2C',
		'enable':true,
	}
	,
	{
		'shape':'circle',
		'hover': 'America',
		'pos_X':140,
		'pos_Y':145,
		'diameter':12,
		'outline':'#FFCECE',
		'thickness':1,
		'upColor':'#FF0000',
		'overColor':'#FFEE88',
		'downColor':'#D15B2C',
		'enable':true,
	},
	{
		'shape':'circle',
		'hover': 'Mexico',
		'pos_X':130,
		'pos_Y':205,
		'diameter':12,
		'outline':'#FFCECE',
		'thickness':1,
		'upColor':'#FF0000',
		'overColor':'#FFEE88',
		'downColor':'#D15B2C',
		'enable':true,
	}

	]
}

	</script>
	<div class="panel-footer"><span>©</span> 2016 Hewlett-Packard Enterprise Development Company, L.P.</div>
</body></html>