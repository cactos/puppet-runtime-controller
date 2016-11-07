
class cactos_runtime_controller::config inherits cactos_runtime_controller{


  file_line { 'opt_options.js':
    ensure => present,
    path   => '/opt/rtc/runtime-controller/src/opt_options.js',
    line   => "const optConfigDir = \"$optConfigDir\"",
    match  => '^const\ optConfigDir\ \=',
  }
}
