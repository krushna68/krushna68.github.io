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
                    <h1 class="h3 mb-0 text-gray-800">{$CUSTOM_PAGES}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$PAGES}</li>
                        <li class="breadcrumb-item active">{$CUSTOM_PAGES}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">

                        <a href="{$NEW_PAGE_LINK}" class="btn btn-primary">{$NEW_PAGE}</a>
                        <hr />

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

                        {if count($CUSTOM_PAGE_LIST)}
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                    {foreach from=$CUSTOM_PAGE_LIST item=custom_page}
                                        <tr>
                                            <td>
                                                <strong>{$custom_page.title}</strong>
                                            </td>
                                            <td>
                                                <div class="float-md-right">
                                                    <a class="btn btn-warning btn-sm" href="{$custom_page.edit_link}"><i
                                                                class="fas fa-edit fa-fw"></i></a>
                                                    <button class="btn btn-danger btn-sm" type="button"
                                                            onclick="showDeleteModal('{$custom_page.delete_link}')"><i
                                                                class="fas fa-trash fa-fw"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            <p>{$NO_CUSTOM_PAGES}</p>
                        {/if}

                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

                <!-- End Page Content -->
            </div>

            <!-- End Main Content -->
        </div>



        <!-- End Content Wrapper -->
    </div>

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
                    {$CONFIRM_DELETE_PAGE}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="#" id="deleteLink" class="btn btn-primary">{$YES}</a>
                </div>
            </div>
        </div>
    </div>

    <!-- End Wrapper -->
</div>

{include file='scripts.tpl'}

<script type="text/javascript">
  function showDeleteModal(id) {
    $('#deleteLink').attr('href', id);
    $('#deleteModal').modal().show();
  }
</script>

</body>

</html>
