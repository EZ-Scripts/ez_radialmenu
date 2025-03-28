"use strict";

var EZRadialMenu = null;
var keybindConfig = false;
$(document).ready(function () {
    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case "ui":
                keybindConfig = event.data.keybind;
                if (event.data.radial) {
                    createMenu(event.data.items);
                    EZRadialMenu.open();
                } else {
                    EZRadialMenu.close(true);
                }
                $(document).on("keydown", function (e) {
                    switch (e.key) {
                        case keybindConfig:
                            EZRadialMenu.close();
                            break;
                    }
                });
        }
    });
});
function createMenu(items) {
    EZRadialMenu = new RadialMenu({
        parent: document.body,
        size: 375,
        menuItems: items,
        onClick: function (item) {
            if (item.shouldClose ) {
                EZRadialMenu.close(true);
            }

            if (item.items == null && item.shouldClose != null) {
                $.post(
                    `https://${GetParentResourceName()}/selectItem`,
                    JSON.stringify({
                        itemData: item,
                    })
                );
            }
        },
    });
}

// Close on escape pressed
$(document).on("keydown", function (e) {
    switch (e.key) {
        case "Escape":
            EZRadialMenu.close();

            break;
    }
});
