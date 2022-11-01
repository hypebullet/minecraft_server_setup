@ECHO OFF
ECHO Mods folder exists?
if exist ..\\mods\ (
  ECHO Yes 
  if exist ..\\mods_archived_serverSetup\ (GOTO :FAILURE)
  ECHO Renaming 'mods' folder to 'mods_archived_serverSetup'
  rename ..\\mods mods_archived_serverSetup
  ECHO DONE
) else (
  ECHO No
)

ECHO Copying client directories!
robocopy mods ..\\mods
ECHO 1. Copied Mods!
robocopy resourcepacks ..\\resourcepacks /E /XC /XN /XO
ECHO 2. Copied Resourcepacks!
robocopy shaderpacks ..\\shaderpacks /E /XC /XN /XO
ECHO 3. Copied Shaderpacks!

ECHO ___________________________________________________________________________________________________________________
ECHO: 
ECHO:
ECHO ********
ECHO * DONE *
ECHO ********
GOTO :END

:FAILURE
ECHO *********************************************************
ECHO *                       FAILED                          *
ECHO *                                                       *
ECHO * DELETE mods_archived_serverSetup folder in .minecraft *
ECHO *********************************************************

:END
@PAUSE