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


						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0 text-dark">{$TITLE}</h1>
							</div>
						</div>
					</div>

					<section class="content">
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
						<div class="float-md">
							<button class="btn btn-primary" type="button" onclick="showAddModal()">{$ADD_NEW_SERVER} <i
									class="fa fa-plus-circle">
								</i></button>
						</div>
						<hr>
						{if count($SERVER_LIST)}
							<div class="table-responsive">
								<table class="table table-striped">
									<tbody>
										{foreach from=$SERVER_LIST item=server}
											<tr>
												<td>
													<strong><a href="{$server.send_rcon_link}">{$server.server_name}</strong>
												</td>
												<td>
													<div class="float-md-right">
														<a class="btn btn-warning btn-sm" href="{$server.edit_link}"><i
																class="fas fa-edit fa-fw"></i></a>
														<button class="btn btn-danger btn-sm" type="button"
															onclick="showDeleteModal('{$server.delete_link}')"><i class="fas fa-trash fa-fw"></i></button>
													</div>
												</td>
											</tr>
										{/foreach}
									</tbody>
								</table>
							</div>
						{else}
							{$NO_SERVER}
						{/if}
					</section>


					<!-- Modal Form -->

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
									{$CONFIRM_DELETE}
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
									<a href="#" id="deleteServer" class="btn btn-primary">{$YES}</a>
								</div>
							</div>
						</div>
					</div>


					<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">{$ADD_NEW_SERVER}</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="" method="post">
										<div class="form-group">
											<label for="ServerName">{$SERVER_NAME}</label>
											<input type="text" id="ServerName" name="server_name" class="form-control">
										</div>
										<div class="form-group">
											<label for="ServerIP">{$SERVER_IP}</label>
											<input type="text" id="ServerIP" name="server_ip" class="form-control">
										</div>
										<div class="form-group">
											<label for="ServerPort">{$SERVER_PORT}</label>
											<input type="text" id="ServerPort" name="server_port" class="form-control">
										</div>
										<div class="form-group">
											<label for="ServerPass">{$SERVER_PASS}</label>
											<input type="password" id="ServerPass" name="server_pass" class="form-control">
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


					<!-- Begin Page Content -->
				</div>
				<!-- Main content -->
			</div>
			<!-- Content Wrapper -->
		</div>
		<!-- Wrapper -->
	</div>

	{include file='scripts.tpl'}

	<script type="text/javascript">
		function showDeleteModal(id) {
			$('#deleteServer').attr('href', id);
			$('#deleteModal').modal().show();
		}
	</script>

	<script type="text/javascript">
		function showAddModal() {
			$('#addServer').attr('href');
			$('#addModal').modal().show();
		}
	</script>

</body>

</html>
