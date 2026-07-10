// ==================== SHINIGAMI ESSE v2.0 - ENHANCED MENU ====================
(function () {
    'use strict';

    // ==================== DEMO DATA ====================
    const demoCategories = [
        { label: "List" },
        { label: "Safe" },
        { label: "Trolling" },
        { label: "Risky" },
        { label: "Vehicle" },
        { label: "ALL" }
    ];

    const demoMenuItems = [
        { label: "Teleport to Player", type: "button", desc: "Instantly move to the selected player's position" },
        { label: "Spectate Player",    type: "checkbox", checked: true, desc: "Watch from the player's camera perspective" },
        { label: "Copy Appearance",    type: "button",   desc: "Clone the player's ped model and clothes" },
        { label: "Kill Player",        type: "button",   desc: "Remotely eliminate the target" },
        { label: "Launch Player (V1)", type: "button",   desc: "Send the player flying into the sky" },
        {
            label: "Bug Player", type: "scrollable",
            values: ["Bug Player I", "Bug Player II", "Bug Player III", "Bug Player IV", "Bug Player V"],
            value: 1,
            desc: "Choose bug intensity level"
        },
        { type: "divider", label: "Navigation" },
        { label: "Waypoint to Player",  type: "button",   desc: "Set a GPS waypoint to the player" },
        { label: "Track Player (Blip)", type: "checkbox", checked: false, desc: "Show player on the minimap" },
        { label: "Speed Factor",        type: "slider",   value: 50, min: 0, max: 100, step: 5, desc: "Adjust movement speed multiplier" }
    ];

    // ==================== STATE ====================
    let currentCategories  = demoCategories;
    let currentCategoryIndex = 0;
    let currentMenuItems   = demoMenuItems;
    let selectedIndex      = 0;
    let isSelectingKey     = false;
    let pendingKeyCallback = null;

    // ==================== DOM ELEMENTS ====================
    const mainMenu              = document.getElementById('mainMenu');
    const menuContainer         = document.getElementById('menuContainer');
    const categoryTabsContainer = document.getElementById('categoryTabs');
    const menuListEl            = document.getElementById('menuList');
    const footerCreditSpan      = document.getElementById('footerCredit');
    const itemCounterSpan       = document.getElementById('itemCounter');
    const keySelectorOverlay    = document.getElementById('keySelectorOverlay');
    const keyDisplay            = document.getElementById('keyDisplay');
    const keyboardOverlay       = document.getElementById('keyboardOverlay');
    const keyboardTitle         = document.getElementById('keyboardTitle');
    const keyboardValue         = document.getElementById('keyboardValue');
    const menuBanner            = document.getElementById('menuBanner');
    const bannerImage           = document.getElementById('bannerImage');
    const notificationContainer = document.getElementById('notificationContainer');
    const descBar               = document.getElementById('descBar');
    const categoryBadge         = document.getElementById('categoryBadge');
    const categoryBadgeName     = document.getElementById('categoryBadgeName');

    // ==================== HELPERS ====================
    const getParentResource = () =>
        window.GetParentResourceName ? window.GetParentResourceName() : 'shinigami_esse';

    const isInFiveM = () =>
        typeof window.GetParentResourceName === 'function' ||
        window.location.protocol === 'nui:';

    function emitToClient(actionType, extraData = {}) {
        const currentItem = currentMenuItems[selectedIndex] || null;
        const payload = {
            action: actionType,
            categoryIndex: currentCategoryIndex,
            selectedIndex: selectedIndex,
            ...extraData
        };
        if (currentItem) {
            payload.itemLabel = currentItem.label;
            payload.itemType  = currentItem.type;
            if (currentItem.type === 'checkbox')   payload.checked      = currentItem.checked;
            if (currentItem.type === 'scrollable') payload.scrollValue  = currentItem.value;
            if (currentItem.type === 'slider')     payload.sliderValue  = currentItem.value;
        }
        if (window.GetParentResourceName) {
            fetch(`https://${getParentResource()}/${actionType}`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=UTF-8' },
                body: JSON.stringify(payload)
            }).catch(() => {});
        } else {
            console.log('[Menu Action]', actionType, payload);
        }
    }

    // ==================== RIPPLE ====================
    function spawnRipple(el) {
        const r = document.createElement('span');
        r.className = 'ripple';
        const size = Math.max(el.offsetWidth, el.offsetHeight);
        r.style.width  = r.style.height = size + 'px';
        r.style.left   = (el.offsetWidth  / 2 - size / 2) + 'px';
        r.style.top    = (el.offsetHeight / 2 - size / 2) + 'px';
        el.appendChild(r);
        setTimeout(() => r.remove(), 450);
    }

    // ==================== DESCRIPTION BAR ====================
    function updateDescBar() {
        const item = currentMenuItems[selectedIndex];
        if (descBar) {
            if (item && item.desc) {
                descBar.textContent = item.desc;
                descBar.style.opacity = '1';
            } else if (item && item.label && item.type !== 'divider') {
                descBar.textContent = item.label;
                descBar.style.opacity = '0.45';
            } else {
                descBar.textContent = '';
                descBar.style.opacity = '0';
            }
        }
    }

    // ==================== CATEGORY BADGE ====================
    function updateCategoryBadge() {
        if (!categoryBadgeName) return;
        const cat = currentCategories[currentCategoryIndex];
        categoryBadgeName.textContent = cat ? cat.label.toUpperCase() : '';
    }

    // ==================== NOTIFICATIONS ====================
    const NOTIF_ICONS = { success: '✓', error: '✕', info: 'ℹ', warning: '⚠' };

    function showNotification(type, title, desc, duration) {
        const notif = document.createElement('div');
        notif.className = `notification ${type || 'info'}`;

        const icon = document.createElement('span');
        icon.className   = 'notification-icon';
        icon.textContent = NOTIF_ICONS[type] || NOTIF_ICONS.info;

        const body = document.createElement('div');
        body.className   = 'notification-body';
        if (title) {
            const t = document.createElement('div');
            t.className   = 'notification-title';
            t.textContent = title;
            body.appendChild(t);
        }
        if (desc) {
            const d = document.createElement('div');
            d.className   = 'notification-desc';
            d.textContent = desc;
            body.appendChild(d);
        }
        if (!title && !desc) {
            const d = document.createElement('div');
            d.className   = 'notification-desc';
            d.textContent = type;
            body.appendChild(d);
        }

        notif.appendChild(icon);
        notif.appendChild(body);
        notificationContainer.appendChild(notif);

        const timeout = duration || 3000;
        setTimeout(() => {
            notif.style.animation = 'notifFadeOut 0.3s ease forwards';
            setTimeout(() => notif.remove(), 300);
        }, timeout);
    }

    // ==================== KEYBOARD INPUT ====================
    function showKeyboard(title, value) {
        keyboardTitle.textContent = title || 'INPUT';
        keyboardValue.textContent = value || '';
        keyboardOverlay.style.display = 'flex';
    }

    function hideKeyboard() {
        keyboardOverlay.style.display = 'none';
    }

    function updateKeyboardValue(value) {
        keyboardValue.textContent = value || '';
    }

    // ==================== KEY SELECTOR ====================
    function showKeySelector(callback) {
        isSelectingKey = true;
        pendingKeyCallback = callback;
        keySelectorOverlay.style.display = 'flex';
        keyDisplay.innerHTML = `<span class="key-placeholder">⌨</span>`;
        keyDisplay.classList.remove('has-key');
    }

    function hideKeySelector() {
        isSelectingKey = false;
        keySelectorOverlay.style.display = 'none';
        pendingKeyCallback = null;
    }

    function onKeySelected(key) {
        if (pendingKeyCallback) pendingKeyCallback(key);
        hideKeySelector();
    }

    // ==================== COUNTER ====================
    function updateCounter() {
        if (!currentMenuItems.length) {
            itemCounterSpan.innerText = '00/00';
            return;
        }
        const visibleItems = currentMenuItems.filter(i => i.type !== 'divider').length;
        const currentVisibleIndex = currentMenuItems
            .filter((item, idx) => item.type !== 'divider' && idx <= selectedIndex).length;
        const fmt = n => String(n).padStart(2, '0');
        itemCounterSpan.innerText = `${fmt(currentVisibleIndex)}/${fmt(visibleItems)}`;
    }

    // ==================== SCROLL TO ACTIVE ====================
    function scrollToActiveItem() {
        const activeItem = menuListEl && menuListEl.querySelector('.menu-item.active');
        if (activeItem) activeItem.scrollIntoView({ block: 'nearest', behavior: 'smooth' });
    }

    // ==================== RENDER CATEGORY TABS ====================
    function renderCategoryTabs() {
        if (!categoryTabsContainer) return;
        categoryTabsContainer.innerHTML = '';

        if (!currentCategories || !currentCategories.length) {
            categoryTabsContainer.style.display = 'none';
            if (categoryBadge) categoryBadge.style.display = 'none';
            return;
        }

        categoryTabsContainer.style.display = 'flex';
        if (categoryBadge) categoryBadge.style.display = 'flex';
        updateCategoryBadge();

        currentCategories.forEach((cat, idx) => {
            const tab = document.createElement('div');
            tab.className = `category-tab${idx === currentCategoryIndex ? ' active' : ''}`;
            tab.innerText = cat.label || 'Menu';
            tab.addEventListener('click', () => {
                if (idx !== currentCategoryIndex) {
                    currentCategoryIndex = idx;
                    emitToClient('changeCategory', { newCategoryIndex: idx });
                    renderCategoryTabs();
                }
            });
            categoryTabsContainer.appendChild(tab);
        });

        const activeTab = categoryTabsContainer.querySelector('.category-tab.active');
        if (activeTab) activeTab.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' });
    }

    // ==================== RENDER ITEM RIGHT ====================
    function renderItemRight(item) {
        const rightDiv = document.createElement('div');
        rightDiv.className = 'item-right';

        if (item.type === 'button') {
            const a = document.createElement('span');
            a.className   = 'indicator-arrow';
            a.textContent = '▶';
            rightDiv.appendChild(a);
        } else if (item.type === 'checkbox') {
            const isChecked = !!item.checked;
            const toggleSwitch = document.createElement('div');
            toggleSwitch.className = 'toggle-switch' + (isChecked ? ' on' : '');
            const toggleThumb = document.createElement('div');
            toggleThumb.className = 'toggle-thumb';
            toggleSwitch.appendChild(toggleThumb);
            rightDiv.appendChild(toggleSwitch);
        } else if (item.type === 'scrollable') {
            const vals = item.values || ['Option 1', 'Option 2', 'Option 3'];
            const idx  = (item.value !== undefined && item.value >= 0 && item.value < vals.length) ? item.value : 0;
            const badge = document.createElement('span');
            badge.className   = 'scrollable-badge';
            badge.textContent = `◀ ${vals[idx]} ▶`;
            rightDiv.appendChild(badge);
        } else if (item.type === 'slider') {
            const val   = item.value !== undefined ? item.value : (item.min || 0);
            const badge = document.createElement('span');
            badge.className   = 'slider-badge';
            badge.textContent = String(val);
            rightDiv.appendChild(badge);
        } else if (item.type === 'divider') {
            return null;
        } else {
            const f = document.createElement('span');
            f.className   = 'indicator-arrow';
            f.textContent = '›';
            rightDiv.appendChild(f);
        }

        return rightDiv;
    }

    // ==================== RENDER MENU ITEMS ====================
    function renderMenuItems() {
        if (!menuListEl) return;
        menuListEl.innerHTML = '';

        if (!currentMenuItems.length) {
            const empty = document.createElement('li');
            empty.className = 'menu-item';
            empty.style.justifyContent = 'center';
            empty.style.opacity = '0.5';
            empty.innerHTML = '<span>No options available</span>';
            menuListEl.appendChild(empty);
            updateCounter();
            updateDescBar();
            return;
        }

        // Clamp index
        if (selectedIndex >= currentMenuItems.length) selectedIndex = currentMenuItems.length - 1;
        if (selectedIndex < 0) selectedIndex = 0;

        // Skip dividers
        let safetyLoop = 0;
        while (currentMenuItems[selectedIndex] && currentMenuItems[selectedIndex].type === 'divider' && safetyLoop < 50) {
            selectedIndex = (selectedIndex + 1) % currentMenuItems.length;
            safetyLoop++;
        }

        currentMenuItems.forEach((item, idx) => {
            if (item.type === 'divider') {
                const divider = document.createElement('li');
                divider.className   = 'menu-divider';
                divider.textContent = item.label || '──────────';
                menuListEl.appendChild(divider);
                return;
            }

            const li       = document.createElement('li');
            const isActive = (idx === selectedIndex);
            li.className   = `menu-item${isActive ? ' active' : ''}`;

            // Stagger animation
            li.style.animationDelay = `${idx * 28}ms`;

            // Label block (with optional desc)
            const labelBlock = document.createElement('div');
            labelBlock.className = 'item-label';

            const labelText = document.createElement('span');
            labelText.className   = 'item-label-text';
            labelText.textContent = item.label;
            labelBlock.appendChild(labelText);

            if (item.desc) {
                const descText = document.createElement('span');
                descText.className   = 'item-desc-text';
                descText.textContent = item.desc;
                labelBlock.appendChild(descText);
            }

            const rightDiv = renderItemRight(item);
            li.appendChild(labelBlock);
            if (rightDiv) li.appendChild(rightDiv);

            // Hover
            li.addEventListener('mouseenter', () => {
                if (selectedIndex !== idx) {
                    const prev = menuListEl.querySelector('.menu-item.active');
                    if (prev) prev.classList.remove('active');
                    selectedIndex = idx;
                    li.classList.add('active');
                    updateCounter();
                    updateDescBar();
                }
            });

            // Click
            li.addEventListener('click', (e) => {
                if (selectedIndex !== idx) {
                    const prev = menuListEl.querySelector('.menu-item.active');
                    if (prev) prev.classList.remove('active');
                    selectedIndex = idx;
                    li.classList.add('active');
                    updateCounter();
                    updateDescBar();
                }
                spawnRipple(li);
                if (item.type !== 'divider') executeAction(item);
            });

            menuListEl.appendChild(li);
        });

        updateCounter();
        updateDescBar();
        scrollToActiveItem();
    }

    // ==================== EXECUTE ACTION ====================
    function executeAction(item) {
        if (item.type === 'checkbox') {
            item.checked = !item.checked;
            renderMenuItems();
            emitToClient('toggleCheckbox', { label: item.label, newState: item.checked });
        } else if (item.type === 'scrollable') {
            scrollRight(item);
        } else if (item.type === 'slider') {
            emitToClient('sliderSelect', { label: item.label, currentValue: item.value });
        } else {
            emitToClient('selectItem', {});
        }
    }

    // ==================== SCROLLABLE CYCLE ====================
    function scrollRight(item) {
        if (item.type !== 'scrollable') return;
        const vals = item.values || [];
        if (!vals.length) return;
        item.value = ((item.value || 0) + 1) % vals.length;
        renderMenuItems();
        emitToClient('scrollableChange', { label: item.label, selectedValue: vals[item.value], index: item.value });
    }

    function scrollLeft(item) {
        if (item.type !== 'scrollable') return;
        const vals = item.values || [];
        if (!vals.length) return;
        item.value = ((item.value || 0) - 1 + vals.length) % vals.length;
        renderMenuItems();
        emitToClient('scrollableChange', { label: item.label, selectedValue: vals[item.value], index: item.value });
    }

    // ==================== SLIDER ADJUST ====================
    function sliderAdjust(item, direction) {
        if (item.type !== 'slider') return;
        const step = item.step || 1;
        const min  = item.min  !== undefined ? item.min  : 0;
        const max  = item.max  !== undefined ? item.max  : 100;
        let val    = item.value !== undefined ? item.value : min;

        if (direction === 'right') val = Math.min(max, val + step);
        else                       val = Math.max(min, val - step);

        item.value = val;
        renderMenuItems();
        emitToClient('sliderChange', { label: item.label, value: val });
    }

    // ==================== NAVIGATION ====================
    function navigateUp() {
        if (!currentMenuItems.length) return;
        let newIdx = selectedIndex - 1;
        if (newIdx < 0) newIdx = currentMenuItems.length - 1;
        let attempts = 0;
        while (currentMenuItems[newIdx] && currentMenuItems[newIdx].type === 'divider' && attempts < 50) {
            newIdx = newIdx - 1;
            if (newIdx < 0) newIdx = currentMenuItems.length - 1;
            attempts++;
        }
        if (newIdx !== selectedIndex && currentMenuItems[newIdx] && currentMenuItems[newIdx].type !== 'divider') {
            selectedIndex = newIdx;
            renderMenuItems();
        }
    }

    function navigateDown() {
        if (!currentMenuItems.length) return;
        let newIdx = selectedIndex + 1;
        if (newIdx >= currentMenuItems.length) newIdx = 0;
        let attempts = 0;
        while (currentMenuItems[newIdx] && currentMenuItems[newIdx].type === 'divider' && attempts < 50) {
            newIdx = newIdx + 1;
            if (newIdx >= currentMenuItems.length) newIdx = 0;
            attempts++;
        }
        if (newIdx !== selectedIndex && currentMenuItems[newIdx] && currentMenuItems[newIdx].type !== 'divider') {
            selectedIndex = newIdx;
            renderMenuItems();
        }
    }

    function switchCategory(direction) {
        if (!currentCategories || !currentCategories.length) return;
        if (direction === 'prev') {
            currentCategoryIndex = (currentCategoryIndex - 1 + currentCategories.length) % currentCategories.length;
        } else {
            currentCategoryIndex = (currentCategoryIndex + 1) % currentCategories.length;
        }
        emitToClient('changeCategory', { newCategoryIndex: currentCategoryIndex });
        renderCategoryTabs();
    }

    // ==================== LETTER-JUMP NAVIGATION ====================
    let letterJumpBuffer = '';
    let letterJumpTimer  = null;

    function letterJump(char) {
        letterJumpBuffer += char.toLowerCase();
        clearTimeout(letterJumpTimer);
        letterJumpTimer = setTimeout(() => { letterJumpBuffer = ''; }, 600);

        const query = letterJumpBuffer;
        const nonDividers = currentMenuItems
            .map((item, idx) => ({ item, idx }))
            .filter(({ item }) => item.type !== 'divider' && item.label);

        // Find first matching item starting after current selection
        let match = nonDividers.find(({ item, idx }) =>
            idx > selectedIndex && item.label.toLowerCase().startsWith(query)
        );
        // Wrap around
        if (!match) {
            match = nonDividers.find(({ item }) => item.label.toLowerCase().startsWith(query));
        }
        if (match && match.idx !== selectedIndex) {
            selectedIndex = match.idx;
            renderMenuItems();
        }
    }

    // ==================== KEYBOARD HANDLER ====================
    function onKeyDown(e) {
        // Key selector mode
        if (isSelectingKey) {
            e.preventDefault(); e.stopPropagation();
            if (e.key === 'Escape') { hideKeySelector(); return; }
            const keyNames = {
                Escape:'ESC', ArrowUp:'↑', ArrowDown:'↓', ArrowLeft:'←', ArrowRight:'→',
                Enter:'ENTER', Backspace:'BACKSPACE', Shift:'SHIFT', Control:'CTRL', Alt:'ALT',
                Tab:'TAB', CapsLock:'CAPS', Delete:'DEL', Home:'HOME', End:'END',
                PageUp:'PGUP', PageDown:'PGDN', Insert:'INS', ' ':'SPACE',
                Meta:'WIN', ContextMenu:'MENU', NumLock:'NUMLOCK'
            };
            const displayName = keyNames[e.key] || (e.key.length === 1 ? e.key.toUpperCase() : e.key);
            keyDisplay.innerHTML = `<span class="key-placeholder">${displayName}</span>`;
            keyDisplay.classList.add('has-key');
            setTimeout(() => onKeySelected(e.key), 150);
            return;
        }

        const navKeys = ['ArrowUp','ArrowDown','ArrowLeft','ArrowRight','Enter','Escape','Backspace','e','E','q','Q','PageUp','PageDown'];
        if (navKeys.includes(e.key)) { e.preventDefault(); e.stopPropagation(); }

        const activeItem = currentMenuItems[selectedIndex];

        switch (e.key) {
            case 'ArrowUp':    navigateUp();   break;
            case 'ArrowDown':  navigateDown(); break;

            case 'ArrowLeft':
                if (activeItem) {
                    if (activeItem.type === 'scrollable') { scrollLeft(activeItem); }
                    else if (activeItem.type === 'slider') { sliderAdjust(activeItem, 'left'); }
                }
                break;

            case 'ArrowRight':
                if (activeItem) {
                    if (activeItem.type === 'scrollable') { scrollRight(activeItem); }
                    else if (activeItem.type === 'slider') { sliderAdjust(activeItem, 'right'); }
                }
                break;

            case 'Enter':
                if (activeItem) {
                    const activeLi = menuListEl && menuListEl.querySelector('.menu-item.active');
                    if (activeLi) spawnRipple(activeLi);
                    executeAction(activeItem);
                }
                break;

            case 'Escape': case 'Backspace':
                if (window.GetParentResourceName) {
                    fetch(`https://${getParentResource()}/closeNUI`, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
                        body: JSON.stringify({})
                    }).catch(() => {});
                }
                if (!isInFiveM()) mainMenu.style.display = 'none';
                break;

            case 'q': case 'Q': switchCategory('prev'); break;
            case 'e': case 'E': switchCategory('next'); break;

            case 'PageUp':   switchCategory('prev'); break;
            case 'PageDown': switchCategory('next'); break;

            default:
                // Letter-jump: single printable character
                if (e.key.length === 1 && !e.ctrlKey && !e.altKey && !e.metaKey) {
                    letterJump(e.key);
                }
                break;
        }
    }

    // ==================== MESSAGE HANDLER ====================
    window.addEventListener('message', (event) => {
        const data = event.data;
        if (!data) return;

        function applyUIData(d) {
            if (d.elements)       currentMenuItems      = d.elements;
            if (d.categories)     currentCategories     = d.categories;
            if (d.categoryIndex !== undefined) currentCategoryIndex = d.categoryIndex;
            const idx = d.index !== undefined ? d.index : d.selectedIndex;
            if (idx !== undefined) selectedIndex = idx;
            if (d.username) footerCreditSpan.innerText = `/ ${d.username}`;
            if (currentMenuItems.length && selectedIndex >= currentMenuItems.length) selectedIndex = 0;
            renderCategoryTabs();
            renderMenuItems();
        }

        // showUI / type=ui
        if (data.action === 'showUI' || data.type === 'ui') {
            const visible = data.visible !== undefined ? data.visible : data.status;
            if (visible === true) {
                mainMenu.style.display = 'flex';
                applyUIData(data);
            } else {
                mainMenu.style.display = 'none';
            }
            return;
        }

        // updateElements
        if (data.action === 'updateElements') { applyUIData(data); return; }

        // syncIndex / keydown
        if (data.action === 'syncIndex' || data.action === 'keydown') {
            const idx = data.index !== undefined ? data.index : data.selectedIndex;
            if (idx !== undefined && currentMenuItems.length && idx < currentMenuItems.length) {
                selectedIndex = idx;
                renderMenuItems();
            }
            return;
        }

        // updateKeyboard
        if (data.action === 'updateKeyboard') {
            if (data.visible === true) { showKeyboard(data.title, data.value); }
            else { hideKeyboard(); }
            if (data.visible === true && data.value !== undefined) updateKeyboardValue(data.value);
            return;
        }

        // updateBanner
        if (data.action === 'updateBanner') {
            if (data.bannerLink) {
                bannerImage.src = data.bannerLink;
                menuBanner.style.display = 'block';
                if (data.bannerColor) menuBanner.style.backgroundColor = `rgb(${data.bannerColor})`;
            } else if (data.bannerColor) {
                menuBanner.style.display = 'block';
                menuBanner.style.backgroundColor = `rgb(${data.bannerColor})`;
                bannerImage.style.display = 'none';
            } else {
                menuBanner.style.display = 'none';
            }
            return;
        }

        // updateAuthFooter
        if (data.action === 'updateAuthFooter') {
            if (data.username) footerCreditSpan.innerText = `/ ${data.username}`;
            return;
        }

        // showNotification
        if (data.action === 'showNotification') {
            showNotification(data.type, data.title, data.desc, data.duration);
            return;
        }

        // showKeySelector
        if (data.action === 'showKeySelector') {
            showKeySelector((selectedKey) => emitToClient('keySelected', { key: selectedKey }));
            return;
        }

        // executeJS
        if (data.action === 'executeJS') {
            if (data.code) { try { eval(data.code); } catch (err) { console.error('[executeJS]', err); } }
            return;
        }
    });

    // ==================== INIT ====================
    window.addEventListener('keydown', onKeyDown);

    renderCategoryTabs();
    renderMenuItems();

    // Browser testing mode — show menu with demo data
    if (!isInFiveM()) {
        mainMenu.style.display = 'flex';
    }

    console.log('%c SHINIGAMI ESSE v2.0 LOADED ', 'color: #ff3e3e; font-size:16px; font-weight:bold; background:#0a0005; padding:4px 8px; border-radius:4px;');
    console.log('%c↑↓ Navigate  ←→ Scroll/Slider  Q/E Category  Type letter to jump', 'color:#ff9999; font-size:11px;');
})();