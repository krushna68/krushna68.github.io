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

					<div class="content">
						<div class="row">
							<div class="container">


								<div class="float-md-right">
									<a style="display:inline" href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
								</div>


							</div>
						</div>
					</div>

					<hr>

					{if isset($SUCCESS)}
						<div class="alert alert-success alert-dismissible">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h5><i class="icon fa fa-check"></i> {$SUCCESS_TITLE}</h5>
							{$SUCCESS}
						</div>
					{/if}


					<section class="content">
						<div class="container-fluid">
							<h5 class="text-center">{$GALLERY_SETTINGS}</h5>




							<form action="" method="post">
								<div class="form-group">
									<label>{$GALLERY_ICON}</label>
									<input type="text" name="gal_icon" class="form-control" value="{$ICON}">
								</div>
								<div class="form-group">
									<label>{$GALLERY_LOCATION}</label>
									<select class="form-control mr-sm-2" name="gal_location">

										<option {if $LINK_LOCATION === 1} selected {/if} value="1">TOP</option>
										<option {if $LINK_LOCATION === 2} selected {/if} value="2">FOOTER</option>
										<option {if $LINK_LOCATION === 3} selected {/if} value="3">More Dropdown</option>
										<option {if $LINK_LOCATION === 4} selected {/if} value="4">NO LOCATION</option>

									</select>
								</div>

								<div class="form-group">
									<label>{$GALLERY_PAGINATION}</label>
									<input type="text" name="gal_pagination" class="form-control" value="{$PAGINATION}">
								</div>

								<div class="form-group">
									<label>{$SORT}</label>
									<select class="form-control mr-sm-2" name="gal_sort">

										<option {if $SORT_VAR === 1} selected {/if} value="1">{$DESC}</option>
										<option {if $SORT_VAR === 2} selected {/if} value="2">{$ASC}</option>

									</select>
								</div>

								<div class="form-group">
									<label>{$GALLERY_ORDER}</label>
									<input type="text" name="gal_order" class="form-control" value="{$ORDER}">
								</div>
								<div class="form-group">
									<input type="hidden" name="token" value="{$TOKEN}">
									<input type="submit" class="btn btn-primary" value="{$SAVE}">
								</div>
							</form>




						</div>

					</section>



				</div>

			</div>



		</div>
	</div>

	<!-- ./wrapper -->

	{include file='scripts.tpl'}


</body>

</html>
