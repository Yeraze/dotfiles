#
function mlvcm --description "See if mlvc is ready"
  lsmod | grep mlvcm
  dmesg | grep mlvcm | grep Driver
end

