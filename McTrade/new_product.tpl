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
								<h1 class="m-0 text-dark">{$ADD_PRODUCT}</h1>
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
								<input type="text" id="Name" name="trade_name" class="form-control">
							</div>
							<div class="form-group">
								<label for="Price">{$PRICE}</label>
								<input type="text" id="Price" name="trade_price" class="form-control">
							</div>


							<label>{$DESCRIPTION}</label>
                            <label for="inputContent">{$CONTENT} <span class="badge badge-info"><i class="fa fa-lightbulb" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$REPLACEMENT_INFO}"></i></span></label>
                            <br><label><b>Nightless:</b> Color information, please read! <span class="badge badge-danger"><i class="fa fa-exclamation-circle" data-container="body" data-toggle="popover" title="WARNING" data-content="This new text editor is still being implemented to <b>Nightless</b>, but currently default text color is <b>BLACK</b>. Whatever is BLACK color in this area will be same color for everyone. We recommend you to keep color BLACK just in case!"></i></span></label>
							{if !isset($MARKDOWN)}
								<div class="form-group">
									<textarea name="content" class="form-control" id="reply">{$CONTENT}</textarea>
								</div>
							{else}
								<div class="form-group">
									<textarea name="content" class="form-control" id="markdown">{$CONTENT}</textarea>
									<div class="meta">{$MARKDOWN_HELP}</div>
								</div>
							{/if}

							<label>{$CATEGORIES}</label>
							<div class="form-group">
								<select class="form-control mr-sm-2" name="trade_category">

									{foreach from=$CATEGORY_LIST item=category}
										<option value="{$category.category_id}">{$category.category_name}</option>
									{/foreach}

								</select>
							</div>


							<div class="form-group">
								<label for="Img">{$IMG}</label>
								<input type="text" id="Img" name="trade_img" class="form-control">
							</div>

							<div class="form-group">
								<label for="uploadFileButton">{$IMG_DOWNLOAD}</label>
								<button type="button" class="btn btn-light btn-sm infoButton" data-toggle="tooltip" data-placement="top"
									title="{$IMG_HELP} {$IMG}">
									<i class="fa fa-info-circle" aria-hidden="true"></i>
								</button>

								<div class="custom-file">
									<input type="file" name="resourceFile" class="custom-file-input" id="uploadFileButton"
										accept="image/gif, image/jpg, image/jpeg, image/png"
										onchange="$('#uploadFileName').html(this.files[0].name)">
									<label for="uploadFileButton" class="custom-file-label" id="uploadFileName"></label>
								</div>

								<label>{$TYPE_PRODUCT}</label>
								<div class="form-group">
									<select class="form-control mr-sm-2" id="trade_type" onclick="selectType(this.value);"
										name="trade_type">
										<option value="1">DEFAULT</option>
										<option value="2">ECONOMY</option>
									</select>

									<div id="economy_value_div" class="d-none">
										<br>
										<label for="economy_value">{$ECONOMY_INPUT}</label>
										<button type="button" class="btn btn-light btn-sm infoButton" data-toggle="tooltip" data-placement="top"
											title="{$ECONOMY_HELP}">
											<i class="fa fa-info-circle" aria-hidden="true"></i>
										</button>
										<input type="number" class="form-control" id="economy_value" name="economy_value" value="0">
									</div>
								</div>

								<div class=" form-group">
									<br><label for="productCommands">{$COMMANDS}</label>
									<button type="button" class="btn btn-light btn-sm infoButton" data-toggle="tooltip" data-placement="top"
										title="{$COMMANDS_HELP}">
										<i class="fa fa-info-circle" aria-hidden="true"></i>
									</button>
									<textarea name="commands" class="form-control" id="productCommands"></textarea>
								</div>

								<label>RCON</label>
								<div class="form-group">
									<select class="form-control mr-sm-2" name="trade_rcon_id">

										{foreach from=$RCON_LIST item=rcon}
											<option value="{$rcon.rcon_id}">{$rcon.rcon_name}</option>
										{/foreach}

									</select>
								</div>

							</div>

							<div class="form-group">
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="submit" class="btn btn-primary" value="{$ADD}">
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
