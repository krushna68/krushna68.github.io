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

						<hr>

						<div class="table-responsive">
							<table class="table table-striped">
								<tbody>

									<tr>
										<td>
											<strong><a href="{$BUY_LOGS_LINK}">{$BUY_LOGS_TITLE}</a></strong>
										</td>
										</td>
									</tr>
									<tr>
										<td>
											<strong><a href="{$PAYMENTS_LOGS_LINK}">{$PAYMENTS_LOGS_TITLE}</a></strong>
										</td>
										</td>
									</tr>
									<tr>
										<td>
											<strong><a href="{$TRANSFER_LOGS_LINK}">{$TRANSFER_LOGS_TITLE}</a></strong>
										</td>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
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
