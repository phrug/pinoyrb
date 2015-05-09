#!/usr/bin/env puma

environment "production"
daemonize
pidfile "/home/ruby2/phrug/current/tmp/puma/pid"
state_path "/home/ruby2/phrug/current/tmp/puma/state"
bind "unix:///home/ruby2/phrug/current/tmp/puma/socket.sock"
activate_control_app
threads 1, 4
