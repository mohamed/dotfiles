set history filename ~/.gdb_history
set history size 1000000
set history save

python
import sys
sys.path.insert(0, '/global/freeware/Linux/RHEL7/gcc-6.2.0/share/gcc-6.2.0/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
