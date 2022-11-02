from pathlib import Path
import shutil, sys, os

rootdir = Path(sys.argv[1])
target_dir = Path(sys.argv[2])

for f in rootdir.glob('**/*.h'):
  if f.is_file():
    t = os.path.join(target_dir, f)
    os.makedirs(os.path.dirname(os.path.realpath(t)), exist_ok=True)
    print(f"{f} -> {t}")
    shutil.copyfile(f, t)