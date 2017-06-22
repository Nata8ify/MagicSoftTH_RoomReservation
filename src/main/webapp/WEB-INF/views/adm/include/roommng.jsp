<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main">
    <div class="main-inner">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="widget">
              <div class="widget-header"> <i class="icon-pencil"></i>
                <h3> Room Management</h3>
              </div>
              <!-- /widget-header -->
              <div class="widget-content">
                
                <form:form modelAttribute="formObj" method='post' action="addroom">
                  <form:input path="roomCode" type="text" placeholder="roomCode"  />
                  <form:input path="roomName" type="text" placeholder="roomName"  />
                  <form:input path="description" type="text" placeholder="description" />
                  <form:input path="floor" type="number" placeholder="floor" />
                  <form:input path="building" type="text" placeholder="building" />
                  Available? : <form:checkbox path="isAvailable"/><br/>
                  <input type="submit" />
                </form:form>
                <hr/>
                
                <form method='post'>
                  <input type="text" name="roomId" placeholder="roomId" type="number" />
                  <input type="text" name="roomName" placeholder="roomName" />
                  <input type="text" name="description" placeholder="description" />
                   <input type="number" name="floor" placeholder="floor" />
                  <input type="text" name="building" placeholder="building" />
                  Available : <input type="radio" name="isAvailable" value="true" />
                  Not Available : <input type="radio" name="isAvailable" value="name" />
                  <input type="submit" />
                </form>
                <hr/>
                <form method='post'>
                  <input type="text" name="roomId" placeholder="roomId" type="number" />
                  <input type="submit"  value="delete" />
                </form>
                <hr/>
                --Better DataTable Here
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