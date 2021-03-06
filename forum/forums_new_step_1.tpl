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
                        <h1 class="m-0 text-dark">{$FORUM}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$FORUM}</li>
                            <li class="breadcrumb-item active">{$FORUMS}</li>
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
                        <h5 style="display:inline">{$CREATING_FORUM}</h5>
                        <div class="float-md-right">
                            <button class="btn btn-warning" onclick="showCancelModal()">{$CANCEL}</button>
                        </div>
                        <hr />

                        {include file='includes/success.tpl'}

                        {include file='includes/errors.tpl'}

                        <form action="" method="post">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="InputType">{$FORUM_TYPE}</label>
                                    <select class="form-control" id="InputType" name="forum_type">
                                        <option value="forum">{$FORUM_TYPE_FORUM}</option>
                                        <option value="category">{$FORUM_TYPE_CATEGORY}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="forumname">{$FORUM_NAME}</label>
                                <input class="form-control" type="text" name="forumname" id="forumname" value="{$FORUM_NAME_VALUE}" placeholder="{$FORUM_NAME}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="inputdesc">{$FORUM_DESCRIPTION}</label>
                                <textarea name="forumdesc" id="inputdesc" placeholder="{$FORUM_DESCRIPTION}" class="form-control" rows="3">{$FORUM_DESCRIPTION_VALUE}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="forum_icon">{$FORUM_ICON}</label>
                                <input class="form-control" type="text" name="forum_icon" id="forum_icon" value="{$FORUM_ICON_VALUE}" placeholder="{$FORUM_ICON}" autocomplete="off">
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
