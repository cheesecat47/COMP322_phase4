// https://engineering.linecorp.com/ko/blog/pm2-nodejs/
module.exports = {
    apps: [{
        name: 'app',
        script: './bin/www',
        instances: 2,
        exec_mode: 'cluster',
        watch_delay: 10000,
        wait_ready: true,
        listen_timeout: 50000,
        kill_timeout: 5000
    }]
}  