"""Intended for manual generation of logo, its easier to
keep it here because I kept forgetting how to regenerate the logo

```
uv venv && source .venv/bin/activate &&
```
```
python scripts/logo_generator.py > logo.sh
```

"""

import pyfiglet

ascii_banner = pyfiglet.figlet_format("meradeb", font="ansi_shadow")
print(f"""
ascii_art='
{ascii_banner}
'""")
