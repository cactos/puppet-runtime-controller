# Class: cactos_runtime_controller
# ===========================
#
# Installs the cactos runtime controller
#
# Parameters
# ----------
#
# * `optConfigDir`
#   Specify the location of cactosfp7 configuration
# 
# Examples
# --------
#
# @example
#    class { 'cactos_runtime_controller':
#      $optConfigDir => '/var/eu.cactosfp7.configuration/',
#    }
#
# Authors
# -------
#
# Simon Volpert <simon.volpert@uni-ulm.de>
# Frank Griesinger <frank.griesinger@uni-ulm.de>
#
class cactos_runtime_controller (

  $optConfigDir = $cactos_runtime_controller::params::optConfigDir,

)inherits cactos_runtime_controller::params{
  
    contain cactos_runtime_controller::install
    contain cactos_runtime_controller::config
    contain cactos_runtime_controller::service
    Class['::cactos_runtime_controller::install']->
    Class['::cactos_runtime_controller::config']->
    Class['::cactos_runtime_controller::service']

  ##TODO change PORT name
  ## file server.js line "const PORT=8080;"
  
  ##TODO change global config
  ## file global.js line "var config = {..."
  
  ##TODO change colosseum config
  ## file colosseum.js line all
  
}
