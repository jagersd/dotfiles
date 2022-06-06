from subprocess import Popen, PIPE, run
from pathlib import Path
import shutil

##
# Prep stuff
##
home_dir = Path.home()
i3_dir = f"{home_dir}/.config/i3"

def read_dir(dir) -> str:
    return run(["ls", dir], stdout=PIPE, stderr=PIPE, text=True)

available_themes = read_dir(f"{home_dir}/.config/i3/colors")

if available_themes.stderr:
    print(available_themes.stderr)
    exit()

def get_current_theme() -> str:
    with open(f"{i3_dir}/config", "rt") as i3config:
        config = i3config.readlines()
    for line in config:
        if 'set $theme' in line:
            return line.replace(r"set $theme", "").strip()

current_theme = get_current_theme()

##
# User interaction
##

prep_rofi = Popen(["echo", str(available_themes.stdout.replace('.conf', ''))], stdout=PIPE)

choice = Popen(["rofi", "-dmenu", "-theme", f"{home_dir}/.config/rofi/{current_theme}.rasi", "-p" , "Select Theme:"], 
    stdin= prep_rofi.stdout, 
    stdout= PIPE,
    text= True)

prep_rofi.stdout.close()

chosen_theme = choice.communicate()[0].strip()

print(current_theme)
print(chosen_theme)

options = ["yes","no"]
options = "\n".join(options)

prep_rofi  = Popen(["echo",str(options)], stdout=PIPE, text=True)
choice = Popen(["rofi", "-dmenu", "-theme", f"{home_dir}/.config/rofi/{current_theme}.rasi", "-p", "Are you sure you want to continue?"],
    stdin=prep_rofi .stdout,
    stdout=PIPE,
    text= True)

prep_rofi .stdout.close()
confirmation = choice.communicate()[0].strip()

if confirmation == "no":
    exit()

##
# Execution
## 

if current_theme == chosen_theme:
    print("Theme already applied.")
    exit()

with open(f"{i3_dir}/config", "r") as file:
    i3config = file.read()
    i3config = i3config.replace(f"set $theme {current_theme}", f"set $theme {chosen_theme}")

with open(f"{i3_dir}/config", "w") as file:
    file.write(i3config)

#alacritty
shutil.copyfile(f"{home_dir}/.config/alacritty/themes/{chosen_theme}/alacritty.yml" , f"{home_dir}/.config/alacritty/alacritty.yml")
#kitty
shutil.copyfile(f"{home_dir}/.config/kitty/themes/{chosen_theme}.conf" , f"{home_dir}/.config/kitty/kitty.conf")
#GTK
shutil.copyfile(f"{home_dir}/.config/gtk-3.0/themes/{chosen_theme}.ini" , f"{home_dir}/.config/gtk-3.0/settings.ini")

run(["i3-msg", "restart"], stdout=PIPE, stderr=PIPE)
