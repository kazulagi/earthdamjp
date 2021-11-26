#!/bin/python
import os

pref_id = input("Enter a prefecture ID: (1-47)")
keyword = input("Enter a keyword:")
command = 'grep -r "'+str(keyword)+'" | grep data/0"'+str(pref_id)+'"'
os.system(command)