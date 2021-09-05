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


						<div class="row">
							<div class="container-fluid">
								<div class="float-right">
									<a style="display:inline" href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
								</div>
							</div>
						</div>

						<hr>
						{if count($TRADE_BUY_LOGS)}
							<div class="table-responsive">
								<table class="table table-striped">
									<tbody>
										<td>
											<strong>{$BUY_USER}</strong>
										</td>
										<td>
											<strong>{$BUY_PRODUCT}</strong>
										</td>
										<td>
											<strong>{$BUY_STATUS}</strong>
										</td>
										<td>
											<strong>{$BUY_ERRORS}</strong>
										</td>
										<td>
											<strong>{$DATETIME}</strong>
										</td>

										<td>
											<div class="float-md-right">
												<strong>{$ACTIONS}</strong>
											</div>
										</td>

										{foreach from=$TRADE_BUY_LOGS item=log}
											<tr>
												<td>
													<strong>{$N}.<a href="{$log.edit_user_link}"> {$log.user_id}</a></strong>
												</td>
												<td>
													<strong>{$log.product_id}</strong>
												</td>
												<td>
													<strong>{if $log.status == 1}Completed{else}Error{/if}</strong>
												</td>
												<td>
													<strong>{$log.errors}</strong>
												</td>
												<td>
													<strong>{$log.datetime}</strong>
												</td>

												<td>
													<div class="float-md-right">
														<a class="btn btn-warning btn-sm" href="{$log.edit_user_link}"><i
																class="fas fa-edit fa-fw"></i></a>

												</td>
											</tr>
											<div class="d-none">{$N++}</div>
										{/foreach}
									</tbody>
								</table>
							</div>
						{else}
							{$NO_LOGS}
						{/if}
					</section>





					<!-- Begin Page Content -->
				</div>
				<!-- Main content -->
			</div>
			<!-- Content Wrapper -->
		</div>
		<!-- Wrapper -->
	</div>

	{include file='scripts.tpl'}

</body>

</html>
