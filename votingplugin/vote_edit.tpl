{include file='header.tpl'}
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    {include file='navbar.tpl'}
    {include file='sidebar.tpl'}

	<div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">{$VOTE}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$VOTE}</li>
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
                      <h5 style="display:inline">{$EDIT_SITE}</h5>
                      <div class="float-md-right">
                          <a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
                      </div>
                      <hr />

                      <!-- Success and Error Alerts -->
                      {include file='includes/alerts.tpl'}

                      <form action="" method="post">
                          <div class="form-group">
                              <label for="InputVoteName">{$VOTE_SITE_NAME}</label>
                              <input type="text" id="InputVoteName" placeholder="{$VOTE_SITE_NAME}" name="vote_site_name" class="form-control" value="{$VOTE_SITE_NAME_VALUE}">
                          </div>
                          <div class="form-group">
                              <label for="InputVoteURL">{$VOTE_SITE_URL}</label>
                              <input type="text" id="InputVoteURL" placeholder="{$VOTE_SITE_URL}" name="vote_site_url" class="form-control" value="{$VOTE_SITE_URL_VALUE}">
                          </div>
                          <div class="form-group">
                              <input type="hidden" name="token" value="{$TOKEN}">
                              <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                          </div>
                      </form>

                  </div>
              </div>
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
