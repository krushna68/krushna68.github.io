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
                    <h1 class="h3 mb-0 text-gray-800">{$REACTIONS}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                        <li class="breadcrumb-item active">{$REACTIONS}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">

                        <a href="{$NEW_REACTION_LINK}" class="btn btn-primary">{$NEW_REACTION}</a>
                        <hr />

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

                        {if count($REACTIONS_LIST)}
                            <div class="table-responsive">
                                <table class="table table-borderless table-striped">
                                    <thead>
                                    <tr>
                                        <td>{$NAME}</td>
                                        <td>{$ICON}</td>
                                        <td>{$TYPE}</td>
                                        <td>{$ENABLED}</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach from=$REACTIONS_LIST item=reaction}
                                        <tr>
                                            <td><a href="{$reaction.edit_link}">{$reaction.name}</a></td>
                                            <td>{$reaction.html}</td>
                                            <td>{$reaction.type}</td>
                                            <td>{if $reaction.enabled eq 1}
                                                    <i class="fa fa-check-circle fa-fw text-success"></i>
                                                {else}
                                                    <i class="fa fa-times-circle fa-fw text-danger"></i>
                                                {/if}</td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            {$NO_REACTIONS}
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

    <!-- End Wrapper -->
</div>

{include file='scripts.tpl'}

</body>

</html>
