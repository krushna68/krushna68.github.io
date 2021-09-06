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
                    <h1 class="h3 mb-0 text-gray-800">{$TICKETS}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$TICKETS}</li>
                    </ol>
                </div>

                <div class="content-wrapper">

                    <!-- Main content -->
                    <div class="content">
                        <div class="card">
                            <div class="card-header">
                                {$CREATE_NEW_CATEG}
                            </div>
                            <div class="card-body">
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
                                <form action="{$LINK}&action=setLocation" method="post">
                                    <div class="form-group">
                                        <label for="link_location">{$LINK_LOCATION}</label>
                                        <select class="form-control" id="link_location" name="link_location">
                                            <option value="1"{if $LINK_LOCATION_VALUE eq 1} selected{/if}>{$LINK_NAVBAR}</option>
                                            <option value="2"{if $LINK_LOCATION_VALUE eq 2} selected{/if}>{$LINK_MORE}</option>
                                            <option value="3"{if $LINK_LOCATION_VALUE eq 3} selected{/if}>{$LINK_FOOTER}</option>
                                            <option value="4"{if $LINK_LOCATION_VALUE eq 4} selected{/if}>{$LINK_NONE}</option>
                                        </select>
                                    </div>
                                    <div class="form-group text-right">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <input type="submit" class="btn btn-primary" value="{$SAVE}">
                                    </div>
                                </form>
                                <form action="{$LINK}&action=create" method="post">
                                    <div class="form-group">
                                        <label for="InputButtonName">{$CREATE_CATEG_NAME}</label>
                                        <input type="text" id="category_name" placeholder="{$CATEG_EXAMPLE}"
                                               name="category_name" class="form-control" maxlength="20">
                                    </div>
                                    <div class="form-group">
                                        <label for="category_color">{$CREATE_CATEG_COLOR}</label>
                                        <input type="text" id="category_color" placeholder="FFFFFF"
                                               name="category_color" class="form-control" maxlength="6">
                                    </div>
                                    <div class="form-group">
                                        <label for="category_color">{$CREATE_CATEG_DESCRIPTION}</label>
                                        <textarea type="text" id="category_desc" placeholder="{$CATEG_DESC}"
                                                  name="category_desc" class="form-control" maxlength="50" row="2"></textarea>
                                    </div>
                                    <div class="form-group text-right">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <input type="submit" class="btn btn-primary" value="{$CREATE}">
                                    </div>
                                </form>
                                {if count($CATEGORIES) > 0}
                                    <ul class="list-group list-group-flush">
                                        {foreach from=$CATEGORIES item=$category}
                                            <li class="list-group-item">
                                                <div class="d-flex flex-row">
                                                    <div class="my-auto">
                                                        <span class="badge"
                                                              style="background:#{$category->color};color:#F0F0F0">{$category->text}</span>
                                                    </div>
                                                    <a class="btn btn-danger ml-auto"
                                                       href="{$LINK}&action=deleteCategory&category={$category->id}"><i
                                                                class="fas fa-trash"></i></a>
                                                </div>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <!-- Spacing -->
                <div style="height:1rem;"></div>

                <!-- End Page Content -->
            </div>

            <!-- End Main Content -->
        </div>

        {include file='footer.tpl'}

        <!-- End Content Wrapper -->
    </div>

    <!-- End Wrapper -->
</div>

{include file='scripts.tpl'}

</body>

</html>
