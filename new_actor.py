#!/usr/bin/env python3

import os
import re
import sys
import shutil
import argparse
import textwrap
from os import path
from pathlib import Path

createObject = True
useModAssets = False
useActorProfile = False

def convertActorName(name: str):
    actorSpec = "_".join(it[0].upper() + it[1:] for it in name.split("_"))
    actorDefine = "ACTOR_" + actorSpec.upper()
    objectSpec = "object" + "_" + name.lower()
    objectDefine = objectSpec.upper()
    actorFileName = "z_" + name.lower()

    return dict(
        actorSpec = actorSpec,
        actorDefine = actorDefine,
        objectSpec = objectSpec,
        objectDefine = objectDefine,
        actorFileName = actorFileName
    )

# check if folders exists, if not, create them and necessary files
def makeFilesAndFolders(folderName, fileName, objectName):
    filePathActor = Path(path.curdir, "src/overlays/actors", f"ovl_{folderName}")
    filePathObject = Path(path.curdir, ("mod_assets/objects" if useModAssets else "assets/objects"), f"{objectName}")

    filePaths = [filePathActor, filePathObject]
    
    if path.exists(filePathActor): sys.exit("Aborting... Actor folder already exists")
    if path.exists(filePathObject) and createObject == True: sys.exit("Aborting... Object folder already exists")

    for filePath in filePaths:
        if filePath == filePathObject and not createObject:
            break
        os.mkdir(filePath)
        with open(Path(filePath, f'{(fileName if filePath == filePathActor else objectName)}.c'), "w") as file:
            file.write("'this is a c file... hopefully!'")

        with open(Path(filePath, f'{(fileName if filePath == filePathActor else objectName)}.h'), "w") as file:
            file.write("'and this is an h file... hopefully!'")

def isInFile(text, filePath):
    with open(filePath) as fd:
        for line_num, line in enumerate(fd.readlines()):
            if text in line:
                return line_num
    return None

# write actor define after last entry, not at end of file
def addToTables(actorSpec, actorDefine, objectSpec, objectDefine):
    filePathActor = Path(path.curdir, "include/tables/actor_table.h")
    filePathObject = Path(path.curdir, "include/tables/object_table.h")
    filePaths = [filePathActor, filePathObject]

    actorLineNum = 0

    if path.exists(filePathActor) and path.exists(filePathObject):

        inFileActor = isInFile(actorSpec, filePathActor)
        inFileObject = isInFile(objectSpec, filePathObject)
        if inFileActor or inFileObject:
            if inFileActor: print(f"Actor Define already exists! {actorDefine} was found on line {inFileActor}")
            if inFileObject: print(f"Object Define already exists! {objectDefine} was found on line {inFileObject}")
            sys.exit()

        for filePath in filePaths:
            if filePath == filePathActor: newLine = str(f'DEFINE_ACTOR({actorSpec}, {actorDefine}, ACTOROVL_ALLOC_NORMAL, "{actorSpec}")')
            else: 
                if createObject == False:
                    break
                newLine = str(f'DEFINE_OBJECT({objectSpec}, {objectDefine})')

            with open(filePath, "r+") as file:
                file_data = file.readlines()
                num_lines = sum(1 for _ in file_data)
                
                shouldAppend = 2
                num = 0
                while shouldAppend > 1 :
                    for line in reversed(list(open(filePath))):
                        if num == 0:
                            if "DEFINE" in line:
                                file.seek(0, 2)
                                file.seek(file.tell() - 1)
                                last_char = file.read()
                                if last_char == '\n':
                                    file.truncate(file.tell() - 1)
                                shouldAppend = True
                                break
                        else:
                            if "DEFINE" in line:
                                line_num = file_data.index(line) + 1
                                shouldAppend = False
                                break
                        num += 1
                    
                if not shouldAppend:
                    file_data[line_num] = newLine
                    file.seek(0)
                    for line in file_data:
                        file.write(line)

            if shouldAppend:
                with open(filePath, "a") as file:
                    file.write("\n" + newLine)
                    line_num = num_lines + 1

            if filePath == filePathActor: actorLineNum = line_num
    
    return actorLineNum

def addToSpec(actorSpec, actorFileName, objectSpec, actorFileLine):
    # read tables and get actor located specifically before the most recently added one
    # use that to determine where in the spec file to write
    filePathActor = Path(path.curdir, "include/tables/actor_table.h")
    filePathSpec = Path(path.curdir, "spec")

    useNewBuild = False

    with open(filePathActor, "r") as file:
        file_data = file.readlines()
        prevActor = file_data[actorFileLine - 2]
        prevActor = prevActor[13:(len(actorSpec) + 13)]
    
    with open(filePathSpec, "r") as file:
        file_data = file.readlines()
        inFile = isInFile('name "gameplay_keep"', filePathSpec)
        if inFile:
            startLineActor = inFile
        
        if createObject:
            inFile = isInFile('name "g_pn_01"', filePathSpec)
            if inFile:
                startLineObject = inFile
        
        useNewBuild = isInFile('$(BUILD_DIR)/', filePathSpec)

    with open(filePathSpec, "w") as file:

        if createObject:
            file_data[startLineObject - 2] =  textwrap.dedent(
                f"""
                beginseg
                    name "{objectSpec}"
                    romalign 0x1000
                    include "{"$(BUILD_DIR)" if useNewBuild else "build"}/assets/objects/{objectSpec}/{objectSpec}.o"
                    number 6
                endseg

                """)
        
        file_data[startLineActor - 2] =  textwrap.dedent(
            f"""
            beginseg
                name "ovl_{actorSpec}"
                include "{"$(BUILD_DIR)" if useNewBuild else "build"}/src/overlays/actors/ovl_{actorSpec}/{actorFileName}.o"
                include "{"$(BUILD_DIR)" if useNewBuild else "build"}/src/overlays/actors/ovl_{actorSpec}/ovl_{actorSpec}_reloc.o"
            endseg
            
            """)

        file.seek(0)
        for line in file_data:
            file.write(line)

def completeFiles(actorSpec, actorDefine, actorFileName, objectSpec, objectDefine):
    filePathActor = Path(path.curdir, "src/overlays/actors", f"ovl_{actorSpec}")
    filePathObject = Path(path.curdir, f"{('mod_assets' if useModAssets else 'assets')}/objects", f"{objectSpec}")

    # ACTOR
    shutil.copyfile(Path(path.curdir, "template_files/z_actor.c"), f"{filePathActor}/{actorFileName}.c")
    shutil.copyfile(Path(path.curdir, "template_files/z_actor.h"), f"{filePathActor}/{actorFileName}.h")

    with open(f"{filePathActor}/{actorFileName}.c", 'r') as file:
        dataC = file.read()
        dataC = dataC.replace("{actorSpec}", actorSpec)
        dataC = dataC.replace("{actorDefine}", actorDefine)
        dataC = dataC.replace("{actorFileName}", actorFileName)
        dataC = dataC.replace("{objectDefine}", objectDefine if createObject else "OBJECT_GAMEPLAY_KEEP") 
        dataC = dataC.replace("{actorVar}", "ActorProfile" if useActorProfile else "ActorInit")
        dataC = dataC.replace("{actorInitVar}", "Profile" if useActorProfile else "InitVars")
    
    with open(f"{filePathActor}/{actorFileName}.c", 'w') as file: 
        file.write(dataC) 
    
    with open(f"{filePathActor}/{actorFileName}.h", 'r') as file:
        dataH = file.read()
        dataH = dataH.replace("{actorSpec}", actorSpec)
        dataH = dataH.replace("{actorFileNameCaps}", actorFileName.upper())
        dataH = dataH.replace("{includeObject}", f'\n#include "assets/objects/{objectSpec}/{objectSpec}.h"' if createObject else "")
    
    with open(f"{filePathActor}/{actorFileName}.h", 'w') as file: 
        file.write(dataH) 

    if createObject:
        # OBJECT
        shutil.copyfile(Path(path.curdir, "template_files/object.c"), f"{filePathObject}/{objectSpec}.c")
        shutil.copyfile(Path(path.curdir, "template_files/object.h"), f"{filePathObject}/{objectSpec}.h")

        with open(f"{filePathObject}/{objectSpec}.c", 'r') as file:
            dataC = file.read()
            dataC = dataC.replace("{objectSpec}", objectSpec) 
        
        with open(f"{filePathObject}/{objectSpec}.c", 'w') as file: 
            file.write(dataC) 
        
        with open(f"{filePathObject}/{objectSpec}.h", 'r') as file:
            dataH = file.read()
            dataH = dataH.replace("{objectSpec}", objectSpec) 
            dataH = dataH.replace("{objectSpecCap}", objectSpec.upper())  
        
        with open(f"{filePathObject}/{objectSpec}.h", 'w') as file: 
            file.write(dataH) 
          
def main():
    names = convertActorName(actorName)

    print(f'Creating new Actor: {names["actorSpec"]}')

    makeFilesAndFolders(names["actorSpec"], names["actorFileName"], names["objectSpec"])
    actorFileLine = addToTables(names["actorSpec"], names["actorDefine"], names["objectSpec"], names["objectDefine"])
    addToSpec(names["actorSpec"], names["actorFileName"], names["objectSpec"], actorFileLine)
    completeFiles(names["actorSpec"], names["actorDefine"], names["actorFileName"], names["objectSpec"], names["objectDefine"])

    print(f'{names["actorSpec"]} created!')

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "--name", required = True, help = "Name of actor. Use alphanumeric and/or _ as valid characters", default = "")
    parser.add_argument("-no", "--noobject", required = False, help = "Optional. Use if you do not want to create an object for this actor", action='store_false')
    args = parser.parse_args()

    if not os.path.exists(Path(path.curdir, "src") or not os.path.exists(Path(path.curdir, "spec"))):
        sys.exit("new_actor.py does not seem to be in the repo root directory.\nPut this file, and the template_files folder into the root (where the src and assets/mod_assets folders are located)!")
    else:
        if not os.path.exists(Path(path.curdir, "template_files")):
            sys.exit("template_files folder not found.\nMake sure the new_actor.py file and template_files folder are in your repo root folder!")

    if args.noobject == False:
        createObject = args.noobject

    if os.path.exists(Path(path.curdir, "mod_assets/objects")):
        useModAssets = True

    if not os.path.exists(Path(path.curdir, "assets/objects")) and createObject:
        os.makedirs(Path(path.curdir, "assets/objects"))

    if isInFile('ActorProfile', "include/z64actor.h"):
        useActorProfile = True
        
    if re.match(r'^[A-Za-z0-9_-]+$', args.name):
        actorName = args.name.replace("-", "_")
        main()     
    else:
        sys.exit("Invalid name. Please use Alphanumeric characters!")
