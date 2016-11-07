
class cactos_runtime_controller::service inherits cactos_runtime_controller{

  # Run the node js app as service
  service { 'rtc':
    #require    => [
                    #Nodejs::Npm['shelljs'],
                    #Nodejs::Npm['httpdispatcher'],
                    #Package['sed'],
                    #Package['grep'],
                    #Package['bash'],
                    ## add config to dependency
                  #],
    ensure     => running,
    start      => "nohup node /opt/rtc/runtime-controller/src/server.js 2>&1 >> /var/log/runtime-controller-nodejs.log &",
    stop       => "/usr/bin/pkill -f server.js",
    pattern    => "server.js", #todo improve pattern to avoid ambiguity
    provider   => 'base',
  }
}
