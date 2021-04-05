// Timezone - ex: Europe/Paris
var tz = Intl.DateTimeFormat().resolvedOptions().timeZone;

// Vendor & Renderer - ex: Google Inc. / VirtualBox Graphics Adapter
var canvas = document.createElement('canvas');
var gl = canvas.getContext('webgl');
var debugInfo = gl.getExtension('WEBGL_debug_renderer_info');
var vendor = gl.getParameter(debugInfo.UNMASKED_VENDOR_WEBGL);
var renderer = gl.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL);

// Screen resolution - ex: 1920x1080
// Multiply with window.devicePixelRatio (eq. to 1 for desktop browser) for mobile devices
var width = screen.width;
var height = screen.height;

// Language - ex: fr-FR
var language = navigator.language;

// Platform - ex: Win32
// https://stackoverflow.com/questions/19877924/what-is-the-list-of-possible-values-for-navigator-platform-as-of-today
var platform = navigator.platform;

// RAM - ex: 8
// The lower bound is 0.25 (representing 256MB or less) and upper bound is 8 (representing 8GB or more).
var ram = navigator.deviceMemory;

// CPU cores - ex: 4
var cores = navigator.hardwareConcurrency;