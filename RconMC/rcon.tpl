{include file='header.tpl'}
<style>
	@import url('https://fonts.googleapis.com/css?family=Roboto+Mono');

	p.console {
		font-family: 'Roboto Mono', monospace;
	}

	header.terminal {
		background: #E0E8F0;
		height: 30px;
		border-radius: 8px 8px 0 0;
		padding-left: 10px;
	}

	.terminal-container header .button {
		width: 12px;
		height: 12px;
		margin: 10px 4px 0 0;
		display: inline-block;
		border-radius: 8px;
	}

	.green {
		background-color: #3BB662 !important;
	}

	.red {
		background-color: #E75448 !important;
	}

	.yellow {
		background-color: #E5C30F !important;
	}

	.terminal-container {
		text-align: left;
		width: 100%;
		border-radius: 10px;
		margin: auto;
		margin-bottom: 14px;
		position: relative;
	}

	.terminal-fixed-top {
		margin-top: 30px;
	}

	.terminal-home {
		display: block;
		width: 100%;
		height: 50vh;
		overflow-y: scroll;
		scroll-behavior: smooth;
		background-color: #30353A;
		padding: 1.5em 1em 1em 2em;
		border-bottom-left-radius: 6px;
		border-bottom-right-radius: 6px;
		color: #FAFAFA;
	}

	.btn-xs {
		height: 85%;
		min-width: 60px;
		border-radius: 8px 8px 8px 8px;

	}
</style>
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


						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0 text-dark">{$TITLE}</h1>
							</div>
						</div>
					</div>


					<section class="content">


						<div class="float-md-right">
							<a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
						</div>


						<h5><i class="fa fa-terminal" aria-hidden="true"> {$CONSOLE}:</i> {$SERVER_NAME}</h5>

						<section class="terminal-container terminal-fixed-top">
							<header class="terminal">
								<span class="button red"></span>
								<span class="button yellow"></span>
								<span class="button green"></span>
								<button type="button" onclick="cmdSend('tps')" class="btn-outline-dark btn-xs">TPS</button>
								<button type="button" onclick="cmdSend('lag')" class="btn-outline-dark btn-xs">LAG</button>
								<button type="button" onclick="cmdSend('list')" class="btn-outline-dark btn-xs">PLAYERLIST</button>
								<button type="button" onclick="cmdSend('unloadchunks')"
									class="btn-outline-dark btn-xs">UNLOADCHUNKS</button>
								<button type="button" onclick="cmdSend('banlist')" class="btn-outline-dark btn-xs">BANLIST</button>
								<button type="button" onclick="cmdSend('restart')" class="btn-outline-dark btn-xs">RESTART</button>
								<button type="button" onclick="cmdSend('stop')" class="btn-outline-dark btn-xs">STOP</button>
							</header>

							<div id="terminal" class="terminal-home overflow-auto"></div>
							<form action="" method="post">
								<div class="input-group">
									<input type="commands" id="cmd_input" class="form-control form-control-sm">
									<button type="button" onclick="cmdSend('input')" class="btn btn-sm btn-primary">{$SUBMIT}</button>
									<input id="token" type="hidden" name="token" value="{$TOKEN}">

								</div>
							</form>
						</section>


					</section>
				</div>

			</div>



		</div>
	</div>
	<!-- ./wrapper -->

	{include file='scripts.tpl'}

	<script>
		function ScrollToEnd(id) {

			var element = document.getElementById(id);
			element.scrollTop = element.scrollHeight - element.clientHeight;
		}

		function clearInput() {
			document.getElementById('cmd_input').value = '';
		}

		function cmdSend(cmd) {
			if (cmd == 'input') {
				cmd = document.getElementById('cmd_input').value;
			}
			$('#terminal').append('<p class="console"><span style="color: dodgerblue;">' + cmd + '</span></p>');
			clearInput()
			var token = document.getElementById('token').value;
			var url = window.location;
			var data = { 'token': token, 'cmd_mc': cmd };
			var test = $.ajax({
				type: 'POST',
				url: url,
				data: data,
				dataType: 'json',
				success: function(resp) {
					if (resp.status == 'error') {
						$('#terminal').append('<p class="console"><span style="color: red;">' + resp.error_status +
							'</span></p>');
						ScrollToEnd('terminal');
					} else {
						if (resp.response.length <= 2) {
							$('#terminal').append(writeToWebConsole({json_encode($NO_RESPONSE)}));
						} else {
							$('#terminal').append(writeToWebConsole(resp.response));
						}
						ScrollToEnd('terminal');
					}
				}
			});


		}
		$('input').keydown(function(event) {
			if (event.which === 13) {
				// Do something
				// Disable sending the related form
				cmdSend('input');
				event.preventDefault();
				return false;
			}
		});


		function writeToWebConsole(msg) {

			//Write to div, replacing < to &lt; (to avoid XSS) and replacing new line to br.
			msg = msg.replace(/</g, "&lt;");
			msg = msg.replace(/(?:\r\n|\r|\n)/g, "<br>");

			//Color filter for Windows (thanks to SuperPykkon)
			msg = msg.replace(/\[0;30;22m/g, "<span style='color: #000000;'>"); //&0
			msg = msg.replace(/\[0;34;22m/g, "<span style='color: #0000AA;'>"); //&1
			msg = msg.replace(/\[0;32;22m/g, "<span style='color: #00AA00;'>"); //&2
			msg = msg.replace(/\[0;36;22m/g, "<span style='color: #00AAAA;'>"); //&3
			msg = msg.replace(/\[0;31;22m/g, "<span style='color: #AA0000;'>"); //&4
			msg = msg.replace(/\[0;35;22m/g, "<span style='color: #AA00AA;'>"); //&5
			msg = msg.replace(/\[0;33;22m/g, "<span style='color: #FFAA00;'>"); //&6
			msg = msg.replace(/\[0;37;22m/g, "<span style='color: #AAAAAA;'>"); //&7
			msg = msg.replace(/\[0;30;1m/g, "<span style='color: #555555;'>"); //&8
			msg = msg.replace(/\[0;34;1m/g, "<span style='color: #5555FF;'>"); //&9
			msg = msg.replace(/\[0;32;1m/g, "<span style='color: #55FF55;'>"); //&a
			msg = msg.replace(/\[0;36;1m/g, "<span style='color: #55FFFF;'>"); //&b
			msg = msg.replace(/\[0;31;1m/g, "<span style='color: #FF5555;'>"); //&c
			msg = msg.replace(/\[0;35;1m/g, "<span style='color: #FF55FF;'>"); //&d
			msg = msg.replace(/\[0;33;1m/g, "<span style='color: #FFFF55;'>"); //&e
			msg = msg.replace(/\[0;37;1m/g, "<span style='color: #FFFFFF;'>"); //&f
			msg = msg.replace(/\[m/g, "</span>"); //&f

			//Color filter for UNIX (This is easier!)
			//span may not be closed every time but browsers will do for ourselves
			msg = msg.replace(/§0/g, "<span style='color: #000000;'>"); //&0
			msg = msg.replace(/§1/g, "<span style='color: #0000AA;'>"); //&1
			msg = msg.replace(/§2/g, "<span style='color: #00AA00;'>"); //&2
			msg = msg.replace(/§3/g, "<span style='color: #00AAAA;'>"); //&3
			msg = msg.replace(/§4/g, "<span style='color: #AA0000;'>"); //&4
			msg = msg.replace(/§5/g, "<span style='color: #AA00AA;'>"); //&5
			msg = msg.replace(/§6/g, "<span style='color: #FFAA00;'>"); //&6
			msg = msg.replace(/§7/g, "<span style='color: #AAAAAA;'>"); //&7
			msg = msg.replace(/§8/g, "<span style='color: #555555;'>"); //&8
			msg = msg.replace(/§9/g, "<span style='color: #5555FF;'>"); //&9
			msg = msg.replace(/§a/g, "<span style='color: #55FF55;'>"); //&a
			msg = msg.replace(/§b/g, "<span style='color: #55FFFF;'>"); //&b
			msg = msg.replace(/§c/g, "<span style='color: #FF5555;'>"); //&c
			msg = msg.replace(/§d/g, "<span style='color: #FF55FF;'>"); //&d
			msg = msg.replace(/§e/g, "<span style='color: #FFFF55;'>"); //&e
			msg = msg.replace(/§f/g, "<span style='color: #FFFFFF;'>"); //&f

			msg = msg.replace(/§l/g, "<span style='font-weight:bold;'>"); //&l
			msg = msg.replace(/§m/g, "<span style='text-decoration: line-through;'>"); //&m
			msg = msg.replace(/§n/g, "<span style='text-decoration: underline;'>"); //&n
			msg = msg.replace(/§o/g, "<span style='font-style: italic;'>"); //&o

			msg = msg.replace(/§r/g, "</span>"); //&r

			msg = msg.replace(/\[m/g, "</span>");

			//Append datetime if enabled
			return msg + "<br>";
		}
	</script>
</body>

</html>
