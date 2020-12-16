"""Custom OTA commands for golden"""

import common
import os
import sys
import time

LOCAL_DIR = os.path.dirname(os.path.abspath(__file__))
TARGET_DIR = os.getenv('OUT')
UTILITIES_DIR = os.path.join(TARGET_DIR, 'symbols')

def addFolderToZip(info, directory, basedir):
    list = os.listdir(directory)
 
    for entity in list:
        each = os.path.join(directory,entity)
 
        if os.path.isfile(each):
            print "Adding vendor file -> "+ os.path.join(basedir, entity)
            info.output_zip.write(each, os.path.join(basedir, entity))
        else:
            addFolderToZip(info,each,os.path.join(basedir, entity))

def FullOTA_InstallEnd(info):

  addFolderToZip(info, os.path.join(TARGET_DIR, "janice"),"janice")
  
  info.output_zip.write(os.path.join(TARGET_DIR, "updater-script-janice"), "META-INF/com/google/android/updater-script-janice")
  info.output_zip.write(os.path.join(TARGET_DIR, "janice.img"), "janice.img")
  

