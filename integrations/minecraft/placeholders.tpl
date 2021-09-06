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
                  <h1 class="h3 mb-0 text-gray-800">{$PLACEHOLDERS}</h1>
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
                          <div class="col-md-12">
                              <p style="margin-top: 7px; margin-bottom: 7px;">{$PLACEHOLDERS_INFO}</p>
                          </div>
                      </div>
                      {if count($ALL_PLACEHOLDERS)}
                          <hr />
                      {else}
                          <br />
                      {/if}

                      <!-- Success and Error Alerts -->
                      {include file='includes/alerts.tpl'}

                      {if count($ALL_PLACEHOLDERS)}
                      <form action="" method="POST">
                          <input type="hidden" name="token" value="{$TOKEN}">
                          <div class="table-responsive">
                              <table class="table table-borderless table-striped">
                                  <thead>
                                      <tr>
                                          <th>{$SERVER_ID}</th>
                                          <th>{$NAME}</th>
                                          <th>
                                              {$FRIENDLY_NAME}
                                              <span class="badge badge-info" style="margin-right:10px"><i
                                                      class="fas fa-question-circle" data-container="body"
                                                      data-toggle="popover" title="{$INFO}"
                                                      data-content="{$FRIENDLY_NAME_INFO}"></i></span>
                                          </th>
                                          <th class="text-center">
                                              {$SHOW_ON_PROFILE}
                                              <span class="badge badge-info" style="margin-right:10px"><i
                                                      class="fas fa-question-circle" data-container="body"
                                                      data-toggle="popover" title="{$INFO}"
                                                      data-content="{$SHOW_ON_PROFILE_INFO}"></i></span>
                                          </th>
                                          <th class="text-center">
                                              {$SHOW_ON_FORUM}
                                              <span class="badge badge-info" style="margin-right:10px"><i
                                                      class="fas fa-question-circle" data-container="body"
                                                      data-toggle="popover" title="{$INFO}"
                                                      data-content="{$SHOW_ON_FORUM_INFO}"></i></span>
                                          </th>
                                          <th class="text-center">{$LEADERBOARD_ENABLED}</th>
                                          <th class="text-center">{$LEADERBOARD_SETTINGS}</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      {foreach from=$ALL_PLACEHOLDERS item=placeholder}
                                          <tr>
                                              <td>{$placeholder->server_id}</td>
                                              <td><code>{$placeholder->name}</code></td>
                                              <td>
                                                  <input type="text" class="form-control" name="friendly_name-{$placeholder->name}-server-{$placeholder->server_id}" value="{$placeholder->friendly_name}">
                                              </td>
                                              <td class="text-center">
                                                  <input type="checkbox" class="js-switch" name="show_on_profile-{$placeholder->name}-server-{$placeholder->server_id}" {if $placeholder->show_on_profile eq 1} checked {/if}>
                                              </td>
                                              <td class="text-center">
                                                  <input type="checkbox" class="js-switch" name="show_on_forum-{$placeholder->name}-server-{$placeholder->server_id}" {if $placeholder->show_on_forum eq 1} checked {/if}>
                                              </td>
                                              <td class="text-center">
                                                  {if $placeholder->leaderboard eq 1}
                                                      <i class="fa fa-check-circle text-success"></i>
                                                  {else}
                                                      <i class="fa fa-times-circle text-danger"></i>
                                                  {/if}
                                              </td>
                                              <td class="text-center">
                                                  <a class="btn btn-secondary text-white" href="{$placeholder->leaderboard_settings_url}">
                                                      <i class="fas fa-cog"></i>
                                                  </a>
                                              </td>
                                          </tr>
                                      {/foreach}
                                  </tbody>
                              </table>
                          </div>

                          <button type="submit" class="btn btn-primary">{$SUBMIT}</button>
                      </form>
                      {else}
                          {$NO_PLACEHOLDERS}
                      {/if}
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
