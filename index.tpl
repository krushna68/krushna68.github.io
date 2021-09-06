{include file='header.tpl'}
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    {include file='navbar.tpl'}
    {include file='sidebar.tpl'}

    <div class="content-wrapper">

        <div style="height:10px;"></div>
        <!-- Main content -->
        <section class="content">

          <div class="alert bg-warning text-white alert-dismissible" style="display:none" id="updateGreendyWarning">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">×</span>
              </button>
              <h5><i class="icon fa fa-download"></i> Important Greendy Update</h5>
              New version of Greendy Panel Template has been found. You are using <b id="UGWCurrent"></b>, please update to <b id="UGWNew"></b> by <a href="https://namelessmc.com/resources/resource/156-greendy-dark-green-v2-pre9/" target="_blank">clicking here</a>!
          </div>

            <div class="container-fluid">
                {include file='includes/update.tpl'}

                {if isset($DIRECTORY_WARNING)}
                    <div class="alert alert-warning">
                        {$DIRECTORY_WARNING}
                    </div>
                {/if}

                {if count($DASHBOARD_STATS)}
                    {assign var="i" value=0}
                    <div class="row">
                    {foreach from=$DASHBOARD_STATS item=stat}
                        {if $i % 4 eq 0}
                            </div>
                            <div class="row">
                        {/if}
                        <div class="col">{$stat->getContent()}</div>
                        {assign var="i" value=$i+1}
                    {/foreach}
                    </div>
                {/if}

                <div class="row">
                    <div class="col-md-9">
                        {if count($GRAPHS)}
                            <div class="card">
                                <div class="card-header">
                                    <i class="far fa-chart-bar"></i> {$STATISTICS}

                                    <div class="card-tools">
                                        <div class="dropdown float-md-right">
                                            <a style="color: #000;" class="btn btn-sm dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                {$GRAPHS|@key}
                                            </a>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                            {assign var="i" value=0}
                                            {foreach from=$GRAPHS key=key item=graph}
                                                <a class="dropdown-item" href="#" onclick="drawChart({$i})">{$key}</a>
                                                {assign var="i" value=$i+1}
                                            {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <canvas id="graphDiv" style="height: 400px;"></canvas>
                                </div>
                            </div>
                        {/if}

                        {if count($MAIN_ITEMS)}
                            {assign var="i" value=0}
                            {assign var="counter" value=0}
                            <div class="row justify-content-md-center">
                            {foreach from=$MAIN_ITEMS item=item}
                                {assign var="width" value=(12*$item->getWidth())|round:1}
                                {assign var="counter" value=($counter+$width)}
                                {if $counter > 12}
                                    {assign var="counter" value=0}
                                    </div><br />
                                    <div class="row justify-content-md-center">
                                {/if}
                                <div class="col-md-{$width}">{$item->getContent()}</div>
                                {assign var="i" value=$i+1}
                            {/foreach}
                            </div>
                        {/if}
                    </div>

                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-header">
                                <i class="far fa-newspaper"></i> {$NAMELESS_NEWS}
                            </div>
                            <div class="card-body">
                                {if isset($NO_NEWS)}
                                    <div class="alert alert-warning">{$NO_NEWS}</div>
                                {else}
                                    {foreach from=$NEWS item=item name=newsarray}
                                        <a href="#" onclick="confirmLeaveSite('{$item.url}')">{$item.title}</a>
                                        <br /><small>{$item.author} | <span data-toggle="tooltip" data-title="{$item.date}">{$item.date_friendly}</span></small>
                                        {if not $smarty.foreach.newsarray.last}<hr />{/if}
                                    {/foreach}
                                {/if}
                            </div>
                        </div>

                        {if isset($SERVER_COMPATIBILITY)}
                            <div class="card">
                                <div class="card-header">
                                    <i class="fas fa-wrench"></i>
                                    {$SERVER_COMPATIBILITY}
                                </div>
                                <div class="card-body">
                                    {$NAMELESS_VERSION}
                                    <hr />
                                    {foreach from=$COMPAT_SUCCESS item=item}
                                        {$item} <i class="fas fa-check-circle text-success"></i><br />
                                    {/foreach}
                                    {if count($COMPAT_ERRORS)}
                                        <hr />
                                        {foreach from=$COMPAT_ERRORS item=item}
                                            {$item} <i class="fas fa-times-circle text-danger"></i><br />
                                        {/foreach}
                                    {/if}
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

            </div>
        </section>
        {include file='footer.tpl'}
    </div>
    <!-- Confirm leave site modal -->
    <div class="modal fade" id="confirmLeaveSiteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    {$CONFIRM_LEAVE_SITE}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="#" id="leaveSiteA" class="btn btn-primary" target="_blank">{$YES}</a>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

{if count($GRAPHS)}
    <script type="text/javascript">
        let graphs = [
        {foreach from=$GRAPHS item=graph}
            {
                type: 'line',
                data: {
                    labels: [{foreach from=$graph.keys key=key item=item}'{$item}',{/foreach}],
                    datasets: [
                        {foreach from=$graph.datasets item=dataset}
                        {
                            fill: false,
                            borderColor: '{$dataset.colour}',
                            label: '{$dataset.label}',
                            yAxisID: '{$dataset.axis}',
                            data: [ {foreach from=$dataset.data item=data name=ds} {$data}{if not $smarty.foreach.ds.last}, {/if}{/foreach} ]
                        },
                        {/foreach}
                    ]
                },
                options: {
                    scales: {
                        xAxes: [{
                            type: 'time',
                            time: {
                                tooltipFormat: 'MMM D',
                                unit: 'day'
                            }
                        }],
                        yAxes: [
                            {foreach from=$graph.axes key=key item=axis}
                            {
                                id: '{$key}',
                                type: 'linear',
                                position: '{$axis}'
                            },
                            {/foreach}
                        ]
                    }
                }
            },
        {/foreach}
        ];

        function drawChart(i){
            let canvas = document.getElementById('graphDiv');

            let chart = new Chart(canvas, graphs[i]);
        }

        $(function(){
            drawChart(0);
        });
    </script>
{/if}

<script type="text/javascript">
    function confirmLeaveSite(url){
        $('#leaveSiteURL').html(url);
        $('#leaveSiteA').attr('href', url);
        $('#confirmLeaveSiteModal').modal().show();
    }


    window.addEventListener("load", function () {
      var greendyCurrentVer = "v1.3.3"

      var req = new XMLHttpRequest();

      req.open('GET', 'https://nukeman4.github.io/GreendyUpdater/ver/check.html?'+ (new Date).getTime(), false);
      req.send(null);

      if(req.status == 200) {
         greendyverNew = 'v'+req.responseText;
      }

      if (greendyverNew.trim() == greendyCurrentVer) {
        $('#updateGreendyWarning').css('display', 'none');
        $('#UGWCurrent').html(greendyCurrentVer)
        $('#UGWNew').html(greendyverNew.trim())
      }else {
        $('#updateGreendyWarning').css('display', 'inherit');
        $('#UGWCurrent').html(greendyCurrentVer)
        $('#UGWNew').html(greendyverNew.trim())
      }

    });





</script>

</body>
</html>
