# FLORA Workflow Assistant

**A helper for your AI that builds FLORA workflows with you.** You describe what you want to make. It asks a few easy questions, shows you a plan and the price, and only builds after you say yes. No coding, no jargon.

---

## Install in 3 steps (about 3 minutes)

### Step 1: Download

**[Click here to download the zip](https://github.com/dj-kim-flora/flora-workflow-assistant/releases/latest/download/flora-workflow-assistant.zip)**

Do not unzip it. Leave it as a `.zip` file.

### Step 2: Add it to your AI

**In Claude (claude.ai or the Claude app):**
1. Open **Settings**.
2. Find **Skills**. It can also be under **Capabilities**.
3. Click **Upload** and choose the zip you just downloaded.
4. Make sure the skill is switched **on**.

Can't find it? Ask your AI: *"Where do I upload a skill?"*

**In Claude Code or another coding assistant:** unzip it, then copy the folder `flora-workflow-assistant` into your skills folder (for Claude Code, `~/.claude/skills/`).

**In ChatGPT, Gemini or any AI without skills:** open the zip, copy everything in `SKILL.md`, and paste it at the start of a new chat. When it asks about a file, paste that file's text too.

### Step 3: Say hello

Start a new chat and type:

> **Help me build a FLORA workflow. Ask me what you need.**

That's it. It will ask you up to three questions and take it from there.

---

## What to expect

1. It asks what you want to make, what files you have, and which FLORA project to use. Each question comes with a suggested answer, so you can just say "yes".
2. It shows you a **plan** in plain words, with the **price in dollars**, and waits.
3. You say yes. It builds. Nothing runs or costs money until you say so, and nothing gets deleted.
4. It tells you exactly what is left for you, such as adding your own photos.

**Want it to build straight into FLORA?** Connect FLORA to your AI first (look for "FLORA" in your AI's connectors or integrations). If you don't, no problem: it writes the steps and you follow them in FLORA, one by one.

## Make it yours

The first time, it offers a one-minute setup: your style, the models you like, how much it may spend. You can skip it.

Later you can just say things like:
- *"Remember that I never want smiling faces."*
- *"Never spend more than $5 without asking me."*
- *"Save this as a recipe."*

A **recipe** is a short description of a workflow that worked. A few are included (product photo sets, 20 versions of one idea, short films and more). You can change them, delete them, or add your own.

## Stuck?

Tell your AI: *"I'm stuck. Ask me questions until we know what to do."* It is built to ask.

## Good to know

- Model names and prices inside the skill are a snapshot from September 2026. The assistant checks what your FLORA workspace offers and gets a price from FLORA before running anything.
- Your settings stay in your own copy. Nothing is sent anywhere.

---

<details>
<summary>For people who maintain this (technical)</summary>

```
skills/flora-workflow-assistant/
  SKILL.md                 the core: questions, build loop, rules that always win
  PROFILE.template.md      user settings, blank
  references/              grammar, ladder, mechanics, models and cost, checks, failure atlas
  recipes/                 starter recipes
scripts/
  build-zip.sh             builds the installable zip (runs the leak scan first)
  leak-scan.sh             checks shipped files against a local term list (_work/leak-terms.txt, gitignored)
tests/                     test personas and a scoring rubric
```

- Keep `SKILL.md` small. Put detail in `references/`.
- No client names, brand names, file names, project links, personal names or internal tool names in any shipped file. No em dashes.
- Before a release: `scripts/leak-scan.sh`, then `scripts/build-zip.sh`, then attach `deliverables/flora-workflow-assistant.zip` to a GitHub release with that exact file name so the download link above keeps working.

</details>
