	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"dialogueLines.c"
	.text
	.global	codePuzzle1D
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Unlocked the box\000"
	.align	2
.LC1:
	.ascii	"Received Storage Room Key\000"
	.global	storageRoomDoorLD
	.align	2
.LC2:
	.ascii	"This leads to the storage room.\000"
	.align	2
.LC3:
	.ascii	"I'll need a key to get inside.\000"
	.global	classroomADoorLD
	.align	2
.LC4:
	.ascii	"This is my classroom.\000"
	.align	2
.LC5:
	.ascii	"Just as I expected, the door is locked.\000"
	.global	storageRoomDoorD
	.align	2
.LC6:
	.ascii	"That key from the box fits!\000"
	.align	2
.LC7:
	.ascii	"Unlocked Storage Room\000"
	.global	classroomADoorD
	.align	2
.LC8:
	.ascii	"The key I picked up earlier seems to fit.\000"
	.align	2
.LC9:
	.ascii	"Unlocked Classroom A\000"
	.global	entranceKeyD
	.align	2
.LC10:
	.ascii	"Is that the entrance key?\000"
	.align	2
.LC11:
	.ascii	"Looks like I can finally escape!\000"
	.align	2
.LC12:
	.ascii	"Picked up entrance key\000"
	.global	classroomAKeyD
	.align	2
.LC13:
	.ascii	"Upon closer inspection, there is a key wedged betwe"
	.ascii	"en the floorboards.\000"
	.align	2
.LC14:
	.ascii	"Whoever wrote that note didn't end up finding this,"
	.ascii	" huh...\000"
	.align	2
.LC15:
	.ascii	"Looks like I can go inside the classroom now.\000"
	.align	2
.LC16:
	.ascii	"Picked up the key to Classroom 3A\000"
	.global	newspaper1D
	.align	2
.LC17:
	.ascii	"On July 2nd, 19XX, at 5:00 PM, an explosion occurre"
	.ascii	"d at XXX Elementary School, killing XX students and"
	.ascii	" injuring XX others.\000"
	.align	2
.LC18:
	.ascii	"Witnesses were playing in the schoolyard when they "
	.ascii	"heard a loud explosion.\000"
	.align	2
.LC19:
	.ascii	"MC: XXX Elementary? Didn't they tear that place dow"
	.ascii	"n to build this school?\000"
	.global	notesClass1D
	.align	2
.LC20:
	.ascii	"The sun is starting to set.\000"
	.align	2
.LC21:
	.ascii	"I should find my homework and get out of here.\000"
	.align	2
.LC22:
	.ascii	"Huh? There is a note stuck in the windowsill.\000"
	.align	2
.LC23:
	.ascii	"'Note: If you want your paper back, play a game wit"
	.ascii	"h me!'\000"
	.align	2
.LC24:
	.ascii	"'-Hanako'\000"
	.align	2
.LC25:
	.ascii	"H-Hanako? Isn't she one of those ghosts mentioned i"
	.ascii	"n our school's urban legends?\000"
	.align	2
.LC26:
	.ascii	"Someone must be playing a prank on me...\000"
	.align	2
.LC27:
	.ascii	"I should get out of here. This isn't worth the hass"
	.ascii	"le.\000"
	.global	notesMain1D
	.align	2
.LC28:
	.ascii	"There is a note scribbled in crayon on the board.\000"
	.align	2
.LC29:
	.ascii	"I wanted to go play in the classroom, but I dropped"
	.ascii	" the key when I was playing in front of this bullet"
	.ascii	"in board.\000"
	.align	2
.LC30:
	.ascii	"I remember seeing it fall back once and then twice "
	.ascii	"again before it slid to the left three tiles.\000"
	.align	2
.LC31:
	.ascii	"I can't seem to find it...\000"
	.align	2
.LC32:
	.ascii	"The key to Classroom 3A?\000"
	.align	2
.LC33:
	.ascii	"According to this note, they dropped the key right "
	.ascii	"where I'm standing.\000"
	.align	2
.LC34:
	.ascii	"I should investigate the tiles around the classroom"
	.ascii	".\000"
	.data
	.align	2
	.type	codePuzzle1D, %object
	.size	codePuzzle1D, 8
codePuzzle1D:
	.word	.LC0
	.word	.LC1
	.type	storageRoomDoorLD, %object
	.size	storageRoomDoorLD, 8
storageRoomDoorLD:
	.word	.LC2
	.word	.LC3
	.type	classroomADoorLD, %object
	.size	classroomADoorLD, 8
classroomADoorLD:
	.word	.LC4
	.word	.LC5
	.type	storageRoomDoorD, %object
	.size	storageRoomDoorD, 8
storageRoomDoorD:
	.word	.LC6
	.word	.LC7
	.type	classroomADoorD, %object
	.size	classroomADoorD, 8
classroomADoorD:
	.word	.LC8
	.word	.LC9
	.type	entranceKeyD, %object
	.size	entranceKeyD, 12
entranceKeyD:
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.type	classroomAKeyD, %object
	.size	classroomAKeyD, 16
classroomAKeyD:
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.type	newspaper1D, %object
	.size	newspaper1D, 12
newspaper1D:
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.type	notesClass1D, %object
	.size	notesClass1D, 32
notesClass1D:
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.type	notesMain1D, %object
	.size	notesMain1D, 28
notesMain1D:
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.ident	"GCC: (devkitARM release 53) 9.1.0"
