This repository constains the code to upload animations to puppets.

This code is designed to run on OSX or Linux systems.

# Prerequisites

This should run nearly out of the box.

If you are on OSX, you will have to install brew (follow the
instructions here) if it is not already installed (type `brew -v` on
the command line; if that works you're good).

Otherwise you will have to make sure the 'ffmpeg' is installed in your command line - it should be readily available.

# Installing

    1. Download the code at https://github.com/maronnax/puppet_loader/archive/refs/heads/master.zip and unpack it.
    2. Type `make install`.  This should work with no problems.  If so, look to the prerequisites section.
    3. Get the animations from Bird.  Place them into the inputs/ subdirectory in this directory.

       When done, the inputs directory should contain many subdirectories, each with the name of a program.
       Each directory will contain 2 or 3 files.  One json file, one wav file, and possibly one mp3 file.

    The software is now installed.


# Running the software

To run any of this software, you must be in the "root" directory to
this package from within the terminal (if you type `ls` you should see
the Makefile and this README.md file, among multiple other files).

Additionally, you must be on the puppet-net network you wish to upload
puppets on.  If there are two or three puppetsystems setup, make sure
you are on the correct WiFi network so that you are talking to the
correct puppet!

## Uploading all the programs

    type `make upload-all`

    This will upload all programs in the input directory to the command.  It runs the "make PROGRAM-upload" command for each program and thus loads everything.

## Uploading an update to an existing program

    You can install/test an update to an existing program by copying over the files in the appropriate input/PROGRAM_NAME directory.  Make sure you rename any files so that they match the previous names exactly.

    Then type `make YOURPROGRAMNAME-demo`.  This will upload this specific program as well as immediately play it on the puppet so that you can see the new/updated program.

    If you do not care to see it and only wish to upload it you can type `make YOURPROGRAMNAME-upload` which will skip the playback step.


## Adding a new Animation to an existing program

    Get the audio file and the json file that make up the new animation.  Choose a representative name that is
    all lowercase and underscores and create a new directory with this name in the inputs directory.  So if
    you choose the name "hi_buddy" there should be a new directory called "inputs/hi_buddy" as well as two
    files within that directory called hi_buddy.json and hi_buddy.wav.

    Take the following text and search and replace the word "PROGRAM" with "hi_buddy"

    ```
inputs/PROGRAM/PROGRAM.mp3: inputs/PROGRAM/PROGRAM.wav
    ffmpeg -y -i $< $@

outputs/programs/PROGRAM: inputs/PROGRAM/PROGRAM.mp3
    $(PYTHON) ./bin/compile-animation inputs/PROGRAM/PROGRAM.json \
        inputs/PROGRAM/PROGRAM.mp3 \
        outputs/programs/PROGRAM \
        --force --frame-rate 24 \
        --insert-frames 5

PROGRAM-demo: PROGRAM-upload
    sleep 1
    $(PYTHON) ./bin/dev_cmd PUPPET_01 play PROGRAM

PROGRAM-upload: outputs/programs/PROGRAM
    ./$(PYTHON) bin/upload-program outputs/programs/PROGRAM
```


For example, after search and replacing the first line will read
```inputs/hi_buddy/hi_buddy.mp3: inputs/hi_buddy/hi_buddy.wav```

and the last line will read
```	$(PYTHON) ./bin/dev_cmd PUPPET_01 play hi_buddy```


1. Copy and paste this text into the bottom of the Makefile.

   Now you will be able to run the commands `make hi_buddy-demo` and
   `make hi_buddy-upload`

2. Add the line `make hi_buddy-upload` to the end of the file called
   `upload_all_animations` in this directory.

   DONE - THE NEW ANIMATION IS ON THE PUPPET


3. Follow-up with Bird. Make sure that he is aware and has all new and
   latest versions of the animations because he is reposible for the
   "inputs" directory and the animation loadouts.


## Emergency modification for Animations

    If in the heat of battle a servo playback isn't matching the audio precisely,
    you can adjust this on import as an emergency measure as you wait for the real
    fixes from the animation department.


    Look in the Makefile for the line `outputs/programs/PROGRAM`.  For example,

    ```
    outputs/programs/aloha: inputs/aloha/aloha.mp3
    $(PYTHON) ./bin/compile-animation inputs/aloha/aloha.json \
        inputs/aloha/aloha.mp3 \
        outputs/programs/aloha \
        --force --frame-rate 24
    ```

    Add a line to this like so
    ```
    outputs/programs/aloha: inputs/aloha/aloha.mp3
    $(PYTHON) ./bin/compile-animation inputs/aloha/aloha.json \
        inputs/aloha/aloha.mp3 \
        outputs/programs/aloha \
        --force --frame-rate 24 \
        --insert-frames 3
    ```

    This will cause the animation to begin 3 frames late (at 24fps).  By continually
    adjusting this value while repeatedly running `make aloha-demo`, you can quickly
    test/visualize the result of tiny tweaks to startup sync to be performed as needed.
