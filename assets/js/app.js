// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html";

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

// Custom

         (function() {
             var tfs = document.querySelectorAll(
                 '.mdc-text-field:not([data-demo-no-auto-js])'
             );
             for (var i = 0, tf; tf = tfs[i]; i++) {
                 mdc.textField.MDCTextField.attachTo(tf);
             }
         })();

        (function() {
             var pollId = 0;
             pollId = setInterval(function() {
                 var pos = getComputedStyle(document.querySelector('.mdc-toolbar')).position;
                 if (pos === 'fixed' || pos === 'relative') {
                     init();
                     clearInterval(pollId);
                 }
             }, 250);
             function init() {
                 var ratioSpan = document.querySelector("#ratio");
                 var toolbar = mdc.toolbar.MDCToolbar.attachTo(document.querySelector('.mdc-toolbar'));
                 toolbar.listen('MDCToolbar:change', function(evt) {
                     var flexibleExpansionRatio = evt.detail.flexibleExpansionRatio;
                     ratioSpan.innerHTML = flexibleExpansionRatio.toFixed(2);
                 });
                 toolbar.fixedAdjustElement = document.querySelector('.mdc-toolbar-fixed-adjust');
             }
         })();
 
