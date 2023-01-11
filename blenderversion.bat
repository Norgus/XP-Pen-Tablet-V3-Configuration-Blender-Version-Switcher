set launcherpath=D:\Blender Launcher
dir /B /S "%launcherpath%\*blender.exe" > blender_versions.txt
wsl sed -i $"s/\r$//" blenderversion.sh
bash blenderversion.sh