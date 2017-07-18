	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:set var="resPath" value="${pageContext.request.contextPath}/resources" />
	<script src="${resPath}/fullcalendar/moment.min.js"></script>
	<script src="${resPath}/app/report.js"></script>
  <div class="main">
    <div class="main-inner">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="widget">
              <div class="widget-header"> <i class="icon-bar-chart"></i>
                <h3> Report</h3>
              </div>
              <!-- /widget-header -->
              <div class="widget-content">
                 <!--TODO Content-->
                 <ul class="nav nav-tabs">
                 	<li class="active"><a href="#tab-report-prop" data-toggle="tab">Properties</a></li>
                 	<li><a href="#tab-report-attr" data-toggle="tab">Report Attributes</a></li>
                 </ul>
                 <div class="tab-content">
                 	<div class="tab-pane fade in active" id="tab-report-prop">1</div>
                 	<div class="tab-pane fade" id="tab-report-attr">
						<table>
                 					<tbody>
                 						<tr>
                 							<td>All : <input type="checkbox" id="chkbox-report-attr-mode-total"/></td>
                 							<td>Custom : <input type="checkbox" id="chkbox-report-attr-mode-custom"/></td>
                 						</tr>
                 						<tr>
                 							<td></td>
                 							<td></td>
                 						</tr>
                 						<tr>
                 							<td></td>
                 							<td></td>
                 						</tr>
                 						<tr>
                 							<td></td>
                 							<td></td>
                 						</tr>
                 					</tbody>
                 				</table>
                 	</div>
                 </div>
              </div>
              <!-- /widget-content -->
            </div>
            <!-- /widget -->
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /main-inner -->
  </div>
  <!-- /main -->