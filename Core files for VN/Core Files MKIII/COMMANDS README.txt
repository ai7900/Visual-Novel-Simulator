NEW AWESOME COMMANDS!

/				This is a comment. it will be ignored

!dia NAME! DIALOGUE		Displays text & name, make shure to not forget the '!' after the name
!actor NUM IMAGEFILE		Displays/replaces a sprite at a certain location [0-4]
!killactor NUM			Kills actor in specified location [0-4]
!mirror_actor NUM		Mirrors an actor sprite

!bg IMAGEFILE			Sets the current background image

!border IMAGEFILE		sets the current scrolling border image

!audioplay SOUNDFILE		Make som noise, .ogg files only!
!audiostop			Destroys the current sound effect 

!bgmplay SOUNDFILE		Start jammin with background music, .ogg files only!
!bgmstop			Stops the current background music from playing

!nextact			Advances to the next act.txt file

!autoadvance NUM		Auto advances the next dialogue after set amount of time(in game frames; 60 frames = 1 second)
!typewriterspeed NUM		Sets the typewriter effect speed, 0 for instant text, 1 is default

!goto NUM			goes to specified text line


Confused? check examples below :)

//
////choice early access below
// This system is currently broken af, use at own risk
!answer ID
!choice ID
!choice_end

//ex
!dia Man!What will u do!??!?!
!choice KILL
!choice SPARE
!choice_end

!answer KILL
!dia Boye!you did the kill
!goto 999

!answer SPARE
!dia Boye!you did the spare
!goto 999



//Basic ass example below

!bg mushroom_kingdom.png

!typewriterspeed 0.75

!actor 1 mario.jpg
!actor 2 luigi.png

!dia Mario! My brother Luigi gonna show you his cock
!dia Luigi! Hello Mario, Hello I'm Luigi

!actor 2 luigi_menacing.png

!bgmstart rape_music.ogg
!audioplay laugh.ogg

!typewriterspeed 0.1
!autoadvance 120

!dia Luigi! I'm going to show you my cock now