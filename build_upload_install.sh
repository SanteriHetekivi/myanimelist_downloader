#!/usr/bin/env bash

rm -rf dist &&
python3 -m build &&
python3 -m twine upload dist/* --verbose &&
pip install --upgrade myanimelist_downloader==0.0.1