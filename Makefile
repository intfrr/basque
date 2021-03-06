TITLE=basque

# \
!ifndef 0 # \
# nmake: \
CP=copy # \
MV=move # \
RM=del # \
FLAGS=-Wall -I C:\INCLUDE\ -I C:\INCLUDE\sdl2.nuget\build\native\include\ -I C:\INCLUDE\sdl2_image.nuget\build\native\include\ -I C:\INCLUDE\sdl2_mixer.nuget\build\native\include\ -I C:\INCLUDE\sdl2_ttf.nuget\build\native\include\ # \
SOURCE=source\$(TITLE).c # \
LIBS=C:\INCLUDE\sdl2.nuget\build\native\lib\x64\dynamic\SDL2.lib C:\INCLUDE\sdl2.nuget\build\native\lib\x64\dynamic\SDL2main.lib C:\INCLUDE\sdl2_image.nuget\build\native\lib\x64\dynamic\SDL2_image.lib C:\INCLUDE\sdl2_mixer.nuget.\build\native\lib\x64\dynamic\SDL2_mixer.lib C:\INCLUDE\sdl2_ttf.nuget\build\native\lib\x64\dynamic\SDL2_ttf.lib # \
TARGET=-o $(TITLE).exe # \
!else
# make:
CP=cp -f
MV=mv -f
RM=rm -f
FLAGS=-Wall -Wextra -std=c99
SDL2_FLAGS=`$$(which sdl2-config) --cflags --libs`
SOURCE=source/$(TITLE).c
LIBS=$(SDL2_FLAGS) -l SDL2_image -l SDL2_mixer -l SDL2_ttf
TARGET=-o $(TITLE)
# \
!endif

RELEASE=$(CC) $(FLAGS) $(SOURCE) $(LIBS) $(TARGET)

$(TITLE): source/*.c source/*.h
	$(RELEASE)
# Windows will automatically overwrite
# the binary when using `nmake`, but
# we add the clean command for
# people who like that kind
# of thing.
clean:
	$(RM) $(TITLE)
	$(RM) $(TITLE).exe
debug: source/*.c source/*.h
	$(RELEASE) -g
