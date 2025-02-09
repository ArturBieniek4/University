import os
import sys

# Dodaj katalog główny projektu do ścieżki importu
sys.path.insert(
    0,
    os.path.abspath(
        os.path.join(
            os.path.dirname(__file__),
            '..')))
