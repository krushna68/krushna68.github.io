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

								<div class="float-md-left mr-sm-2">
									<a style="display:inline" href="{$ADD_IMG_LINK}" class="btn btn-primary">{$ADD_IMAGES}</a>
								</div>
								<div class="float-md-left mr-sm-2">
									<a style="display:inline" href="{$ADD_CATEGORY_LINK}" class="btn btn-primary">{$CATEGORY_SETTINGS}</a>
								</div>
								<div class="float-md-left mr-sm-2">
									<a style="display:inline" href="{$GALLERY_SETTINGS_LINK}"
										class="btn btn-primary">{$GALLERY_SETTINGS}</a>
								</div>
								<div class="float-md-left mr-sm-2">
									<a style="display:inline" href="{$CAROUSEL_SETINGS_LINK}"
										class="btn btn-primary">{$CAROUSEL_SETINGS}</a>
								</div>
								{if $UPDATE_MOD === 1}
									<div class="float-md-left mr-sm-2">
										<a style="display:inline" href="{$UPDATE_LINK}" class="btn btn-warning" title="Click to update">UPDATE
											MODULE</a>
									</div>
								{else}
									<div class="float-md-left mr-sm-2">
										<a style="display:inline" href="{$UPDATE_LINK}" class="btn btn-primary"
											title="No update required">UPDATE MODULE</a>
									</div>
								{/if}

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
							<h5 class="text-center">{$ALL_IMAGES}</h5>
							<div class="row">


								{foreach from=$IMAGES_LIST item=image}
									<div class="col-lg-1 col-md-4 col-xs-6 thumb">
										<a class="thumbnail" href="{$image.edit_link}">
											<img class="img-thumbnail" src="{$image.src}?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
												alt="{$image.alt}">
										</a>

									</div>
								{/foreach}

							</div>

							{$PAGINATION}
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
