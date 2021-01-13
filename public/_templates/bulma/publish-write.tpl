{include file="header.tpl"}
		
<section class="container">
<div class="columns">

	<div class="column is-9">
		<div class="box content">

			{if $filter_error}
			<div class="validation-failure">
				<img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" />
				{$filter_error}
			</div>
			{/if}
			{if $errors}
			<div class="validation-failure">
				<img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" />
				{$translations.publish.form_error}
			</div>
			{/if}
			
			<h4>{$translations.publish.step1}</h4>
			<form id="publish_form" method="post" action="{$BASE_URL}post/">

					<span class="field">
					<span class="control">
					 <span class="select">
				 	  <select name="type_id" id="type_id">
						{section name=tmp2 loop=$types}
						<option value="{$types[tmp2].id}" {if !$job.type_id && !$smarty.post.type_id}{if $smarty.section.tmp2.first}selected="selected"{/if}{else}{if $types[tmp2].id == $job.type_id}selected="selected"{/if}{if $types[tmp2].id == $smarty.post.type_id}selected="selected"{/if}{/if}>{$types[tmp2].name}</option>
						{/section}
					  </select>
					 </span>
					</span>
					</span>

					<span class="field">
					<span class="control">
					 <span class="select">
						<select name="category_id" id="category_id">
							{section name=tmp1 loop=$categories}
							<option value="{$categories[tmp1].id}" {if $default_categ_id != '' && $default_categ_id == $categories[tmp1].id}selected="selected"{else}{if $categories[tmp1].id == $job.category_id}selected="selected"{/if}{if $categories[tmp1].id == $smarty.post.category_id}selected="selected"{/if}{/if}>{$categories[tmp1].name}</option>
							{/section}
						</select>
					 </span>
					</span>
					</span>
					<div class="field">
					 <div class="control">
					  <input class="input" type="text" name="title" id="title" value="{if $job.company}{$job.title|escape}{else}{$smarty.post.title|escape}{/if}" placeholder="{$translations.publish.title_label}" autofocus/>
					  {if $errors.title}<div class="notification is-danger">Please enter a job title.</div>{/if}
 					 </div>
					</div>

					<span class="control">
						<span class="select">
							<select name="country_id" id="country_id">
							<option value="0">{$translations.jobs.location_anywhere}</option>
							{section name="c" loop=$countries}
							<option value="{$countries[c].id}" {if $smarty.post.country_id == $countries[c].id || $job.country_id == $countries[c].id}selected="selected"{else}{if $user_country.id == $countries[c].id AND !$smarty.post.country_id AND !$job.country_id}selected="selected"{/if}{/if}>{$countries[c].name}</option>
							{/section}
							</select>
						</span>
					</span>

					<div class="field">
							<span class="control">
								<input class="input" type="text" name="city" id="city" {if $smarty.post.city != ''}value="{$smarty.post.city|escape}"{/if} placeholder="{$translations.publish.where} {$translations.publish.where_info}" />
							</span>
					</div>
					
					<div class="field">
						<div class="control">
							<textarea name="description" id="description" rows="15" class="textarea" placeholder="{$translations.publish.description_label} ">{if $job.company}{$job.description}{else}{$smarty.post.description}{/if}</textarea>
							{if $errors.description}<div class="notification is-danger">Please enter a description.</div>{/if}
							</div>
						</div>
				<div class="field">
					<label class="label">{$translations.publish.company}</label>
					<div class="control">
						<input type="text" name="company" id="company" class="input" value="{if $job.company}{$job.company|escape}{else}{$smarty.post.company|escape}{/if}" placeholder="{$translations.publish.name_label}" />
						{if $errors.company}<div class="notification is-danger">Please enter a company or project name.</div>{/if}
					</div>
				</div>
				<div class="field">
					<div class="control">
						<input type="text" name="url" id="url" class="input" value="{if $job.company}{$job.url}{else}{$smarty.post.url}{/if}" placeholder="{$translations.publish.website_label} {$translations.publish.website_info}"/>
					</div>
				</div>
				<div class="field">
					<div class="control">
						<input type="email" name="poster_email" id="poster_email" class="input" value="{if $job.poster_email}{$job.poster_email}{else}{$smarty.post.poster_email}{/if}" placeholder="{$translations.publish.email_label} ({$translations.publish.email_info1})"/>
						{if $errors.poster_email}<div class="notification is-danger">Please enter an email address here.</div>{/if}
					</div>
				</div>
				{if $ENABLE_RECAPTCHA}
				<div class="field">
					<label class="label">{$translations.captcha.captcha_title}</label>
					<div class="control">
						{$the_captcha} {if $errors.captcha}<div class="notification is-danger">{$errors.captcha}</div>{/if}
					</div>
				</div>
				{/if}

				<div class="field">
				<div class="control">
				<input type="submit" name="submit" id="submit" class="button is-link" value="{$translations.publish.step1_submit}" />
				</div>
				</div>
				<fieldset class="hidden">					
					<input type="hidden" name="action" {if $job.id || $smarty.session.later_edit}value="edit"{else}value="publish"{/if} />
					{if $smarty.session.later_edit}<input type="hidden" name="auth" value="{$smarty.session.later_edit}" />{/if}
					{if $job.id}<input type="hidden" name="job_id" value="{$job.id}" />{/if}
				</fieldset>
			</form>
		</div><!-- /content -->

	</div>


<div class="column is-3">

	<p class="menu-label">
		{$translations.publish.syntax}
	</p>

		<ul class="menu-list">
			<li>That is _<em>incredible<em>_</li>
			<li>*<strong>Indeed</strong>* it is</li>
			<li>"Wikipedia":https://www.wikipedia.org</li>
			
			<li>* apples<br />* oranges<br />* pears</li>
			<li># first<br /># second<br /># third</li>
		</ul>
</div>

</div>
</section>

{include file="footer.tpl"}