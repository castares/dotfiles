# Keybinding Framework Reference

This document defines the canonical keybinding framework used across your setup.
It uses Neovim (LazyVim + custom keymaps) as the source of truth, Kitty as the terminal layer, and serves as the alignment target for GUI editors (Zed, Cursor, VSCode).

## Sources of truth

- Neovim custom overrides: `nvim/.config/nvim/lua/config/keymaps.lua`
- Kitty terminal mappings: `kitty/.config/kitty/kitty.conf`
- LazyVim default keymaps: [lazyvim.org/keymaps](https://www.lazyvim.org/keymaps)

## Framework principles

- `Space` is the universal leader for grouped actions.
- `Alt+hjkl` is the universal pane navigation cluster across terminal/editor splits.
- Keep Vim-modal semantics wherever possible (`vim_mode` in GUI editors).
- Favor mnemonic groupings from LazyVim: `leader+f*` (find/files), `leader+s*` (search/symbols), `leader+c*` (code/LSP), `leader+x*` (diagnostics/trouble), `leader+g*` (git), `leader+u*` (UI/editor toggles).
- Prefer `Alt` for structural navigation and avoid stealing common terminal `Ctrl` chords.
- Preserve clipboard-safe text ops from your Neovim config (`x`, `X`, visual `p` behavior).
- For GUI apps without leader support, prefer single-stroke `Ctrl+Shift+<key>` mappings over multi-step chords for primary toggles and menus.

## Key notation

- `leader` means `Space`.
- `A-` means `Alt` (or `Option` on macOS).
- `C-` means `Ctrl`.
- `S-` means `Shift`.

## Canonical mapping matrix

Use this table as the primary translation reference when configuring Zed/Cursor/VSCode.

| Category        | Intent                            | Canonical binding                                    | Neovim (current)                                 | Kitty (current)                           | GUI target (Zed/Cursor/VSCode)                               | GUI single-stroke fallback |
| --------------- | --------------------------------- | ---------------------------------------------------- | ------------------------------------------------ | ----------------------------------------- | ------------------------------------------------------------ | -------------------------- |
| AI              | Open AI namespace/menu            | `leader+a`                                           | AI prefix group (plugin-dependent)               | N/A                                       | Open AI menu/panel namespace                                 | `C-S-A`                    |
| Clipboard       | Copy filename (without extension) | `leader+C`                                           | Custom Lua function in `keymaps.lua`             | N/A                                       | Optional custom command binding                              | `C-S-C`                    |
| Clipboard       | Copy relative file path           | `leader+y`                                           | Custom Lua function in `keymaps.lua`             | N/A                                       | Optional custom command binding                              | `C-S-Y`                    |
| Clipboard       | Delete without yank               | `x`, `X`, visual `p`                                 | Custom black-hole register behavior              | N/A                                       | Emulate in Vim mode where supported                          | N/A                        |
| Debug           | Open debugger pane/menu           | `leader+du`                                          | LazyVim DAP UI toggle                            | N/A                                       | Open debugger panel/menu                                     | `C-S-D`                    |
| Debug           | Debug controls namespace          | `leader+d`                                           | LazyVim DAP group (`dc`, `db`, `di`, etc.)       | N/A                                       | Open/run debugger command group                              | `C-S-D`                    |
| Diagnostics     | Next diagnostic                   | `leader+xj`                                          | Custom override: `vim.diagnostic.goto_next()`    | N/A                                       | Next diagnostic                                              | `C-S-J`                    |
| Diagnostics     | Previous diagnostic               | `leader+xk`                                          | Custom override: `vim.diagnostic.goto_prev()`    | N/A                                       | Previous diagnostic                                          | `C-S-K`                    |
| Diagnostics     | Diagnostics panel                 | `leader+xx`                                          | LazyVim (Trouble)                                | N/A                                       | Problems panel toggle/focus                                  | `C-S-X`                    |
| Diagnostics     | Location list                     | `leader+xl`                                          | LazyVim default location list                    | N/A                                       | Open location list panel                                     | `C-S-L`                    |
| Diagnostics     | Quickfix list                     | `leader+xq`                                          | LazyVim default quickfix list                    | N/A                                       | Open quickfix/search results panel                           | `C-S-Q`                    |
| Diagnostics     | Buffer diagnostics panel          | `leader+xX`                                          | LazyVim Trouble buffer diagnostics               | N/A                                       | Diagnostics for current file                                 | `C-S-B`                    |
| Diagnostics     | Location list (Trouble)           | `leader+xL`                                          | LazyVim Trouble location list                    | N/A                                       | Enhanced location list view                                  | `C-S-L`                    |
| Explorer        | Toggle explorer (cwd/root)        | `leader e` / `leader E`                              | Neo-tree mapped to cwd/root                      | N/A                                       | Toggle file/project panel (cwd/root analog)                  | `C-S-E`                    |
| Find            | Find files                        | `leader f f`                                         | LazyVim default                                  | N/A                                       | Quick Open / Find Files                                      | `C-S-P`                    |
| Find            | Open buffers picker               | `leader+,`                                           | LazyVim defaults to buffers picker               | N/A                                       | Open files/buffers list                                      | `C-S-B`                    |
| Git             | Git status / blame line           | `leader+gs`, `leader+gb`                             | LazyVim defaults                                 | N/A                                       | Source control + inline blame toggle                         | `C-S-G`                    |
| Git             | Open git UI/menu                  | `leader+gg`                                          | Plugin-dependent git UI binding (optional extra) | N/A                                       | Open Git menu or Git client panel                            | `C-S-G`                    |
| Git             | Toggle inline blame               | `leader+uB`                                          | Custom (`Gitsigns toggle_current_line_blame`)    | N/A                                       | Inline blame toggle                                          | `C-S-U`                    |
| LSP/Code        | Go to definition/references/hover | `gd`, `gr`, `K`                                      | LazyVim defaults                                 | N/A                                       | Use LSP go-to-definition/references/hover commands           | Native LSP defaults        |
| LSP/Code        | Code action / rename / format     | `leader+ca`, `leader+cr`, `leader+cf`                | LazyVim defaults                                 | N/A                                       | Match equivalent code-action/rename/format commands          | `C-S-.`                    |
| Navigation      | Pane left/down/up/right           | `A-h/j/k/l`                                          | `KittyNavigate*` in normal + terminal modes      | `map alt+h/j/k/l kitten pass_keys.py ...` | Bind to focus adjacent pane/group in editor + terminal panel | N/A                        |
| Navigation      | Half-page down/up                 | `C-n` / `C-p`                                        | Remapped to `C-d` / `C-u`                        | N/A                                       | Map to page half down/up (or nearest equivalent)             | N/A                        |
| Navigation      | Prev/next buffer                  | `S-h` / `S-l`                                        | LazyVim default                                  | N/A                                       | Prev/next editor tab                                         | `C-S-H` / `C-S-L`          |
| Navigation      | Prev/next tab                     | `A-p` / `A-n`                                        | N/A                                              | `previous_tab` / `next_tab`               | Prev/next workspace tab/editor group                         | `C-S-P` / `C-S-N`          |
| Quit            | Close window/all                  | `leader+qq` / `leader+qa`                            | Custom overrides                                 | N/A                                       | Close editor / close window/workbench                        | `C-S-Q`                    |
| Search          | Grep project                      | `leader s g`                                         | LazyVim default                                  | N/A                                       | Global search in workspace                                   | `C-S-F`                    |
| Search          | Grep project (shortcut)           | `leader+/`                                           | LazyVim defaults to grep root dir                | N/A                                       | Search across project                                        | `C-S-/`                    |
| Search          | Search in buffers                 | `leader s b`                                         | LazyVim default                                  | N/A                                       | Open-symbol/buffer search list                               | `C-S-B`                    |
| Symbols         | Document symbols                  | `leader+ss`                                          | LazyVim LSP symbols picker                       | N/A                                       | Open current-file symbols menu                               | `C-S-O`                    |
| Symbols         | Workspace symbols                 | `leader+sS`                                          | LazyVim workspace symbols picker                 | N/A                                       | Open workspace-wide symbols menu                             | `C-S-S`                    |
| Symbols/Outline | Open outline panel                | `leader+o`                                           | Framework override: map to Aerial.nvim toggle    | N/A                                       | Open Outline menu/panel                                      | `C-S-O`                    |
| Terminal        | Open terminal                     | `leader+ft` / `leader+fT`                            | LazyVim defaults (root/cwd variants)             | Terminal-native                           | Toggle integrated terminal at project/root context           | `C-S-T`                    |
| Test            | Open test summary pane/menu       | `leader+ts`                                          | LazyVim Neotest summary toggle                   | N/A                                       | Open testing panel/menu                                      | `C-S-M`                    |
| Test            | Open test output panel            | `leader+tO`                                          | LazyVim Neotest output panel toggle              | N/A                                       | Open test output panel                                       | `C-S-M`                    |
| Test            | Run nearest test                  | `leader+tr`                                          | LazyVim Neotest run nearest                      | N/A                                       | Run nearest test                                             | `C-S-R`                    |
| Visual          | Visual block mode                 | `C-v`                                                | Remapped to `A-v`                                | N/A                                       | Map to column selection / visual block                       | N/A                        |
| Window/Layout   | Split + close + maximize          | `leader+-`, `leader+vsplit`, `leader+wd`, `leader+z` | LazyVim + custom maximize                        | Kitty has layout toggles                  | Split horizontally/vertically, close pane, zoom pane         | `C-S-W`                    |

Use the fallback column only when an app cannot support leader mappings directly. Prefer single-stroke bindings and avoid chords for primary menus/toggles.

### Proposal corrections

- `leader+gg`: valid only if a git UI plugin mapping is enabled; not a guaranteed LazyVim baseline.
- `leader+a`: usually a prefix group (`+ai`) and not always mapped to a single pane toggle.
- `leader+o`: framework override in this document (Aerial/Outline), even though LazyVim core uses it for "close other tabs".
- "Include other leader x": expanded here with `leader+xl`, `leader+xq`, `leader+xX`, and `leader+xL`.

## App-specific implementation notes

## Zed

- Primary file: `zed/.config/zed/keymap.json` (managed via dotfiles).
- Keep `vim_mode` enabled and map most motions as `vim::*` actions.
- For non-vim actions (panel focus, tabs, terminal), use `workspace::*`, `pane::*`, `terminal::*`, or `editor::*` actions.
- Preserve `A-h/j/k/l` in both editor and terminal focus contexts so pane movement stays consistent.

### Implemented bindings (current keymap.json)

| Binding | Action | Framework mapping | Notes |
| ------- | ------ | ----------------- | ----- |
| `A-h/j/k/l` | `workspace::ActivatePaneLeft/Down/Up/Right` | `A-h/j/k/l` | Active in normal mode, ProjectPanel, GitPanel |
| `C-H` / `C-L` / `C-J` | Toggle left / right / bottom dock | N/A | Zed-specific; no canonical equivalent |
| `space e` | `project_panel::ToggleFocus` | `leader+e` | Matches |
| `space t` | `terminal_panel::ToggleFocus` | `leader+ft` | Collapsed to single key; no root/cwd variant |
| `space p` | `command_palette::Toggle` | N/A | Zed-specific; no canonical equivalent |
| `space a` | `agent::ToggleFocus` | `leader+a` | Matches |
| `space o` | `outline_panel::ToggleFocus` | `leader+o` | Matches |
| `space g` | `git_panel::ToggleFocus` | `leader+gg` | Single `g` instead of `gg` |
| `space U` | `git::Blame` | `leader+gb` | Uppercase `U`; full blame view |
| `space u` | `editor::ToggleGitBlameInline` | `leader+uB` | Collapsed to single `u` |
| `space d` | `editor::ToggleSelectedDiffHunks` | N/A | Zed-specific diff hunk toggle |
| `space q q` | `pane::CloseActiveItem` | `leader+qq` | Matches |
| `space q a` | `workspace::CloseAllItemsAndPanes` | `leader+qa` | Matches |
| `space z` | `workspace::ToggleZoom` | `leader+z` | Matches |
| `space w v` | `pane::SplitRight` | `leader+wv` | Matches |
| `space w h` | `pane::SplitDown` | `leader+ws` / `leader+-` | Uses `h` instead of `s` |
| `space w q` | `pane::CloseActiveItem` | `leader+wd` | Uses `q` instead of `d` |
| `space x j` / `space x k` | `editor::GoToDiagnostic` / `GoToPreviousDiagnostic` | `leader+xj` / `leader+xk` | Matches |
| `space x x` | `diagnostics::Deploy` | `leader+xx` | Matches |
| `space space` / `space f` | `file_finder::Toggle` | `leader+ff` | Two bindings for same action |
| `space ,` | `tab_switcher::Toggle` | `leader+,` | Matches |
| `space /` / `space s g` | `workspace::NewSearch` | `leader+/` / `leader+sg` | Matches both |
| `space s b` | `buffer_search::Deploy` | `leader+sb` | Matches |
| `space s r` | `projects::OpenRecent` | N/A | Zed-specific recent projects |
| `space s s` | `outline::Toggle` | `leader+ss` | Matches |
| `space s S` | `project_symbols::Toggle` | `leader+sS` | Matches |
| `space shift-c` | `workspace::CopyPath` | `leader+C` | Matches |
| `space y` | `workspace::CopyRelativePath` | `leader+y` | Matches |
| `S-h` / `S-l` | `pane::ActivatePreviousItem` / `ActivateNextItem` | `S-h` / `S-l` | Matches |
| `g d` / `g r` / `g i` / `g t` | Go to definition / references / impl / type | `gd` / `gr` | Matches; adds `gi` and `gt` |
| `g D` | `editor::GoToDeclaration` | N/A | Zed addition |
| `K` | `editor::Hover` | `K` | Matches |
| `space c r` / `space c a` / `space c f` | Rename / code action / format | `leader+cr` / `leader+ca` / `leader+cf` | Matches |
| `C-n` / `C-p` | `vim::ScrollDown` / `vim::ScrollUp` | `C-n` / `C-p` | Matches half-page nav |
| `A-v` | `vim::ToggleVisualBlock` | `A-v` | Matches |
| `g j` / `g k` | `vim::NextMethodStart` / `PreviousMethodStart` | N/A | Zed-specific method navigation |
| `space v` / `space V` | `editor::SelectLargerSyntaxNode` / `SelectSmallerSyntaxNode` | N/A | Zed-specific (visual mode) |
| `j k` / `j j` | `vim::NormalBefore` | N/A | Insert mode escape chord |
| `C-s` | `workspace::Save` | N/A | All editor modes |

### Project panel (vim-style navigation)

| Binding | Action |
| ------- | ------ |
| `j` / `k` | `menu::SelectNext` / `SelectPrevious` |
| `l` / `enter` | `project_panel::Open` |
| `h` | `project_panel::CollapseSelectedEntry` |
| `a` / `A` | `project_panel::NewFile` / `NewDirectory` |
| `r` | `project_panel::Rename` |
| `d` | `project_panel::Delete` |
| `y` / `p` / `x` | Copy / Paste / Cut |
| `G` | `project_panel::ToggleHideGitIgnore` |
| `H` | `project_panel::ToggleHideHidden` |

## Cursor / VSCode

- Primary file: `keybindings.json`.
- If using VSCodeVim, route modal motions through Vim extension commands and use `when` clauses for context (`vim.mode`, `editorTextFocus`, `terminalFocus`).
- Use native VSCode commands for explorer/search/problems/source-control to match leader categories.
- Ensure `Alt` chords are not shadowed by OS-level bindings.

## Conflict policy

When a collision happens, keep this precedence:

1. Navigation primitives (`A-h/j/k/l`, `S-h/l`, `A-p/n`)
2. Leader group semantics (`leader f/s/c/x/g/u/q`)
3. Nice-to-have local shortcuts

If an app cannot support exact parity, preserve the category and mnemonic first, exact chord second.

## Practical rollout checklist

1. Configure pane navigation parity (`A-h/j/k/l`) in each app.
2. Configure leader-group parity for `f`, `s`, `c`, `x`, `g`, `q`, `u`.
3. Configure diagnostics (`leader x j/k`) and git blame toggle behavior.
4. Verify terminal/editor contexts do not conflict for shared chords.
5. Document app-specific exceptions directly in this file as they are discovered.
