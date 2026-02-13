<nav aria-label="<@liferay.language key="site-pages" />" class="orator-sidebar ${nav_css_class}" id="navigation" role="navigation">
	<button id="sidebarToggle" class="sidebar-toggle" aria-expanded="true" aria-label="Toggle navigation">☰</button>

	<div class="brand">
		<div class="brand-title">ORATOR</div>
		<div class="brand-sub">Digital Signage CMS</div>
	</div>

	<ul class="orator-nav" role="menubar">
		<#list nav_items as nav_item>
			<#assign
				nav_item_attr_has_popup = ""
				nav_item_css_class = ""
				nav_item_layout = nav_item.getLayout()
			/>

			<#if nav_item.isSelected()>
				<#assign
					nav_item_attr_has_popup = "aria-haspopup='true'"
					nav_item_css_class = "selected"
				/>
			</#if>

			<li class="orator-item ${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<a ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
					<span class="icon"><@liferay_theme["layout-icon"] layout=nav_item_layout /></span>
					<span class="pageName">${nav_item.getName()}</span>
				</a>

				<#if nav_item.hasChildren()>
					<ul class="child-menu" role="menu">
						<#list nav_item.getChildren() as nav_child>
							<#assign
								nav_child_css_class = ""
							/>

							<#if nav_item.isSelected()>
								<#assign
									nav_child_css_class = "selected"
								/>
							</#if>

							<li class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
								<a href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
							</li>
						</#list>
					</ul>
				</#if>
			</li>
		</#list>
	</ul>

	<div class="sidebar-footer">
		<a href="#" class="settings" role="button"><i class="fa fa-cog" aria-hidden="true"></i> <span>Settings</span></a>
	</div>

	<div class="sidebar-footer">
		<a href="/c/portal/logout" class="settings" role="button"><i class="fa fa-sign-out" aria-hidden="true"></i> <span>Log out</span></a>
	</div>
</nav>