#!/usr/bin/env python3
import yaml
import json
from pathlib import Path


def write_shell(colors: dict[str, str], path: Path) -> None:
    with open(path, "w") as f:
        for k, v in colors.items():
            f.write(f'export COLOR_{k.upper()}="{v}"\n')


def write_toml(colors: dict[str, str], path: Path) -> None:
    with open(path, "w") as f:
        f.write("[colors]\n")
        for k, v in colors.items():
            f.write(f'{k} = "{v}"\n')


def write_json(colors: dict[str, str], path: Path) -> None:
    with open(path, "w") as f:
        json.dump(colors, f, indent=2)


def main() -> None:
    # Paths
    config_dir = Path.home() / ".dotfiles" / ".config" / "colors"
    colors_file = config_dir / "colors.yml"
    out_dir = config_dir / "generated-colors"
    out_dir.mkdir(parents=True, exist_ok=True)

    # Load YAML
    with open(colors_file) as f:
        colors = yaml.safe_load(f)

    write_shell(colors, out_dir / "colors.sh")
    write_toml(colors, out_dir / "colors.toml")
    write_json(colors, out_dir / "colors.json")

    print(f"Generated colors in {out_dir}")


if __name__ == "__main__":
    main()
