<div class="column is-9">
<div class="box content">
		<h6><a href="{$back_link}" title="category home">&laquo; {$translations.notfound.back}</a></h6>
				
				{if ($job.days_old > $smarty.const.OLD_JOB_NOTIFY) && ($smarty.const.OLD_JOB_NOTIFY > 0)}
				<div class="notification is-warning">
					<p>{$translator->translate("apply.old_ad", $smarty.const.OLD_JOB_NOTIFY)}</p>
				</div>
				{/if}

				<hr/>
				<h5>{$job.title} <a href="{$BASE_URL}jobs/{$job.type_var_name}/"><span class="tag {$job.type_name}">{$job.type_name}</span></a></h5>

				<span>{$translator->translate("jobs.published_at", "<strong>`$job.created_on`</strong>")} - {$translator->translate("jobs.viewed", "<strong>`$job.views_count`</strong>")} - 
						{if $job.url && $job.url != 'http://'}
						<a href="{$job.url}">{$job.company}</a>
						{else}
						<strong>{$job.company}</strong>
						{/if}
						{if $job.is_location_anywhere}
						<strong>({$translations.jobs.location_anywhere})</strong>
						{else}
						<span>{$translations.homepage.in}</span> <strong>{$job.location}</strong>
						{/if}
				</span>
				<div class="job-description">
					<p>{$job.description}</p>
				</div>
				{if $job.url && $job.url != 'http://'}
				<div class="job-link">
					<p><a href="{$job.url}">{$job.url}</a></p>
				</div>
				{/if}

			{include file="company-posts-loop.tpl"}
</div>
</div>
