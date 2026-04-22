# Zed Keymap Refactor Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rewrite `zed/.config/zed/keymap.json` so every binding aligns with the cross-app keybinding framework in `docs/keybinding.md`, adding missing categories and removing misaligned ones.

**Architecture:** Single-file config rewrite. No code, no tests — verification is done by opening Zed and exercising each binding. Changes are organized by category matching the framework's mapping matrix.

**Tech Stack:** Zed keymap JSON (JSONC with trailing-comma support), Zed actions API, vim_mode.

---

## Gap Analysis (reference — not a task)

| Status | Binding | Current | Change |
|--------|---------|---------|--------|
| ✗ Wrong | `alt-h/j/k/l` in Terminal | `ctrl-h/j/k/l` | Fix to `alt-` |
| ✗ Missing | `space x k` prev diagnostic | — | Add |
| ✗ Missing | `space x x` diagnostics panel | — | Add |
| ✗ Missing | `space g g` / `space g s` git panel | `space g n` | Replace |
| ✗ Missing | `space ,` buffers picker | — | Add |
| ✗ Missing | `space f t` / `space f T` terminal | `space t` | Add (keep `space t`) |
| ✗ Missing | `space t r` run task/test | — | Add |
| ✗ Missing | `space t s` spawn task | — | Add |
| ✗ Missing | `space s S` workspace symbols | — | Add |
| ✗ Missing | `space a` AI panel | — | Add |
| ✗ Missing | `alt-p` / `alt-n` prev/next tab | — | Add |
| ✗ Missing | `space w d` close pane alias | — | Add |
| ✓ Aligned | `alt-h/j/k/l` in Workspace | — | Keep |
| ✓ Aligned | `ctrl-n/p` half-page scroll | — | Keep |
| ✓ Aligned | `alt-v` visual block | — | Keep |
| ✓ Aligned | `space q q` / `space q a` quit | — | Keep |
| ✓ Aligned | `space z` zoom | — | Keep |
| ✓ Aligned | `space w v` / `space w s` splits | — | Keep |
| ✓ Aligned | `space x j` next diagnostic | — | Keep |
| ✓ Aligned | `space u shift-b` blame toggle | — | Keep |
| ✓ Aligned | `space g b` blame | — | Keep |
| ✓ Aligned | `space e` / `space E` explorer | — | Keep |
| ✓ Aligned | `space C` / `space y` clipboard | — | Keep |
| ✓ Aligned | `space f f` / `space space` find files | — | Keep |
| ✓ Aligned | `space /` / `space s g` grep | — | Keep |
| ✓ Aligned | `space s b` buffer search | — | Keep |
| ✓ Aligned | `shift-h` / `shift-l` prev/next buffer | — | Keep |
| ✓ Aligned | `gd gr gD gi gt K` LSP | — | Keep |
| ✓ Aligned | `space c r/a/f` code actions | — | Keep |
| ✓ Aligned | `space s s` / `space o` outline | — | Keep |
| ✗ Remove | `ctrl-\\` terminal dock toggle | Terminal | Remove (not in framework) |
| ✗ Remove | `space g n` git panel | Normal | Replaced by `space g g` |
| ✗ Remove | `space g h` diff hunk alias | Normal | Remove duplicate of `space g d` |
| ✗ Remove | `space r n` rename duplicate | Normal | Remove (use `space c r`) |
| ✗ Remove | `space .` code action alias | Normal | Remove (use `space c a`) |
| ✗ Remove | `space f r` file finder alias | Normal | Remove (use `space f f`) |
| ✗ Remove | `space t` terminal shorthand | Normal | Replaced by `space f t` |

---

## File Structure

- **Modify:** `zed/.config/zed/keymap.json` — single file, full rewrite

---

## Task 1: Write the new keymap.json

**Files:**
- Modify: `zed/.config/zed/keymap.json`

- [ ] **Step 1: Replace the entire keymap.json with the aligned version**

```json
[
  // ============================================================
  // PANE/WINDOW NAVIGATION
  // Framework: alt-h/j/k/l universal pane navigation
  // ============================================================
  {
    "context": "Workspace",
    "bindings": {
      "alt-h": "workspace::ActivatePaneLeft",
      "alt-j": "workspace::ActivatePaneDown",
      "alt-k": "workspace::ActivatePaneUp",
      "alt-l": "workspace::ActivatePaneRight",
    },
  },

  // ============================================================
  // VIM CONTROL MODE (Normal & Visual)
  // ============================================================
  {
    "context": "VimControl && !menu",
    "bindings": {
      // Half-page navigation: ctrl-n/p (framework: C-n/C-p)
      "ctrl-n": "vim::ScrollDown",
      "ctrl-p": "vim::ScrollUp",

      // Visual block mode: alt-v (framework: A-v)
      "alt-v": "vim::ToggleVisualBlock",

      // Method navigation
      "g j": "vim::NextMethodStart",
      "g k": "vim::PreviousMethodStart",

      // Prev/next editor tab (framework: A-p / A-n)
      "alt-p": "pane::ActivatePreviousItem",
      "alt-n": "pane::ActivateNextItem",
    },
  },

  // ============================================================
  // NORMAL MODE - Leader Key Bindings
  // ============================================================
  {
    "context": "vim_mode == normal && !menu",
    "bindings": {
      // === AI (framework: leader+a) ===
      "space a": "agent::ToggleFocus",

      // === Window/Quit (framework: leader+qq / leader+qa) ===
      "space q q": "pane::CloseActiveItem",
      "space q a": "workspace::CloseAllItemsAndPanes",

      // === Window Management (framework: leader+z / leader+wv / leader+ws / leader+wd) ===
      "space z": "workspace::ToggleZoom",
      "space w v": "pane::SplitRight",
      "space w s": "pane::SplitDown",
      "space w d": "pane::CloseActiveItem",
      "space w q": "pane::CloseActiveItem",

      // === Diagnostics (framework: leader+xj / leader+xk / leader+xx) ===
      "space x j": "editor::GoToDiagnostic",
      "space x k": "editor::GoToPreviousDiagnostic",
      "space x x": "diagnostics::Deploy",

      // === Git (framework: leader+gg / leader+gs / leader+gb / leader+uB) ===
      "space g g": "git_panel::ToggleFocus",
      "space g s": "git_panel::ToggleFocus",
      "space g b": "git::Blame",
      "space g d": "editor::ToggleSelectedDiffHunks",
      "space u shift-b": "editor::ToggleGitBlameInline",

      // === File Explorer (framework: leader+e / leader+E) ===
      "space e": "project_panel::ToggleFocus",
      "space shift-e": "project_panel::ToggleFocus",

      // === Clipboard (framework: leader+C / leader+y) ===
      "space shift-c": "workspace::CopyPath",
      "space y": "workspace::CopyRelativePath",

      // === File Navigation (framework: leader+ff / leader+,) ===
      "space space": "file_finder::Toggle",
      "space f f": "file_finder::Toggle",
      "space ,": "tab_switcher::Toggle",
      "space s r": "projects::OpenRecent",

      // === Search (framework: leader+/ / leader+sg / leader+sb) ===
      "space /": "workspace::NewSearch",
      "space s g": "workspace::NewSearch",
      "space s b": "buffer_search::Deploy",

      // === Buffer Navigation (framework: S-h / S-l) ===
      "shift-h": "pane::ActivatePreviousItem",
      "shift-l": "pane::ActivateNextItem",

      // === Symbols (framework: leader+ss / leader+sS / leader+o) ===
      "space s s": "outline::Toggle",
      "space s shift-s": "project_symbols::Toggle",
      "space o": "outline_panel::ToggleFocus",

      // === LSP (framework: gd / gr / K / leader+cr / leader+ca / leader+cf) ===
      "g d": "editor::GoToDefinition",
      "g shift-d": "editor::GoToDeclaration",
      "g r": "editor::FindAllReferences",
      "g i": "editor::GoToImplementation",
      "g t": "editor::GoToTypeDefinition",
      "shift-k": "editor::Hover",
      "space c r": "editor::Rename",
      "space c a": "editor::ToggleCodeActions",
      "space c f": "editor::Format",

      // === Terminal (framework: leader+ft / leader+fT) ===
      "space f t": "terminal_panel::ToggleFocus",
      "space f shift-t": "terminal_panel::ToggleFocus",

      // === Tests (framework: leader+tr / leader+ts) ===
      // Zed has no Neotest equivalent; task::Rerun = run last task (nearest test proxy)
      "space t r": "task::Rerun",
      "space t s": "task::Spawn",

      // === Command Palette ===
      "space p": "command_palette::Toggle",
    },
  },

  // ============================================================
  // VISUAL MODE
  // ============================================================
  {
    "context": "vim_mode == visual && !menu",
    "bindings": {
      "space v": "editor::SelectLargerSyntaxNode",
      "space shift-v": "editor::SelectSmallerSyntaxNode",
    },
  },

  // ============================================================
  // INSERT MODE
  // ============================================================
  {
    "context": "vim_mode == insert && !menu",
    "bindings": {
      "j k": "vim::NormalBefore",
      "j j": "vim::NormalBefore",
    },
  },

  // ============================================================
  // EDITOR CONTEXT (all modes)
  // ============================================================
  {
    "context": "Editor && !menu",
    "bindings": {
      "ctrl-s": "workspace::Save",
    },
  },

  // ============================================================
  // PROJECT PANEL (File Explorer)
  // ============================================================
  {
    "context": "ProjectPanel && !menu",
    "bindings": {
      "j": "menu::SelectNext",
      "k": "menu::SelectPrevious",
      "l": "project_panel::Open",
      "h": "project_panel::CollapseSelectedEntry",
      "enter": "project_panel::Open",
      "a": "project_panel::NewFile",
      "shift-a": "project_panel::NewDirectory",
      "r": "project_panel::Rename",
      "d": "project_panel::Delete",
      "y": "project_panel::Copy",
      "p": "project_panel::Paste",
      "x": "project_panel::Cut",
      "shift-g": "project_panel::ToggleHideGitIgnore",
      "shift-h": "project_panel::ToggleHideHidden",
    },
  },

  // ============================================================
  // TERMINAL
  // Framework: alt-h/j/k/l in terminal for pane navigation
  // ============================================================
  {
    "context": "Terminal",
    "bindings": {
      "alt-h": "workspace::ActivatePaneLeft",
      "alt-j": "workspace::ActivatePaneDown",
      "alt-k": "workspace::ActivatePaneUp",
      "alt-l": "workspace::ActivatePaneRight",
    },
  },

  // ============================================================
  // EMPTY PANE
  // ============================================================
  {
    "context": "EmptyPane",
    "bindings": {
      "space f": "file_finder::Toggle",
      "space e": "project_panel::ToggleFocus",
    },
  },
]
```

- [ ] **Step 2: Verify the file was saved correctly**

```bash
cat zed/.config/zed/keymap.json | head -20
```

Expected: first lines show the Workspace pane navigation block with `alt-h/j/k/l`.

- [ ] **Step 3: Commit**

```bash
git add zed/.config/zed/keymap.json
git commit -m "refactor(zed): align keymap with cross-app keybinding framework

- Terminal pane nav: ctrl-h/j/k/l → alt-h/j/k/l
- Add space-xk (prev diagnostic), space-xx (diagnostics panel)
- Add space-gg / space-gs (git panel, replaces space-gn)
- Add space-, (tab switcher / buffers picker)
- Add space-ft / space-fT (terminal panel)
- Add space-tr / space-ts (task rerun / spawn)
- Add space-sS (workspace symbols)
- Add space-a (AI/agent panel)
- Add alt-p / alt-n (prev/next editor tab)
- Add space-wd (close pane alias)
- Remove: space-rn, space-., space-fr, space-gh, ctrl-\\ (not in framework)"
```

---

## Task 2: Verify bindings in Zed

**Files:** none (manual verification)

Open Zed against this dotfiles repo and exercise each binding from the gap analysis table. Work through the categories in order.

- [ ] **Step 1: Pane navigation — terminal context**

  Open the integrated terminal (`space f t`), then press `alt-h`. Cursor should move to the editor pane.
  Press `alt-l` from editor. Cursor should move back to the terminal pane.

- [ ] **Step 2: Diagnostics**

  Open a file with a lint error. Press `space x j` → jumps to next diagnostic.
  Press `space x k` → jumps to previous diagnostic.
  Press `space x x` → opens the diagnostics panel.

- [ ] **Step 3: Git panel**

  Press `space g g` → git panel opens/focuses.
  Press `space g s` → same result (alias).
  Press `space g b` → inline blame runs on file.
  Press `space u B` → toggles inline blame display.

- [ ] **Step 4: Find / buffers**

  Press `space f f` → file finder opens.
  Press `space ,` → tab switcher opens showing open buffers.
  Press `space s g` → search panel opens.
  Press `space s S` → workspace symbol picker opens.

- [ ] **Step 5: Terminal and tests**

  Press `space f t` → terminal panel toggles.
  Press `space t s` → task picker opens.
  Press `space t r` → last task reruns (or shows error if no previous task).

- [ ] **Step 6: AI panel**

  Press `space a` → agent/AI panel opens.

- [ ] **Step 7: Tab navigation**

  With multiple files open, press `alt-n` → next editor tab activates.
  Press `alt-p` → previous editor tab activates.
  Press `shift-l` → next buffer (same as alt-n, confirms both work).

- [ ] **Step 8: Outline / symbols**

  Press `space s s` → inline file outline popup opens.
  Press `space o` → outline panel on the right focuses.

- [ ] **Step 9: Note any broken actions and fix**

  If an action fails (no response in Zed), open the command palette (`space p`), search for the intent (e.g. "previous diagnostic"), copy the exact action name shown, and update `keymap.json` accordingly.

  Then re-commit:
  ```bash
  git add zed/.config/zed/keymap.json
  git commit -m "fix(zed): correct action names after manual verification"
  ```

---

## Known Zed Limitations vs Framework

| Framework binding | Zed limitation | Decision |
|---|---|---|
| `leader+xx` diagnostics panel | `diagnostics::Deploy` opens a dedicated diagnostics buffer tab, not a panel toggle | Acceptable — closest equivalent |
| `leader+xX` buffer diagnostics | No per-buffer diagnostics panel in Zed | Omitted |
| `leader+xl/xq/xL` location/quickfix | Zed has no equivalent panels | Omitted |
| `leader+tO` test output panel | No Neotest equivalent; Zed uses Tasks | Omitted |
| `leader+ts` test summary | Mapped to `task::Spawn` (task picker) as closest proxy | Documented exception |
| `leader+fT` terminal at cwd | Zed has one terminal panel, no cwd variant | Both `ft` and `fT` map to same action |
