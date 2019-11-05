.PHONY: drift


move:
	bin/movefile *.bz2

drift:
	bin/getDrift

# Commands for processing new analysis files:

new: new-midi new-compress new-drift
new2: new-move

new-midi:
	(cd new; ../bin/extractMidiFiles *.txt)

new-compress:
	(cd new; bzip2 *.txt)

new-drift:
	(cd new; ../bin/getDrift *.txt.bz2)

new-move:
	-mv new/*.txt.bz2 .
	bin/movefile *.txt.bz2



