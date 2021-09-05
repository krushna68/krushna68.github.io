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
                        <h1 class="m-0 text-dark">{$SUGGESTIONS}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item">{$SUGGESTIONS}</li>
							<li class="breadcrumb-item active">{$STATUSES}</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
				{if isset($NEW_UPDATE)}
                {if $NEW_UPDATE_URGENT eq true}
                <div class="alert alert-danger">
                    {else}
                    <div class="alert alert-primary alert-dismissible" id="updateAlert">
                        <button type="button" class="close" id="closeUpdate" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    {/if}
                    {$NEW_UPDATE}
                    <br />
                    <a href="{$UPDATE_LINK}" class="btn btn-primary" style="text-decoration:none">{$UPDATE}</a>
                    <hr />
                    {$CURRENT_VERSION}<br />
                    {$NEW_VERSION}
                </div>
                {/if}
              <div class="card">
                <div class="card-body">
                    <h5 style="display:inline">{$CREATING_NEW_STATUS}</h5>
                    <div class="float-md-right">
							<a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
                        </div>
                    <hr />

                    {if isset($SUCCESS)}
                      <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <h5><i class="icon fa fa-check"></i> {$SUCCESS_TITLE}</h5>
                        {$SUCCESS}
                      </div>
                    {/if}

                    {if isset($ERRORS) && count($ERRORS)}
                      <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <h5><i class="icon fas fa-exclamation-triangle"></i> {$ERRORS_TITLE}</h5>
                        <ul>
                          {foreach from=$ERRORS item=error}
                             <li>{$error}</li>
                          {/foreach}
                        </ul>
                      </div>
                    {/if}

                    <form action="" method="post">
						<div class="form-group">
							<label for="InputName">{$STATUS_NAME}</label>
							<input type="text" name="name" class="form-control" id="InputName" placeholder="{$STATUS_NAME}">
						</div>
						<div class="form-group">
							<label for="InputHtml">{$STATUS_HTML}</label>
							<input type="text" name="html" class="form-control" id="InputHtml" placeholder="{$STATUS_HTML}">
						</div>
						<div class="form-group">
							<label for="inputOpen">{$MARKED_AS_OPEN}</label>
							<input id="inputOpen" name="open" type="checkbox" class="js-switch" />
						</div>
						<div class="form-group">
							<input type="hidden" name="token" value="{$TOKEN}">
							<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
						</div>
                    </form>
                </div>
              </div>

              <!-- Spacing -->
              <div style="height:1rem;"></div>

            </div>
        </section>
    </div>

</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

</body>
</html>
