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
                    <h1 class="h3 mb-0 text-gray-800">{$WIDGETS}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$LAYOUT}</li>
                        <li class="breadcrumb-item active">{$WIDGETS}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

                        {foreach from=$WIDGETS_LIST item=widget name=widget_list}
                            <div class="row">
                                <div class="col-md-9">
                                    <strong>{$widget.name}</strong> <small>{$widget.module}</small>
                                    <br />
                                    <small>{$widget.description}</small>
                                </div>
                                <div class="col-md-3">
                                    <div class="float-md-right">
                                        {if $widget.enabled}
                                            <a href="{$widget.disable_link}" class="btn btn-danger">{$DISABLE}</a>
                                            <a href="{$widget.settings_link}" class="btn btn-primary">{$EDIT}</a>
                                        {else}
                                            <a href="{$widget.enable_link}" class="btn btn-success">{$ENABLE}</a>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                            {if not $smarty.foreach.widget_list.last}
                                <hr />
                            {/if}
                        {/foreach}

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
