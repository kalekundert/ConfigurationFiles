# a list of the services
rh_services=(`ls /etc/init.d`)

# rip out the current runlevel
runlevel=`runlevel | awk '{print $2}'`

# find all the services in the current runlevel
rl_services=(`
        ls /etc/rc$runlevel.d/S* |
        xargs -n 1 basename |
        perl -ne 's/^S\d+//; print' `)

compctl -k "($rh_services)" chkconfig
compctl -k "($rl_services)" service
