# handyStuff
Some handy bits and pieces mainly little BASH utils and such like

Scripts in BASH I normally put in /usr/local/bin for ease. removeBadHost is handy for removing the ssh host you last tried to connect to if it has changed/been re-built since you last connected to it. Very handy if you use VMs a lot like docker where a machine with a fixed address gets rebuilt and SSH complains.
Run as `removeBadHost !$` as the argument expects to be something like ssh michael@some.host.com 
