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
                        <h1 class="m-0 text-dark">{$LABELS}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$FORUM}</li>
                            <li class="breadcrumb-item active">{$LABELS}</li>
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
                        <h5 style="display:inline">{$CREATING_LABEL}</h5>
                        <div class="float-md-right">
                            <button class="btn btn-warning" onclick="showCancelModal()" type="button">{$CANCEL}</button>
                        </div>
                        <hr />

                        {include file='includes/success.tpl'}

                        {include file='includes/errors.tpl'}

                        <form action="" method="post">
                            <div class="form-group">
                                <label for="label_name">{$LABEL_NAME}</label>
                                <input type="text" name="label_name" placeholder="{$LABEL_NAME}" value="{$LABEL_NAME_VALUE}" id="label_name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="label_id">{$LABEL_TYPE}</label><br />
                                <div class="row">
                                    {if count($LABEL_TYPES)}
                                        {assign var=i value=0}
                                        {foreach from=$LABEL_TYPES item=label_type}
                                            {if $i != 0 && ($i % 6) == 0}
                                                </div><div class="row">
                                            {/if}
                                            <div class="col-md-2">
                                                <input type="radio" name="label_id" id="label_id" value="{$label_type.id}"> {$label_type.name}
                                            </div>
                                            {assign var=i value=$i+1}
                                        {/foreach}
                                    {/if}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="label_forums">{$LABEL_FORUMS}</label>
                                <select name="label_forums[]" id="label_forums" size="5" class="form-control" multiple style="overflow:auto;">
                                    {if count($ALL_FORUMS)}
                                        {foreach from=$ALL_FORUMS item=item}
                                            <option value="{$item.id}">{$item.name}</option>
                                        {/foreach}
                                    {/if}
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="label_groups">{$LABEL_GROUPS}</label>
                                <select name="label_groups[]" id="label_groups" size="5" class="form-control" multiple style="overflow:auto;">
                                    {if count($ALL_GROUPS)}
                                        {foreach from=$ALL_GROUPS item=item}
                                            <option value="{$item.id}">{$item.name}</option>
                                        {/foreach}
                                    {/if}
                                </select>
                            </div>
                            <div class="forum-group">
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
