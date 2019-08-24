set pagination off
set confirm off

set print pretty on
set print thread-events off
set print elements 0

define xxd
dump binary memory /tmp/mike.dump.bin $arg0 $arg0+$arg1
shell xxd /tmp/mike.dump.bin
end
