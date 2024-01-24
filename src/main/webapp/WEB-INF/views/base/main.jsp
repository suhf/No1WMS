<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		
		<div class="row">
			<div class="col-md-5">
				<div>첫 번째 공간</div>
			</div>

			<div class="col-md-5">
				<div class="text-center"><h2><b>No.1 WMS 달력</b></h2></div>
				<div id='calendar'></div>
				<div id='popup' style="width: 500px; height: 600px; display: none; background-color: white; padding: 20px; border-radius: 14px; border: 2px solid #eeeeee"></div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-md-5">
				<!-- 세 번째 공간 -->
				<div>세 번째 공간</div>
			</div>

			<div class="col-md-5">
				<!-- 네 번째 공간 -->
				<div>네 번째 공간</div>
			</div>
		</div>
	</div>





	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href='/resources/static/css/fullcalendar.main.min.css' rel='stylesheet' />
	<script src='/resources/static/js/ko.js'></script>
	<script src='/resources/static/js/fullcalendar.main.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			  locale: "ko",
			  initialView: 'dayGridMonth',
			  headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			  },
			  googleCalendarApiKey: 'AIzaSyBKWDNnFEMpuNCPubU3pkkmB1F6XLX_bSo',
			  events: {
			  googleCalendarId: '7a3e7ae86281b8e995e4db0402865fb947ceb73c7d633f3a629a0068ac0ca66c@group.calendar.google.com',
			  className: 'gcal-event' // an option!
			  },
			  eventClick: function(info) {
				  let start_year = info.event.start.getUTCFullYear();
				  let start_month = info.event.start.getMonth() + 1;
				  let start_date = info.event.start.getUTCDate();
				  let start_hour = info.event.start.getHours();
				  let start_minute = info.event.start.getMinutes();
				  let start_second = info.event.start.getSeconds();
				  let end_hour = info.event.end.getHours();

				  let start = start_year + "-" + start_month + "-" + start_date + " " + start_hour + "시 ~ " + end_hour + "시";
					console.log(start);
				  let attends = "";
				  info.event.extendedProps.attachments.forEach(function(item) {
					  attends += "<div><a href='"+item.fileUrl+"' target='_blank'>[첨부파일]</a></div>"
				  });

				  if(!info.event.extendedProps.description) {
					  info.event.extendedProps.description = "";
				  }
				  let contents = "<div style='font-weight:bold; font-size:20px; margin-bottom:30px; text-align:center'>" +
					start +
					"</div>" +
					"<div style='font-size:18px; margin-bottom:20px'>" +
					"제목: " + info.event.title +
					"</div>" +
					"<div style='width:500px'>" +
					info.event.extendedProps.description +
					attends +
					"</div>";
				  
				  $("#popup").html(contents);
				  $("#popup").bPopup({
					speed: 500,
					transition: 'slideIn',
					transitionClose: 'slideBack',
					position: [($(document).width()-500)/2, 30] //x, y
				  });
				  info.jsEvent.stopPropagation();
				  info.jsEvent.preventDefault();
			  }
		});
		calendar.render();
	});
	</script>
</body>
</html>