#!/bin/bash

/etc/init.d/cron start
/usr/bin/supervisord -n
