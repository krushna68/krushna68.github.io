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
                    <h1 class="h3 mb-0 text-gray-800">{$IP_LOOKUP}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$USER_MANAGEMENT}</li>
                        <li class="breadcrumb-item active">{$IP_LOOKUP}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-9">
                                <h5 style="margin-top: 7px; margin-bottom: 7px;">{$COUNT_ACCOUNTS}</h5>
                            </div>
                            <div class="col-md-3">
                                <span class="float-md-right"><a class="btn btn-primary" href="{$BACK_LINK}">{$BACK}</a></span>
                            </div>
                        </div>
                        <hr />

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

                        <ul>
                            {if isset($IP_SEARCH)}
                                {foreach from=$ACCOUNTS item=account}
                                    <li><a href="{$account.account_ips}"
                                           style="{$account.style}">{$account.username}</a></li>
                                {/foreach}
                            {else}
                                {foreach from=$ACCOUNTS item=account}
                                    <li><a href="{$account.link}">{$account.ip}</a></li>
                                {/foreach}
                            {/if}
                        </ul>

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
