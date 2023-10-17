# Imports
import datetime as dt
import math
import os
import random
import re
import sys
import tempfile
from collections import *
from functools import partial
from itertools import *
from math import *
from pprint import pprint as pretty_print

# Force jupyter to print any lone variable, not just the last one in a cell
try:
    print('ho')
    from IPython.core.interactiveshell import InteractiveShell
    InteractiveShell.ast_node_interactivity = "all"
except ImportError:
    pass

# Check if I'm in a venv
VENV = os.environ.get("VIRTUAL_ENV")

#  Make sure I always have a temp folder ready to go
TEMP_DIR = os.path.join(tempfile.gettempdir(), "pythontemp")
try:
    os.makedirs(TEMP_DIR)
except Exception as e:
    pass
