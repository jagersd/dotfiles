from subprocess import Popen, PIPE, run
import shutil
from pathlib import Path

#Prep
def read_dir(dir):
    return run(["ls", dir], stdout=PIPE, stderr=PIPE, text=True)

availableThemes = read_dir("../config/regolith/themes/")

if availableThemes.stderr:
    print(availableThemes.stderr)
else:
    prepRofi = Popen(["echo", str(availableThemes.stdout)], stdout=PIPE)

    choice = Popen(["rofi", "-dmenu", "-p" , "Select Theme:"], 
        stdin= prepRofi.stdout, 
        stdout= PIPE,
        text= True)

    prepRofi.stdout.close()

    theme = choice.communicate()[0].strip()

options = ["yes","no"]
options = "\n".join(options)

prepRofi = Popen(["echo",str(options)], stdout=PIPE, text=True)
choice = Popen(["rofi", "-dmenu", "-p", "Are you sure you want to continue?"],
    stdin=prepRofi.stdout,
    stdout=PIPE,
    text= True)

prepRofi.stdout.close()
confirmation = choice.communicate()[0].strip()

print(confirmation)

if confirmation == "no":
    exit()

#check (YET TO DO)
homeDir = Path.home()
regcontent = read_dir(f"{homeDir}/.config/regolith")

#execute
shutil.copyfile(f"../config/regolith/themes/{theme}/Xresources", f"{homeDir}/.config/regolith/Xresources")
shutil.copyfile(f"../config/regolith/picom/{theme}-config", f"{homeDir}/.config/regolith/picom/config")
shutil.copyfile(f"../config/polybar/themes/{theme}/config", f"{homeDir}/.config/polybar/config")
shutil.copyfile(f"../config/polybar/themes/{theme}/launch.sh", f"{homeDir}/.config/polybar/launch.sh")
shutil.copyfile(f"../config/alacritty/themes/{theme}/alacritty.yml" , f"{homeDir}/.config/alacritty/alacritty.yml")

run(["regolith-look", "refresh"], stdout=PIPE, stderr=PIPE)




