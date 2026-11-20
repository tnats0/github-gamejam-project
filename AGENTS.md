# github-gamejam

Godot 4.7 2D platformer (GitHub Game Jam). Single project, no packages, no CI, no tests, no build step.

## How to run

- Open the folder in **Godot 4.7** (Project → Open, select this folder) and press **Play**.
- Main scene is `res://ana_sahne.tscn` (set by UID `uid://cus8ji0dgpygu` in `project.godot` `run/main_scene`, not by path).
- There is no Godot binary installed in this environment; `godot --path .` cannot be verified here — install Godot 4.7 first.
- No export presets are configured in `project.godot`, so exporting requires setting them in the editor first.

## Layout

- `scripts/` — GDScript (`player.gd`, `rotate_pipe.gd`, `rotating_platform.gd`, `area_2d.gd`, `static_body_2d.gd`, `rotate_static_body_2d.gd`, `new_script.gd`)
- `scenes/` and `scenes/1st level/` — `.tscn` scenes; `ana_sahne.tscn` instances `test_level.tscn`
- `sprites/`, `sounds/`, `music/`, `fonts/` — assets (`.import` files are committed by convention)
- `.godot/` is ignored; `project.godot` is tracked and required

## Gotchas (verify these before changing anything)

- **Case mismatch:** `player.tscn` references `res://Scripts/player.gd` (capital S) but the file is `res://scripts/player.gd`. Works on Windows, breaks on Linux. Fix the `.tscn` reference if you move/rename it.
- **Missing input actions:** rotate scripts (`rotate_static_body_2d.gd`, `rotating_platform.gd`, etc.) read `turn_left`/`turn_right`, but `project.godot` `[input]` only defines `Left`, `Right`, `Jump`, `left_click`, `right_click`. Rotation won't respond until those actions are added (editor → Project → Project Settings → Input Map) or the scripts are changed.
- **Git hygiene:** `*.tmp` Godot recovery files (`ana_sahne.tscn3462243841.tmp`, `ana_sahne.tscn3481479212.tmp`) are tracked. Add `*.tmp` to `.gitignore` and remove them from tracking.
- **Working tree dirty:** `scenes/1st level/box.tscn` and `new_box.tscn` are modified; `scenes/1st level/rusty_road.tscn` is deleted but not committed (`git status --short`).
- **Rendering:** Forward Plus renderer with `rendering_device/driver.windows="d3d12"`; physics is set to Jolt (`3d/physics_engine="Jolt Physics"`) despite being a 2D project.
- **No tests/lint/format tooling** exists — verification is manual play in the editor. `editorconfig` only enforces `charset = utf-8`; `gitattributes` forces `eol=lf`.

## Conventions

- Turkish scene names (`ana_sahne` = main scene). Keep naming consistent when adding scenes.
- GDScript only; no C#/Mono.