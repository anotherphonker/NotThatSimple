![NotThatSimple Icon](https://raw.githubusercontent.com/anotherphonker/NotThatSimple/refs/heads/main/Not%20That%20Simple.ico)
# NotThatSimple

A basic launcher for SimpMusic that fixes the broken Compose window bug on first launch.

## The Problem

SimpMusic is a Compose-based YouTube Music client distributed as an MSIX package. On first launch (and sometimes on subsequent launches), the app window opens but renders nothing — it's stuck in a buggy, invisible state until you interact with it (e.g. double-clicking the title bar to maximize it), which forces a resize event and triggers a proper redraw.

## How It Works

`NotThatSimple` automates that manual fix:

1. Launches `SimpMusic.exe` from its MSIX install path.
2. Polls running processes until it finds SimpMusic's main window handle.
3. Sends a `ShowWindowAsync` minimize → maximize sequence via the Win32 API, simulating the resize event that fixes the render bug.
4. Brings the window to the foreground.

The `.exe` is a compiled version of the included `.bat` script (via Bat To Exe Converter), so it can be pinned to the taskbar or Start menu like a normal application — Windows won't let you pin raw `.bat`/`.cmd` files directly.

## Download

Grab the latest files from the [repo](https://github.com/anotherphonker/NotThatSimple):

- **`NotThatSimple.exe`** — recommended. Just run it, or create a shortcut and pin it to your taskbar/Start menu.
- **`NotThatSimple.bat`** — the raw script, in case you want to inspect or modify it before running.
- **`Not That Simple.ico`** — icon used for the exe.

### Setup

1. Download `NotThatSimple.exe` to Desktop folder to quick access, or anywhere you want.
2. Make sure SimpMusic is installed via MSIX at the default path (C:\Program Files\WindowsApps\Simpmusic_2.0.0.0_x64__ejp2bhxmz1qq6\bin\). If your install path differs, edit the `EXE` variable in the `.bat` source and recompile, or just edit-and-recompile with your own path.
3. Pin the app to your taskbar/Start menu and use it instead of launching SimpMusic directly.

## Status

This is a workaround, not a fix. The repo will be archived once SimpMusic's upstream developer(s) resolve the underlying Compose window rendering bug.

## License

MIT
