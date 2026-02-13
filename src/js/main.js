/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

/*
 * This function gets loaded when all the HTML, not including the portlets, is
 * loaded.
 */
AUI().ready(function () {});

/*
 * This function gets loaded after each and every portlet on the page.
 *
 * portletId: the current portlet's id
 * node: the Alloy Node object of the current portlet
 */
Liferay.Portlet.ready(function (_portletId, _node) {});

/*
 * This function gets loaded when everything, including the portlets, is on
 * the page.
 */
Liferay.on('allPortletsReady', function () {});

// Sidebar toggle for responsive behaviour
(function () {
	function toggleSidebar(open) {
		var isOpen = typeof open === 'boolean' ? open : !document.body.classList.contains('sidebar-open');
		if (isOpen) {
			document.body.classList.add('sidebar-open');
		} else {
			document.body.classList.remove('sidebar-open');
		}
	}

	document.addEventListener('DOMContentLoaded', function () {
		var toggle = document.getElementById('sidebarToggle');
		if (toggle) {
			toggle.addEventListener('click', function () {
				var expanded = toggle.getAttribute('aria-expanded') === 'true';
				toggle.setAttribute('aria-expanded', (!expanded).toString());
				toggleSidebar();
			});
		}

		// Close sidebar when clicking outside on small screens
		document.addEventListener('click', function (e) {
			if (!document.body.classList.contains('sidebar-open')) return;
			var sidebar = document.querySelector('.orator-sidebar');
			if (!sidebar) return;
			if (!sidebar.contains(e.target) && e.target !== toggle) {
				toggleSidebar(false);
				if (toggle) toggle.setAttribute('aria-expanded', 'false');
			}
		});
	});
})();
