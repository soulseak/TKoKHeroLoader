;How to use: Download and Install Autohotkey from https://autohotkey.com/
;Rightclick desktop, new -> Autohotkey script
;Copypaste this entire Pastebin in it, and save it.
;Run the script, it will ask you to show you only once where your TKoK directory is.
;Pressing F8 when warcraft III is open will show you a menu in the topright corner to select a hero. Click one and the script will load it for you automatically, along with your APT code.

#IfWinActive, Warcraft III
#SingleInstance, force
Process, Priority,, High
SetBatchLines, -1
SetKeyDelay, -1
if FileExist("TkoK Directory.txt")
	{
		FileReadLine, tkokdir, TKoK Directory.txt, 1
	}
Else
	{
		FileSelectFolder, tkokdir, , 0, Please Select Your TKoK save folder (only once, should be something like C:\Users\<name>\Documents\Warcraft III\CustomMapData\TKoK_Save_Files\TKoK_3.4.46).
		if tkokdir =
		{
			ExitApp
		}
		FileAppend, %tkokdir%, TKoK Directory.txt
	}
return

F8::
{
	Gui,+AlwaysOnTop
	Gui, Add, Text, x0 y0 cBlack, Select the hero you want to load:
	HeroCount = 0
	Loop, Files, %tkokdir%\*, D
	{
		HeroCount++
		Gui, Add, Button, w200 h30 gButton%HeroCount%, %A_LoopFileName%
		Hero%HeroCount% = %A_LoopFileName%
	}
	Height := 35 * HeroCount + 15
	xpos := A_ScreenWidth - 260
	Gui,Show, h%Height% w200 x%xpos% y10,TKoK Loader Window NA
}
return

GetLatestCode(dir)
{
	FileList =
	Loop, Files, %dir%\*.txt
	{
		FileList = %FileList%%A_LoopFileTimeModified%`t%A_LoopFileFullPath%`n
	}
	Sort, FileList, R
	Loop, Parse, FileList, `n
		{
		StringSplit, FileItem, A_LoopField, %A_Tab%
		i=1
		While i < 20
		{
			FileReadLine, LoadCode, %FileItem2%, i
			IfInString, LoadCode, -l
			{
				RegExMatch(LoadCode, "(-l[^""]*)" , LoadCode)
				
				return LoadCode
			}
			i++
		}
		break
	}
}
return

GetLatestCodel2(dir)
{
	FileList =
	Loop, Files, %dir%\*.txt
	{
		FileList = %FileList%%A_LoopFileTimeModified%`t%A_LoopFileFullPath%`n
	}
	Sort, FileList, R
	Loop, Parse, FileList, `n
		{
		StringSplit, FileItem, A_LoopField, %A_Tab%
		i=1
		While i < 20
		{
			FileReadLine, LoadCode, %FileItem2%, i
			IfInString, LoadCode, -l2
			{
				
				RegExMatch(LoadCode, "(-l[^""]*)" , LoadCode)
				return LoadCode
			}
			i++
		}
		break
	}
}
return

ExecuteInput(dir, tkokdir)
{
	Gui, Destroy

	HeroCode := GetLatestCode(dir)
	L2code	:= GetLatestCodel2(dir)
	AccountCode := GetLatestCode(tkokdir)

	ClipSaved := ClipboardAll
	Clipboard =
	Clipboard = %HeroCode%
	ClipWait, 10

	WinActivate, Warcraft III
	WinWaitActive, Warcraft III, , 10
	
	Sleep, 250
	
	IfWinActive, Warcraft III
	{
		Send, {Enter}^v{Enter}
	}
	Sleep, 1000

	Clipboard =
	Clipboard = %L2code%
	ClipWait, 10

	IfWinActive, Warcraft III
	{
		Send, {Enter}^v{Enter}
	}
	Sleep, 1000

	Clipboard =
	Clipboard = %AccountCode%
	ClipWait, 10

	IfWinActive, Warcraft III
	{
		Send, {Enter}^v{Enter}
	}
	Sleep, 1000
	Clipboard := ClipSaved
	ClipSaved =
}
return

Button1:
dir = %tkokdir%\%Hero1%
ExecuteInput(dir, tkokdir)
return

Button2:
dir = %tkokdir%\%Hero2%
ExecuteInput(dir, tkokdir)
return

Button3:
dir = %tkokdir%\%Hero3%
ExecuteInput(dir, tkokdir)
return

Button4:
dir = %tkokdir%\%Hero4%
ExecuteInput(dir, tkokdir)
return

Button5:
dir = %tkokdir%\%Hero5%
ExecuteInput(dir, tkokdir)
return

Button6:
dir = %tkokdir%\%Hero6%
ExecuteInput(dir, tkokdir)
return

Button7:
dir = %tkokdir%\%Hero7%
ExecuteInput(dir, tkokdir)
return

Button8:
dir = %tkokdir%\%Hero8%
ExecuteInput(dir, tkokdir)
return

Button9:
dir = %tkokdir%\%Hero9%
ExecuteInput(dir, tkokdir)
return

Button10:
dir = %tkokdir%\%Hero10%
ExecuteInput(dir, tkokdir)
return

Button11:
dir = %tkokdir%\%Hero11%
ExecuteInput(dir, tkokdir)
return

Button12:
dir = %tkokdir%\%Hero12%
ExecuteInput(dir, tkokdir)
return

Button13:
dir = %tkokdir%\%Hero13%
ExecuteInput(dir, tkokdir)
return

Button14:
dir = %tkokdir%\%Hero14%
ExecuteInput(dir, tkokdir)
return

Button15:
dir = %tkokdir%\%Hero15%
ExecuteInput(dir, tkokdir)
return

Button16:
dir = %tkokdir%\%Hero16%
ExecuteInput(dir, tkokdir)
return

Button17:
dir = %tkokdir%\%Hero17%
ExecuteInput(dir, tkokdir)
return

Button18:
dir = %tkokdir%\%Hero18%
ExecuteInput(dir, tkokdir)
return

Button19:
dir = %tkokdir%\%Hero19%
ExecuteInput(dir, tkokdir)
return

Button20:
dir = %tkokdir%\%Hero20%
ExecuteInput(dir, tkokdir)
return