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

                <div class="row mt-5 mb-5">

                <div class="col-md-4"></div>
                <div class="col-md-4">
                    {include file='includes/alerts.tpl'}
                    <div class="card">
                        <div style="padding:1rem;">
                            <form action="?action=update" method="POST">
                                <div class="form-group">
                                    <label for="">Email Paypal</label>
                                    <input type="text" name="email" class="form-control" value="{$EMAIL}">
                                </div>
                                <div class="form-group">
                                    <label for="">Currency</label>
                                    <select name="currency" class="form-control">
                                        <option value="USD">USD</option>
                                        <option value="EUR" {if $CURRENCY == 'EUR'}selected{/if}>EUR</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success w-100">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>

                </div>

            </div>

        </div>
    </div>

    {include file='scripts.tpl'}

</body>
</html>
