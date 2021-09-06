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
                        <h1 class="m-0 text-dark">{$MINECRAFT}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$INTEGRATIONS}</li>
                            <li class="breadcrumb-item active">{$MINECRAFT}</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
          <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">{$PLACEHOLDER_LEADERBOARD_SETTINGS}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$INTEGRATIONS}</li>
                        <li class="breadcrumb-item"><a href="{$MINECRAFT_LINK}">{$MINECRAFT}</a></li>
                        <li class="breadcrumb-item active">{$PLACEHOLDERS}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-9">
                                <p style="margin-top: 7px; margin-bottom: 7px;">{$PLACEHOLDER_LEADERBOARD_INFO}</p>
                            </div>
                            <div class="col-md-3">
                                <span class="float-md-right"><a href="{$BACK_LINK}" class="btn btn-primary">{$BACK}</a></span>
                            </div>
                        </div>
                        <hr />

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

                        <form action="" method="POST">

                            <input type="hidden" name="token" value="{$TOKEN}">

                            <div class="form-group">
                                <label for="leaderboard_enabled">
                                    {$LEADERBOARD_ENABLED}
                                    <span class="badge badge-info" data-toggle="popover" data-title="{$INFO}" data-content="{$ENABLED_INFO}"><i class="fa fa-question"></i>
                                </label>
                                <input type="checkbox" class="js-switch" name="leaderboard_enabled" {if $PLACEHOLDER->leaderboard eq 1} checked {/if}>
                            </div>

                            <div class="form-group">
                                <label for="leaderboard_title">{$LEADERBOARD_TITLE}</label>
                                <input type="text" name="leaderboard_title" class="form-control" value="{$PLACEHOLDER->leaderboard_title}">
                            </div>

                            <div class="form-group">
                                <label for="leaderboard_sort">{$LEADERBOARD_SORT}</label>
                                <select name="leaderboard_sort" class="form-control">
                                    <option value="ASC" {if $PLACEHOLDER->leaderboard_sort eq 'ASC'} selected {/if}>Ascending</option>
                                    <option value="DESC" {if $PLACEHOLDER->leaderboard_sort eq 'DESC'} selected {/if}>Descending</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">{$SUBMIT}</button>

                        </form>

                    </div>
                </div>


                <!-- Spacing -->
                <div style="height:1rem;"></div>

            </div>
        </section>
    </div>

    {include file='footer.tpl'}

</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

</body>
</html>
