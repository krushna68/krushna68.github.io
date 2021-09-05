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
								<h5 class="m-0 text-dark">{$EDIT_USER} <a href="{$PROFILE_LINK}"> {$USERNAME}</a></h1>
							</div>
						</div>
					</div>

					<!-- Main content -->
					<section class="content">
						<div class="float-md-right">
							<a style="display:inline" href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
						</div>

						<br>
						<hr>


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

						<form action="" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="Name">{$NAME}</label>
								<input type="text" id="Name" name="trade_name" class="form-control" value="{$USERNAME}">
							</div>
							<div class="form-group">
								<label for="Bal">{$BALANCE}</label>
								<input type="text" id="Bal" name="trade_bal" class="form-control" value="{$USER_BAL}">
							</div>

							<div class="form-group">
								<label for="Site_id">{$SITE_ID}</label>
								<input type="text" id="Site_id" name="site_id" class="form-control" value="{$USER_SITE_ID}">
							</div>


							{if isset($USER_VALIDATION)}
								<div class="form-group">
									<label for="validation">{$VALIDATION}</label>
									<select class="form-control mr-sm-2" id="validation" name="validation">
										<option {if $USER_VALIDATION==0} selected {/if} value="0">false</option>
										<option {if $USER_VALIDATION==1} selected {/if} value="1">true</option>

									</select>
								</div>
							{/if}

							<div class="form-group">
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="submit" class="btn btn-primary" value="{$SAVE}">
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

	<script>
		function selectType(value) {
			if (value == 2) {
				document.getElementById('economy_value_div').className = "form-group";
			} else {
				document.getElementById('economy_value_div').className = "d-none";
				document.getElementById('economy_value').value = 0;
			}
		}
	</script>

	{include file='scripts.tpl'}
