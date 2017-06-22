
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
                
                <form method='post'>
                  <input type="text" name="roomName" placeholder="roomName" />
                  <input type="text" name="description" placeholder="description" />
                  <select name="floor">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                    </select>
                  <input type="text" name="building" placeholder="building" />
                  Available : <input type="radio" name="isAvailable" value="true" />
                  Not Available : <input type="radio" name="isAvailable" value="name" />
                  <input type="submit" />
                </form>
                <hr/>
                
                <form method='post'>
                  <input type="text" name="roomId" placeholder="roomId" type="number" />
                  <input type="text" name="roomName" placeholder="roomName" />
                  <input type="text" name="description" placeholder="description" />
                  <select name="floor">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                    </select>
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