<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="./include/header.jsp" %>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f3607534cf9328aa1671a84fac9ab56"></script>
	<style type="text/css">
		.dx-datagrid .dx-data-row > td.bullet {
		    padding-top: 0;
		    padding-bottom: 0;
		}
	</style>
	<script>
		$(function() {
		    $("#gridContainer").dxDataGrid({
		        dataSource: {
		            store: {
		                type: "odata",
		                url: "https://js.devexpress.com/Demos/SalesViewer/odata/DaySaleDtoes",
		                beforeSend: function(request) {
		                    request.params.startDate = "2018-05-10";
		                    request.params.endDate = "2018-05-15";
		                }
		            }
		        },
		        paging: {
		            pageSize: 10
		        },
		        pager: {
		            showPageSizeSelector: true,
		            allowedPageSizes: [10, 25, 50, 100]
		        },
		        remoteOperations: false,
		        searchPanel: {
		            visible: true,
		            highlightCaseSensitive: true
		        },
		        groupPanel: { visible: true },
		        grouping: {
		            autoExpandAll: false
		        },
		        allowColumnReordering: true,
		        rowAlternationEnabled: true,
		        showBorders: true,
		        columns: [
		            {
		                dataField: "Product",
		                groupIndex: 0
		            },
		            {
		                dataField: "Amount",
		                caption: "Sale Amount",
		                dataType: "number",
		                format: "currency",
		                alignment: "right",
		            },
		            {
		                dataField: "Discount",
		                caption: "Discount %",
		                dataType: "number",
		                format: "percent",
		                alignment: "right",
		                allowGrouping: false,
		                cellTemplate: discountCellTemplate,
		                cssClass: "bullet"
		            },
		            {
		                dataField: "SaleDate",
		                dataType: "date"
		            },
		            {
		                dataField: "Region",
		                dataType: "string"
		            },
		            {
		                dataField: "Sector",
		                dataType: "string",
		            },
		            {
		                dataField: "Channel",
		                dataType: "string",
		            },
		            {
		                dataField: "Customer",
		                dataType: "string",
		                width: 150
		            }
		        ],
		        onContentReady: function(e) {
		            if(!collapsed) {
		                collapsed = true;
		                e.component.expandRow(["EnviroCare"]);
		            }
		        }
		    });
		});
	
		var discountCellTemplate = function(container, options) {
		    $("<div/>").dxBullet({
		        onIncidentOccurred: null,
		        size: {
		            width: 150,
		            height: 35
		        },
		        margin: {
		            top: 5,
		            bottom: 0,
		            left: 5
		        },
		        showTarget: false,
		        showZeroLevel: true,
		        value: options.value * 100,
		        startScaleValue: 0,
		        endScaleValue: 100,
		        tooltip: {
		            enabled: true,
		            font: {
		                size: 18
		            },
		            paddingTopBottom: 2,
		            customizeTooltip: function() {
		                return { text: options.text };
		            },
		            zIndex: 5
		        }
		    }).appendTo(container);
		};
	
		var collapsed = false;
	</script>
	
</head>
<body>
<c:if test="${sessionScope.userId != null || sessionScope.adminId == null}">
	<%@ include file="./include/menu.jsp" %>
</c:if>
<c:if test="${sessionScope.adminId != null}">
	<%@ include file="./include/admin_menu.jsp" %>
</c:if>
	<h1>
		Hello world!
	</h1>

	<P>  The time on the server is ${serverTime}. </P>
	<div class="dx-viewport demo-container">
        <div id="gridContainer"></div>
    </div>
    
    <!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:100%;height:350px;"></div>
	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	</script>
</body>
</html>
