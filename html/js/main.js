"use strict";

var QBRadialMenu = null;
var keybindConfig = false;
$(document).ready(function () {
    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case "ui":
                keybindConfig = event.data.keybind;
                if (event.data.radial) {
                    createMenu(event.data.items);
                    QBRadialMenu.open();
                } else {
                    QBRadialMenu.close(true);
                }
                $(document).on("keydown", function (e) {
                    switch (e.key) {
                        case keybindConfig:
                            QBRadialMenu.close();
                            break;
                    }
                });
        }
    });
});
function createMenu(items) {
    QBRadialMenu = new RadialMenu({
        parent: document.body,
        size: 375,
        menuItems: items,
        onClick: function (item) {
            if (item.shouldClose) {
                QBRadialMenu.close(true);
            }

            if (item.items == null && item.shouldClose != null) {
                $.post(
                    "https://dda_radialmenu/selectItem",
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
            QBRadialMenu.close();
            
            break;
    }
});