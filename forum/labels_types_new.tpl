{include file='header.tpl'}
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    {include file='navbar.tpl'}
    {include file='sidebar.tpl'}

    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">{$LABEL_TYPES}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$FORUM}</li>
                            <li class="breadcrumb-item active">{$LABEL_TYPES}</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                {include file='includes/update.tpl'}

                <div class="card">
                    <div class="card-body">
                        <h5 style="display:inline">{$CREATING_LABEL_TYPE}</h5>
                        <div class="float-md-right">
                            <button class="btn btn-warning" type="button" onclick="showCancelModal()">{$CANCEL}</button>
                        </div>
                        <hr />

                        {include file='includes/success.tpl'}

                        {include file='includes/errors.tpl'}

                        <form action="" method="post">
                            <div class="form-group">
                                <label for="label_type_name">{$LABEL_TYPE_NAME}</label>
                                <input type="text" name="label_name" placeholder="Primary" id="label_type_name" class="form-control" value="{$LABEL_TYPE_NAME_VALUE}">
                            </div>
                            <div class="form-group">
                                <label for="label_html">{$LABEL_TYPE_HTML}</label> <span class="badge badge-info"><i class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$LABEL_TYPE_HTML_INFO}"></i></span><br />
                                <input type="text" name="label_html" placeholder="<span class=&quot;badge badge-primary&quot;>{literal}{x}{/literal}</span>" id="label_type_html" class="form-control" value="{$LABEL_TYPE_HTML_VALUE}">
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                            </div>
                        </form>

                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

            </div>
        </section>
    </div>

    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_CANCEL}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="{$CANCEL_LINK}" class="btn btn-primary">{$YES}</a>
                </div>
            </div>
        </div>
    </div>



</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}
<script type="text/javascript">
    function showCancelModal(){
        $('#cancelModal').modal().show();
    }
</script>

</body>
</html>
