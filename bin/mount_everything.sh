#!/bin/sh

# Mount all the shares!
# (Comment anything that isn't used regularly enough that I care if it fails.)

echo '*** Mount rti.dev on riviera (QA server for BPT updates) ***'
sshfs paulf@riviera:/home/public/rti.e-pennant.co.uk ~/mnt/rti.dev


