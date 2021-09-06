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
  							<button class="btn btn-primary" type="button" onclick="showAddModal()">{$ADD_NEW_CATEGORY} <i
  									class="fa fa-plus-circle">
  								</i></button>
  							<a style="display:inline" href="{$CAT_BACK_LINK}" class="btn btn-warning float-md-right">{$BACK}</a>
  						</div>
  						<hr>
  						<h4 class="text-center">{$CATEGORY_SETTINGS}</h4>
  						{if count($CATEGORY_LIST)}
  							<div class="table-responsive">
  								<table class="table table-striped">
  									<tbody>
  										{foreach from=$CATEGORY_LIST item=category}
  											<tr>
  												<td>
  													<strong><a href="{$category.edit_link}">{$category.name}</strong>
  												</td>
  												<td>
  													<div class="float-md-right">
  														<a class="btn btn-warning btn-sm" href="{$category.edit_link}"><i
  																class="fas fa-edit fa-fw"></i></a>
  														<button class="btn btn-danger btn-sm" type="button"
  															onclick="showDeleteModal('{$category.delete_link}')"><i
  																class="fas fa-trash fa-fw"></i></button>
  													</div>
  												</td>
  											</tr>
  										{/foreach}
  									</tbody>
  								</table>
  							</div>
  						{else}
  							{$NO_CATEGORY}
  						{/if}
  					</section>
  				</div>




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
  								<a href="#" id="deletecategory" class="btn btn-primary">{$YES}</a>
  							</div>
  						</div>
  					</div>
  				</div>


  				<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
  					<div class="modal-dialog" role="document">
  						<div class="modal-content">
  							<div class="modal-header">
  								<h5 class="modal-title">{$ADD_NEW_CATEGORY}</h5>
  								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  									<span aria-hidden="true">&times;</span>
  								</button>
  							</div>
  							<div class="modal-body">
  								<form action="" method="post">
  									<div class="form-group">
  										<label for="categoryName">{$NAME_LABEL}</label>
  										<input type="text" id="categoryName" name="category_name" class="form-control">
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

  			</div>



  		</div>
  	</div>
  	<!-- ./wrapper -->

  	{include file='scripts.tpl'}

  	<script type="text/javascript">
  		function showDeleteModal(id) {
  			$('#deletecategory').attr('href', id);
  			$('#deleteModal').modal().show();
  		}
  	</script>

  	<script type="text/javascript">
  		function showAddModal() {
  			$('#addcategory').attr('href');
  			$('#addModal').modal().show();
  		}
  	</script>

  </body>

  </html>
