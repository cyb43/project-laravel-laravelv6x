window._ = require('lodash');

/**
 * ^2_3^ 修改好，需要执行 npm run dev 编译进 public/js/app.js文件;
 * We'll load jQuery and the Bootstrap jQuery plugin which provides support
 * for JavaScript based Bootstrap features such as modals and tabs. This
 * code may be modified to fit the specific needs of your application.
 */

try {
    window.Popper = require('popper.js').default;
    window.$ = window.jQuery = require('jquery');

    require('bootstrap');
} catch (e) {}

/**
 * We'll load the axios HTTP library which allows us to easily issue requests
 * to our Laravel back-end. This library automatically handles sending the
 * CSRF token as a header based on the value of the "XSRF" token cookie.
 */

window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

/**
 * Echo exposes(暴露) an expressive API for subscribing to channels and listening
 * for events that are broadcast by Laravel. Echo and event broadcasting
 * allows your team to easily build robust(强健的) real-time web applications.
 */

// import Echo from 'laravel-echo';

// window.Pusher = require('pusher-js');

// window.Echo = new Echo({
//     broadcaster: 'pusher',
//     key: process.env.MIX_PUSHER_APP_KEY,
//     cluster: process.env.MIX_PUSHER_APP_CLUSTER,
//     encrypted: true
// });

//// Socket.IO
/// 如果你想将 Redis 广播器 和 Socket.IO 服务器进行配对，你需要在你的应用程序中引入 Socket.IO JavaScript 客户端库。
// 你可以通过 NPM 包管理器进行安装，npm install --save socket.io-client 。
/// 你需要在实例化 Echo 时指定 socket.io 连接器和 host 。(安装laravel-echo后，执行npm run dev编译)
import Echo from "laravel-echo";
window.io = require('socket.io-client');
window.Echo = new Echo({
    broadcaster: 'socket.io',
    host: window.location.hostname + ':6001',
    auth: {
        headers: {
            'X-CSRF-TOKEN': $('meta[name=csrf-token]').attr('content'),
            'Authorization': "Bearer 8a7b8de478387febf0b09987585f995b"
        }
    }
});

console.log('window.location.hostname ' + window.location.hostname);
