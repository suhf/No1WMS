<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="container-fluid">

    <div class="row">
        <div class="col-md-6 ">
        <br>
            <div class="col text-center"><img alt="Default Image" src="/resources/static/img/mainpage/2.png" width="550px" /></div>
        </div>

        <div class="col-md-5">
            <div class="text-center"><h2><b>No.1 WMS 달력</b></h2></div>
            <div id='calendar'></div>
            <div id='popup'
                 style="width: 500px; height: 600px; display: none; background-color: white; padding: 20px; border-radius: 14px; border: 2px solid #eeeeee"></div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-6">
            <!-- 세 번째 공간 -->
            <div>
                <div class=" text-center">
                    <h5>부족한 재고</h5>
                </div>
                <table class="table">
                    <thead class="table-dark">
                    <tr>
                        <th>번호</th>
                        <th>제품명</th>
                        <th>카테고리</th>
                        <th>재고수</th>
                        <th>창고</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${slist2 }" var="dto" varStatus="status">
                        <tr class="detailTr col-5" data-id="${dto.id}" style="font-size: small;">
                            <td class="col-1">${status.count }</td>
                            <td class="col-1">${dto.productName }</td>
                            <td class="col-1">${dto.cls_nm_4 }</td>
                            <td class="col-1">${dto.quantity }</td>
                            <td class="col-1">${dto.warehouseName}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-md-6">
            
            <!--네 번째 공간 -->
            <div>
                <div class=" text-center">
                    <h5>오늘의 입고</h5>
                </div>
                <table class="table">
                    <thead class="table-dark">
                    <tr>
                        <th>번호</th>
                        <th>제품명</th>
                        <th>입고예정그룹번호</th>
                        <th>수량</th>
                        <th>창고</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${inDto }" var="dto" varStatus="status">
                        <tr class="detailTr2 col-5" data-id="${dto.id}" style="font-size: small;" >
                            <td class="col-1">${status.count }</td>
                            <td class="col-1">${dto.productDto.name }</td>
                            <c:if test="${not empty dto.planInDto.viewGroupNumber}">
							    <td class="col-1">${dto.planInDto.viewGroupNumber}</td>
							</c:if>
							<c:if test="${empty dto.planInDto.viewGroupNumber}">
							    <td class="col-1"></td>
							</c:if>
                            <td class="col-1">${dto.quantity }</td>
                            <td class="col-1">${dto.warehouseDto.name}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
	        
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href='/resources/static/css/fullcalendar.main.min.css' rel='stylesheet'/>
<script src='/resources/static/js/ko.js'></script>
<script src='/resources/static/js/fullcalendar.main.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: "ko",
            initialView: 'dayGridMonth',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
            },
            googleCalendarApiKey: '',
            events: {
                googleCalendarId: '@group.calendar.google.com',
                className: 'gcal-event' // an option!
            },
            eventClick: function (info) {
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
                info.event.extendedProps.attachments.forEach(function (item) {
                    attends += "<div><a href='" + item.fileUrl + "' target='_blank'>[첨부파일]</a></div>"
                });

                if (!info.event.extendedProps.description) {
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
                    position: [($(document).width() - 500) / 2, 30] //x, y
                });
                info.jsEvent.stopPropagation();
                info.jsEvent.preventDefault();
            }
        });
        calendar.render();
    });

    $(document).ready(function () {
        $("body").on("click", ".detailTr", function () {
            var id = $(this).data("id");

            var form = document.createElement("form");
            form.action = "/stock/read";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();

        });
        $("body").on("click", ".detailTr2", function () {
            var id = $(this).data("id");

            var form = document.createElement("form");
            form.action = "/in/read";
            form.method = "POST";
            document.body.appendChild(form);

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "id";
            input.value = id;
            form.appendChild(input);

            form.submit();

        });
    });
</script>
</body>
</html>
