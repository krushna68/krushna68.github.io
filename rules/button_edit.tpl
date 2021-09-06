{include file='header.tpl'}
<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        {include file='navbar.tpl'} {include file='sidebar.tpl'}
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">{$RULES}</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                <li class="breadcrumb-item active">{$RULES}</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Main content -->
            <section class="content">
              <div class="container-fluid">

                  <!-- Update Notification -->
                  {include file='includes/update.tpl'}
                  <div class="card shadow mb-4">
                      <div class="card-body">
                          <h5 style="display:inline">{$EDIT_BUTTON}</h5>
                          <div class="float-md-right"><a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a></div>
                          <hr />
                          <!-- Success and Error Alerts -->
                          {include file='includes/alerts.tpl'}
                          <form action="" method="post">
                              <div class="form-group">
                                  <label for="InputButtonName">{$RULES_BUTTON_NAME}</label>
                                  <input type="text" id="InputButtonName" placeholder="{$RULES_BUTTON_NAME}"
                                      name="rules_button_name" class="form-control"
                                      value="{$RULES_BUTTON_NAME_VALUE}">
                              </div>
                              <div class="form-group">
                                  <label for="InputButtonLink">{$RULES_BUTTON_LINK}</label>
                                  <input type="text" id="InputButtonLink" placeholder="{$RULES_BUTTON_LINK}"
                                      name="rules_button_link" class="form-control"
                                      value="{$RULES_BUTTON_LINK_VALUE}">
                              </div>
                              <div class="form-group">
                                  <input type="hidden" name="token" value="{$TOKEN}">
                                  <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                              </div>
                          </form>
                      </div>
                  </div>

                    </div>
            </section>
            </div>

        </div>
        <!-- ./wrapper -->
        {include file='scripts.tpl'}
</body>
</html>
