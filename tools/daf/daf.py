from time import time

try:
    from data import fileTypes, commandsToFix
    from functions import replaceOldData, replaceEntranceHex, fixSegments, getArguments, fixSceneRoomCommandsArgs
except:
    print("[DAF:Error]: Files are missing. Make sure everything is in the same folder.")
    quit()

# verbose settings
fixTypeTime = entranceTime = segmentsTime = None
dashAmount = 60
infoPrefix = "[DAF:Info]"

# general things
args, parser = getArguments()

hasArgs = False
runTime = time()

if args.mode == "fix_types" or args.run_all:
    startingTime = time()

    if args.verbose:
        print(f"{infoPrefix}: Fixing types and macros...")

    hasArgs = True
    for type in fileTypes:
        replaceOldData(f"{args.decompPath}/assets/", type)

    if args.verbose:
        print(f"{infoPrefix}: Done in {(time() - startingTime):.2f}s!\n{'-' * dashAmount}")

if args.mode == "name_entrances":
    startingTime = time()

    if args.verbose:
        print(f"{infoPrefix}: Removing hexadecimal from exit lists...")
    hasArgs = True
    replaceEntranceHex(args.decompPath)

    if args.verbose:
        print(f"{infoPrefix}: Done in {(time() - startingTime):.2f}s!\n{'-' * dashAmount}")

if args.mode == "fix_segments":
    startingTime = time()

    if args.verbose:
        print(f"{infoPrefix}: Adding missing casts to rooms symbols...")
    hasArgs = True
    fixSegments(args.decompPath)

    if args.verbose:
        print(f"{infoPrefix}: Done in {(time() - startingTime):.2f}s!\n{'-' * dashAmount}")

if args.mode == "fix_command_args" or args.run_all:
    startingTime = time()

    if args.verbose:
        print(f"{infoPrefix}: Fixing scene and room commands...")
    hasArgs = True

    for command in commandsToFix:
        fixSceneRoomCommandsArgs(args.decompPath, command, "room")

    if args.verbose:
        print(f"{infoPrefix}: Done in {(time() - startingTime):.2f}s!\n{'-' * dashAmount}")

if hasArgs and args.verbose:
    print(f"{infoPrefix}: All Done in {(time() - runTime):.2f}s!")

if not hasArgs:
    parser.print_help()
    quit()
