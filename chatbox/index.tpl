{include file='chatbox/includes/header.tpl'}

{if isset($SUCCESS)}
	<div class="alert alert-success">
		<h5>
			<i class="fas fa-check-circle fa-fw"></i>
			{$SUCCESS_TITLE}
		</h5>
		{$SUCCESS}
	</div>
{/if}

{if isset($ERROR)}
	<div class="alert alert-danger">
		<h5>
			<i class="fas fa-exclamation-circle fa-fw"></i>
			{$ERROR_TITLE}
		</h5>
		{$ERROR}
	</div>
{/if}
				
<div class="card">
	<div class="card-body">
		{if count($FIELDS)}
			<form action="" method="post">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						{foreach from=$FIELDS item=field name=name}
							{include file="chatbox/includes/fields.tpl"}
						{/foreach}
						<div class="text-right">
							<input type="hidden" name="token" value="{$TOKEN}">
							<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
						</div>
					</div>
				</div>
			</form>
		{/if}
	</div>
</div>
	
{include file='chatbox/includes/footer.tpl'}