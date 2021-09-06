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
                    <h1 class="h3 mb-0 text-gray-800">{$STORE}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$STORE}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="inputAllowGuests">{$ALLOW_GUESTS}</label>
                                    <input type="checkbox" name="allow_guests" id="inputAllowGuests" class="js-switch" {if $ALLOW_GUESTS_VALUE} checked{/if} />
                                </div>

                                <div class="form-group">
                                    <label for="inputStorePath">{$STORE_PATH}</label>
                                    <input type="text" class="form-control" id="inputStorePath" name="store_path" placeholder="{$STORE_PATH}" value="{$STORE_PATH_VALUE}">
                                </div>

                                <div class="form-group">
                                    <label for="inputStoreContent">{$STORE_INDEX_CONTENT}</label>
                                    <textarea id="inputStoreContent" name="store_content">{$STORE_INDEX_CONTENT_VALUE}</textarea>
                                </div>

                                <div class="form-group">
                                    <label for="inputCheckoutContent">{$STORE_CHECKOUT_CONTENT}</label>
                                    <textarea id="inputCheckoutContent" name="store_checkout_content">{$STORE_CHECKOUT_CONTENT_VALUE}</textarea>
                                </div>

								<h5>PayPal API Details</h5>
								<div class="callout callout-info">
                                    <h5><i class="icon fa fa-info-circle"></i> Info</h5>
                                    The values of these fields are hidden for security reasons.<br />If you are updating these settings, please enter both the client ID and the client secret together.
                                </div>

								<div class="form-group">
                                    <label for="inputPaypalId">PayPal Client ID</label>
                                    <input class="form-control" type="text" id="inputPaypalId" name="client_id">
                                </div>

                                <div class="form-group">
                                    <label for="inputPaypalSecret">PayPal Client Secret</label>
                                    <input class="form-control" type="text" id="inputPaypalSecret" name="client_secret">
                                </div>

                                <div class="form-group">
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="submit" value="{$SUBMIT}" class="btn btn-primary">
                                </div>
                            </form>

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
