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
                    <h1 class="h3 mb-0 text-gray-800">{$PAYMENTS}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$STORE}</li>
                        <li class="breadcrumb-item active">{$PAYMENTS}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">
                            <!---<a class="btn btn-primary" href="{$NEW_PAYMENT_LINK}">{$NEW_PAYMENT}</a>--->
                            <hr />

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

                            {if isset($NO_PAYMENTS)}
                                <p>{$NO_PAYMENTS}</p>
                            {else}
                                <div class="table-responsive">
                                    <table class="table table-striped dataTables-payments">
                                        <thead>
                                        <tr>
                                            <th>{$USER}</th>
                                            <th>{$AMOUNT}</th>
                                            <th>{$STATUS}</th>
                                            <th>{$DATE}</th>
                                            <th>{$VIEW}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {foreach from=$ALL_PAYMENTS item=payment}
                                            <tr>
                                                <td><a href="{$payment.user_link}" style="{$payment.user_style}"><img src="{$payment.user_avatar}" class="rounded" style="max-width:32px;max-height:32px;" alt="{$payment.username}" /> {$payment.username}</a></td>
                                                <td>{$payment.currency_symbol}{$payment.amount}</td>
                                                <td>{$payment.status}</td>
                                                <td data-sort="{$payment.date_unix}">{$payment.date}</td>
                                                <td><a href="{$payment.link}" class="btn btn-primary btn-sm">{$VIEW}</a></td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
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
