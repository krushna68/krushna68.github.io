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
						<div class="float-md-right">
							<a style="display:inline" href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
						</div>
						<form action="" method="post">
							<div class="form-group">
								<label for="enabled">{$ENABLED_LABEL}</label>
								<select class="form-control" name="enabled">
									<option {if $ENABLED===1} selected {/if} value="1">true</option>
									<option {if $ENABLED!=1} selected {/if} value="0">false</option>
								</select>
							</div>
							<div class="form-group">
								<label for="product_desc">{$PRODUCT_LABEL}</label>
								<input type="text" id="product_desc" name="product_desc" class="form-control" value="{$PRODUCT_DESC}">
							</div>
							<div class="form-group">
								<label for="merchant"><a href="https://merchant.webmoney.ru/conf/purses.asp"
										target="_blank">{$WEBMONEY_MERCHANT}</a></label>
								<input type="text" id="merchant" name="merchant" class="form-control" value="{$MERCHANT}"
									placeholder="R807763647073">
							</div>
							<div class="form-group">
								<label for="secret_key">{$SECRET_KEY_LABEL}</label>
								<input type="text" id="secret_key" name="secret_key" class="form-control" value="{$SECRET_KEY}">
							</div>
							<div class="form-group">
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
							</div>
						</form>


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
