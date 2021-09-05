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
								<button class="btn btn-success" type="button" onclick="showAddModal()">{$ADD_CATEGORY} <i
										class="fa fa-plus-circle">
									</i></button>
								<a class="btn btn-success" href="{$NEW_PRODUCT_LINK}">{$ADD_PRODUCT} <i
										class="fa fa-plus-circle"></i></a>
							</div>
						</div>
						<hr>

						<div class="text-center text-primary">
							<h3><label>{$CATEGORIES}</label></h3>
						</div>

						{foreach from=$CATEGORY_LIST item=category}
							<div id="accordion{$category.category_id}">
								<div class="card">
									<div class="card-header">
										<h5 class="mb-0">
											<button class="btn btn-link" data-toggle="collapse" data-target="#collapse{$category.category_id}"
												aria-expanded="true">
												{$category.category_name}
											</button>
											<div class="float-right">


												<div class="btn-group">
													<button class="btn mr-sm-2 btn-sm btn-warning" type="button" data-toggle="modal"
														data-target="#edit_modal{$category.category_id}"><i class="fas fa-edit fa-fw"></i></button>
													<button class="btn mr-sm-2 btn-sm btn-danger" type="button" data-toggle="modal"
														data-target="#delete_modal{$category.category_id}"><i class="fas fa-trash fa-fw"></i></button>
												</div>

												<!-- Edite modal -->
												<div class="modal fade" id="edit_modal{$category.category_id}" tabindex="-1" role="dialog">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h2 class="modal-title">{$EDITE_CATEGORY}</h2>
															</div>
															<form action="" id="edite{$category.category_id}" method="post">
																<div class="modal-body">
																	<p><label>{$NAME}</label></p>
																	<p><input type="text" class="form-control" name="edit_category"
																			value="{$category.category_name}"></p>
																	<p><label>{$DESCRIPTION}</label></p>
																	<p><textarea class="form-control"
																			name="edit_category_description">{$category.category_description}</textarea></p>
																	<p><label>{$URL_CATEGORY}</label></p>
																	<p><input type="text" class="form-control" name="edit_category_url"
																			value="{$category.category_url}"></p>

																	<input type="hidden" name="token" value="{$TOKEN}">
																	<input type="hidden" name="id_category" value="{$category.category_id}">
																	<div class="modal-footer">
																		<button type="button" class="btn btn-danger" data-dismiss="modal">{$CANCEL}</button>
																		<button type="submit" form="edite{$category.category_id}"
																			class="btn btn-success">{$SUBMIT}</button>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>

												<!-- Delete modal -->
												<div class="modal fade" id="delete_modal{$category.category_id}" tabindex="-1" role="dialog">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h2 class="modal-title">{$ARE_YOU_SURE}</h2>
															</div>
															<div class="modal-body">
																<p>{$CONFIRM_DELETE}</p>
																<form action="" id="delete{$category.category_id}" method="post">
																	<input type="hidden" name="token" value="{$TOKEN}">
																	<input type="hidden" name="delete_category" value="{$category.category_id}">
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-danger" data-dismiss="modal">{$NO}</button>
																<button type="submit" form="delete{$category.category_id}"
																	class="btn btn-success">{$YES}</button>
															</div>
														</div>
													</div>
												</div>

											</div>

										</h5>
									</div>

									<div id="collapse{$category.category_id}" class="collapse"
										data-parent="#accordion{$category.category_id}">
										<div class="container">

											{if count($PRODUCT_LIST)}
												<div class="table-responsive">
													<table class="table table-striped">
														<tbody>
															<div class="text-center text-primary p-3">
																<h5><label>{$PRODUCTS}</label></h5>
															</div>
															{foreach from=$PRODUCT_LIST item=product}
																{if $product.category_id === $category.category_id}
																	<tr>
																		<td>
																			<strong><a href="{$product.edit_link}">{$product.product_name}</a></strong>
																		</td>
																		<td>
																			<div class="float-right form-inline">
																				<a class="btn btn-primary btn-sm mr-sm-2" href="{$product.copy_link}"><i
																						class="far fa-copy"></i></a>

																				<div class="float-right form-inline">
																					<a class="btn btn-warning btn-sm mr-sm-2" href="{$product.edit_link}"><i
																							class="fas fa-edit fa-fw"></i></a>

																					<form action="" method="post">
																						<div class="form-group mr-sm-2">
																							<input type="hidden" name="token" value="{$TOKEN}">
																							<input type="hidden" class="btn btn-primary" name="delete_product"
																								value="{$product.product_id}">
																							<button class="btn btn-danger btn-sm" title="{$REMOVE}" type="button"
																								data-toggle="modal" data-target="#confirm-submit{$product.product_id}"><i
																									class="fas fa-trash fa-fw"></i></button>
																						</div>

																						<!-- Delete confirm modal -->
																						<div class="modal fade" id="confirm-submit{$product.product_id}" tabindex="-1"
																							role="dialog">
																							<div class="modal-dialog" role="document">
																								<div class="modal-content">
																									<div class="modal-header">
																										<h2 class="modal-title">{$ARE_YOU_SURE}</h2>
																									</div>
																									<div class="modal-body">
																										<p>{$CONFIRM_DELETE}</p>
																									</div>
																									<div class="modal-footer">
																										<button type="button" class="btn btn-danger"
																											data-dismiss="modal">{$NO}</button>
																										<button type="submit" class="btn btn-success">{$YES}</button>
																									</div>
																								</div>
																							</div>
																						</div>

																					</form>

																				</div>
																		</td>
																	</tr>
																{/if}
															{/foreach}
														</tbody>
													</table>
												</div>
											{/if}


										</div>
									</div>
								</div>
							</div>
						{/foreach}


						<div id="accordion">
							<div class="content">
								<div class="card-header">
									<h5 class="mb-0">
										<button class="btn btn-link" data-toggle="collapse" data-target="#collapseALL" aria-expanded="true">
											{$ALL_PRODUCTS}
										</button>
									</h5>
								</div>

								<div id="collapseALL" class="collapse" data-parent="#accordion">
									<div class="container">

										{if count($PRODUCT_LIST)}
											<div class="table-responsive">
												<table class="table table-striped">
													<tbody>
														<div class="text-center text-primary p-3">
															<h5><label>{$PRODUCTS}</label></h5>
														</div>
														{foreach from=$PRODUCT_LIST item=product}
															<tr>
																<td>
																	<strong><a href="{$product.edit_link}">{$product.product_name}</a></strong>
																</td>
																<td>
																	<div class="float-right form-inline">
																		<a class="btn btn-warning btn-sm mr-sm-2" href="{$product.edit_link}"><i
																				class="fas fa-edit fa-fw"></i></a>

																		<form action="" method="post">
																			<div class="form-group mr-sm-2">
																				<input type="hidden" name="token" value="{$TOKEN}">
																				<input type="hidden" class="btn btn-primary" name="delete_product"
																					value="{$product.product_id}">
																				<button class="btn btn-danger btn-sm" title="{$REMOVE}" type="button"
																					data-toggle="modal" data-target="#confirm{$product.product_id}"><i
																						class="fas fa-trash fa-fw"></i></button>
																			</div>

																			<!-- Delete confirm modal -->
																			<div class="modal fade" id="confirm{$product.product_id}" tabindex="-1" role="dialog">
																				<div class="modal-dialog" role="document">
																					<div class="modal-content">
																						<div class="modal-header">
																							<h2 class="modal-title">{$ARE_YOU_SURE}</h2>
																						</div>
																						<div class="modal-body">
																							<p>{$CONFIRM_DELETE}</p>
																						</div>
																						<div class="modal-footer">
																							<button type="button" class="btn btn-danger"
																								data-dismiss="modal">{$NO}</button>
																							<button type="submit" class="btn btn-success">{$YES}</button>
																						</div>
																					</div>
																				</div>
																			</div>

																		</form>

																	</div>
																</td>
															</tr>
														{/foreach}
													</tbody>
												</table>
											</div>
										{else}
											{$NO_PRODUCT}
										{/if}


									</div>
								</div>
							</div>
						</div>

					</section>

					<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">{$ADD_CATEGORY}</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="" method="post">
										<div class="form-group">
											<label for="CategoryName">{$NAME}</label>
											<input type="text" id="CategoryName" name="new_category" class="form-control">
										</div>
										<div class="form-group">
											<label for="CategoryDescription">{$DESCRIPTION}</label>
											<textarea type="text" id="CategoryDescription" name="new_category_description"
												class="form-control"></textarea>
										</div>
										<div class="form-group">
											<label for="CategoryURL">{$URL_CATEGORY}</label>
											<input type="text" id="CategoryURL" name="new_category_url" class="form-control">
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
		function showAddModal() {
			$('#addNewCategory').attr('href');
			$('#addModal').modal().show();
		}
	</script>
</body>

</html>
