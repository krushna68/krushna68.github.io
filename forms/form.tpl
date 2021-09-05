{include file='header.tpl'}

<body class="hold-transition sidebar-mini">

<!-- Wrapper -->
<div class="wrapper">
    {include file='navbar.tpl'}
    <!-- Sidebar -->
    {include file='sidebar.tpl'}

    <!-- Content Wrapper -->
    <div class="content-wrapper">

        <!-- Main content -->
        <div class="content">

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">{$FORMS}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$FORMS}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">
                        <h5 style="display:inline">{$EDITING_FORM}</h5>
                        <div class="float-md-right">
							<a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
                        </div>
						<hr>

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

						<form role="form" action="" method="post">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="InputName">{$FORM_NAME}</label>
										<input type="text" name="form_name" class="form-control" id="InputName" placeholder="{$FORM_NAME}" value="{$FORM_NAME_VALUE}">
									</div>
									<div class="form-group">
										<label for="InputUrl">{$FORM_URL}</label>
										<input type="text" name="form_url" class="form-control" id="InputURL" placeholder="{$FORM_URL}" value="{$FORM_URL_VALUE}">
									</div>
									<div class="form-group">
										<label for="Inputguest">{$ALLOW_GUESTS}</label> <span class="badge badge-info"><i class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$ALLOW_GUESTS_HELP}"></i></span>
										<input id="inputguest" name="guest" type="checkbox" class="js-switch"{if $ALLOW_GUESTS_VALUE eq 1} checked{/if} />
									</div>
                                    <div class="form-group">
										<label for="InputCaptcha">{$ENABLE_CAPTCHA}</label>
										<input id="inputCaptcha" name="captcha" type="checkbox" class="js-switch"{if $ENABLE_CAPTCHA_VALUE eq 1} checked{/if} />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="InputUrl">{$FORM_ICON}</label>
										<input type="text" name="form_icon" class="form-control" id="InputIcon" placeholder="{$FORM_ICON}" value="{$FORM_ICON_VALUE}">
									</div>
									<div class="form-group">
										<label for="link_location">{$FORM_LINK_LOCATION}</label>
										<select class="form-control" id="link_location" name="link_location">
											<option value="1"{if $LINK_LOCATION_VALUE eq 1} selected{/if}>{$LINK_NAVBAR}</option>
											<option value="2"{if $LINK_LOCATION_VALUE eq 2} selected{/if}>{$LINK_MORE}</option>
											<option value="3"{if $LINK_LOCATION_VALUE eq 3} selected{/if}>{$LINK_FOOTER}</option>
											<option value="4"{if $LINK_LOCATION_VALUE eq 4} selected{/if}>{$LINK_NONE}</option>
										</select>
									</div>
									<div class="form-group">
										<label for="Inputguest">{$CAN_USER_VIEW}</label> <span class="badge badge-info"><i class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$CAN_USER_VIEW_HELP}"></i></span>
										<input id="inputcan_view" name="can_view" type="checkbox" class="js-switch"{if $CAN_USER_VIEW_VALUE eq 1} checked{/if} />
									</div>
								</div>
							</div>
							<div class="form-group">
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
							</div>
						</form>

						</br>

                        <h5 style="display:inline">{$FIELDS}</h5>
                        <div class="float-md-right">
							<a href="{$NEW_FIELD_LINK}" class="btn btn-primary">{$NEW_FIELD}</a>
                        </div>
						<hr>
						{if count($FIELDS_LIST)}
							{foreach from=$FIELDS_LIST item=field}
							<div class="row">
								<div class="col-md-4">
									<a href="{$field.edit_link}">{$field.name}</a>
								</div>
								<div class="col-md-4">
									{$field.type}
								</div>
								<div class="col-md-4">
                                    <div class="float-md-right">
                                        <a class="btn btn-warning btn-sm" href="{$field.edit_link}"><i class="fas fa-edit fa-fw"></i></a>
                                        <button class="btn btn-danger btn-sm" type="button" onclick="showDeleteModal('{$field.delete_link}')"><i class="fas fa-trash fa-fw"></i></button>
                                    </div>
								</div>
							</div>
							<hr>
							{/foreach}
                        {else}
                            {$NONE_FIELDS_DEFINED}
                        {/if}

                        <center><p>Forms Module by <a href="https://partydragen.com/" target="_blank">Partydragen</a></p></center>
                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

                <!-- End Page Content -->
            </div>

            <!-- End Main Content -->
        </div>

        <!-- End Content Wrapper -->
    </div>

    <!-- End Wrapper -->
</div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_DELETE_FIELD}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="#" id="deleteLink" class="btn btn-primary">{$YES}</a>
                </div>
            </div>
        </div>
    </div>

{include file='scripts.tpl'}

<script type="text/javascript">
    function showDeleteModal(id){
        $('#deleteLink').attr('href', id);
        $('#deleteModal').modal().show();
    }
</script>

</body>
</html>
