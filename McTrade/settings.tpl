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
						<div class="col text-center">
							<div class="float-md">
								<a class="btn btn-primary btn-sm" href="{$PAY_PAL_LINK}">PayPal <i
										class="nav-icon fas fa-sliders-h"></i></a>
								<a class="btn btn-primary btn-sm" href="{$WEB_MONEY_LINK}">WebMoney <i
										class="nav-icon fas fa-sliders-h"></i></a>
								<a class="btn btn-primary btn-sm" href="{$ENOT_MONEY_LINK}">Enot <i
										class="nav-icon fas fa-sliders-h"></i></a>
								<a class="btn btn-primary btn-sm" href="{$FREEKASSA_MONEY_LINK}">FreeKassa <i
										class="nav-icon fas fa-sliders-h"></i></a>
							</div>
						</div>
						<hr>
						<div class="container-fluid">
							<form action="" method="post">
								<div class="form-group col">
									<label>{$USER_VALID_DESC}</label>
									<input type="hidden" name="token" value="{$TOKEN}">
									<input type="hidden" name="user_validation" {if $VALIDATION_VALUE===1} value="0"
									{else} value="1"
										{/if}>
									<input type="submit" {if $VALIDATION_VALUE===1} class="btn btn-success btn-sm float-right"
										value="{$ENABLED}" {else} class="btn btn-danger btn-sm float-right" value="{$DISABLED}"
										{/if}>
									<input type="button" data-toggle="modal" data-target="#myModal"
										class="btn btn-warning btn-sm float-right mr-3" value="Generate plugin config">
								</div>
							</form>
							<hr>
							<form action="" method="post">
								<div class="input-group">
									<div class="form-group col">
										<label>{$CURRENCY_LABEL}:</label>
									</div>
									<div class="form-group col-2">
										<input class="form-control form-control-sm" type="text" name="currency" value="{$CURRENCY}"
											placeholder="{$CURRENCY_LABEL} USD or $ or Custom">
									</div>
									<div class="form-group col">
										<input type="hidden" name="token" value="{$TOKEN}">
										<input type="submit" class="btn btn-success btn-sm float-right" value="{$SAVE}">
									</div>
								</div>
							</form>
							<hr>
							<form action="" method="post">
								<p class="text-center h5 font-weight-bold">{$LINK_SETTING}</p>
								<div class="input-group input-group-sm">
									<div class="form-group col">
										<label for="link_location">{$LINK_LOCATION_LABEL}</label>
										<select class="form-control form-control-sm" name="link_location" id="link_location">
											<option {if $LINK_LOCATION=='top' } selected {/if} value="top">top</option>
											<option {if $LINK_LOCATION=='footer' } selected {/if} value="footer">footer</option>
											<option {if $LINK_LOCATION=='dropdown' } selected {/if} value="dropdown">dropdown</option>
											<option {if $LINK_LOCATION=='no_location' } selected {/if} value="no_location">no location
											</option>
										</select>
									</div>
									<div class="form-group col">
										<label for="link_order">{$LINK_ORDER_LABEL}</label>
										<input class="form-control form-control-sm" type="number" name="link_order" id="link_order"
											value="{$LINK_ORDER}">
									</div>
									<div class="form-group col">
										<label for="link_icon">{$LINK_ICON_LABEL}</label>
										<input class="form-control form-control-sm" type="text" name="link_icon" id="link_icon"
											value="{$LINK_ICON}">
									</div>
									<div class="form-group col">
										<input type="hidden" name="link_conf" value="link_conf">
										<input type="hidden" name="token" value="{$TOKEN}">
										<input type="submit" class="btn btn-success btn-sm float-right" value="{$SAVE}">
									</div>
								</div>
							</form>
							<hr>


						</div>

					</section>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									{$CONFIG}
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
</body>

</html>
