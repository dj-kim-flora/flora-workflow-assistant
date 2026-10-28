# The finish, the pre-flight and the checks

## Killing the slop

Left alone, every model drifts to the same default: subject centred and staring at the lens, evenly lit, everything in focus, a processed gloss on top. People read it in half a second and it says nobody looked. Slop fills every gap you leave open, so each thing you name (the framing, the moment, the light, the time of day) moves the frame one step away from it.

Two blocks handle the grade. The framing is on you to name.

```
THE FILM-LOOK LINE
soft cinematic lens, shallow depth of field with creamy focus roll-off,
gentle contrast with soft highlight roll-off, fine uniform film grain,
no oversharpening, no digital look

THE SKIN-REALISM BLOCK
Natural skin texture: realistic pores, fine hairs, subtle veining,
a faint highlight. Tactile and real, not retouched plastic.
```

**Words that summon the slop, so leave them out:** ultra sharp, hyper detailed, crisp, razor sharp, 8K clarity, HDR, ultra-realistic detail. Grain is the one film artifact worth keeping; never dust, scratches or "old damaged film".

**A short list of look words that worked. Stack two or three, never all of them.** Stacked look words dilute each other and the strongest one stops landing.

| | |
|---|---|
| Light | single soft key from upper left, hard shaft of light, practical light only, low-key, rim light, golden hour |
| Grade and mood | muted palette, faded blacks, gentle contrast, cinematic, editorial, quiet-luxury, understated |
| Texture | fine uniform film grain, visible pores, tactile fabric weave, atmospheric haze, soft highlight bloom |
| Composition | generous negative space, centered deadpan framing, chest-up crop, slight three-quarter angle, leading lines |
| Blur and focus (say the effect, not the gear) | background melts into soft blur, creamy focus roll-off, subject sharp against a soft distance, only the label in focus |

Pairings that tested well: *cinematic + fine film grain + hard side light*; *muted palette + faded blacks + negative space*; *practical light only + atmospheric haze*.

**Word leakage: a mood word colours the whole frame, not just the thing it describes.** Write "dewy" or "sensual" anywhere, even about the lighting, and the model nudges the entire image that way: clothing starts slipping, expressions turn pouty. The counter is an explicit instruction that feels unnecessary when you write it: *straps stay neatly in place; lips are closed and relaxed.* Keep a standing avoid list for the usual drift on a portrait row (smiling, glamour makeup, jewelry, plastic smooth skin, dramatic rim light, coloured background, soft focus) and escalate only when a run needs it. This is the same failure as a writer naming what a reference should supply, one level up: the leak is a mood rather than a noun.

On a block the person looks at, none of this is typed by them. It lives in the ask's lock, or in the prompt the canvas wrote. They write plain English; the vocabulary is what the assistant puts behind it.

## Before you fire (pre-flight, every run and every re-run)

Every rule here is written elsewhere in this skill, and every one has still been broken mid-build, because nobody re-reads files in the middle of a run. If a run comes back wrong, walk this list before changing the prompt. Four of the five failures on one September build were one of these, not a prompting problem.

- **A Batch on an in-edge means the batch-run tool, never a normal generate.** Generate runs the box once against the first item, bills that one run, and returns a normal pending result. Check the in-edges, not the label.
- **A text box's `done` does not mean it ran.** Gate on the output source being `generated`. `prompt_echo` means it handed back its own prompt, and the picture beneath it will be built on nothing. Re-fire with about ten seconds of spacing.
- **A reference wired into the generator means the ask must not name what that reference supplies:** the material, the colour, the finish, the light. The test is whether something wired in already supplies it. With no swatch wired in, the prompt is the source of truth: name it hard and fence it with negations.
- **A review page or sheet with saved choices means read the saved choices now,** not when the page was made. The person's marks land afterwards.
- **A placement row means count the copies in every batch item.**
- **Read every estimate and every `runs` figure,** and compare the total to what the person accepted.

## Checks

**When the deliverable is a set, the check is one judge over the whole set, not one per row.** Wire every frame into a single text box and give it a rubric: restate the ground truth, then ask the same lettered questions of each frame, numbered, one short line per answer. Require *"a plain observable fact, never an opinion, never a judgement of quality"*, which stops a judge writing criticism instead of looking. Ask back the avoid bullets the prompt declared, from the other side: the prompt says what must not happen, the audit asks whether it did. On a twelve-view set that receipt caught a heel wordmark misspelled by one letter, a tongue label reading the wrong number, and trouser cuffs covering the shoe collar in four frames: one-character defects that no per-row check and no eye at contact-sheet size would have found.

For a single row, at most one check box, and only for what the eye cannot see: sizes against a figure, camera drift between first and last frame, a count of rooms and openings.

- **Check scale first on every placement row:** a real measurement in the sentence and a comparison in the frame, before any check box.
- **Then count the copies.** Placement rows add a second one of the thing about a third of the time, and a batch hides it: the duplicate is in item four while items one to three are clean, so a spot-check passes. Look at every item. Say "exactly one, no copies" in the ask. That is necessary, and on its own not sufficient.
- The person's check is their eye. When something is off, they go to the precision tools, not to a complaint box.
- Run check boxes on Gemini 3.1 Pro or Claude Opus 4.8 (`models-and-cost.md`).
- A prompt that asked for the shape to be preserved is not evidence that it survived. Read the output against the input, never against the instruction.
- **Judge fine detail at 100%, never off a contact sheet.** Contact sheets are for triage (which of six to look at) and lie about anything small: lettering, a logo, a seam, a hem tag. Crop the region and view it at full size before calling type broken. Type called mushy off a downscaled sheet was correctly spelled and sharp in the file.
- For clips, compare the first and last frame to the stills.

## Before you call it safe to show someone else

Open every box and look for:

- Logos, names, products or people from a different project left in.
- Assets carried over from another job (modules get copied with their assets still attached).
- Third-party brand names in prompts or images.
- Content that looks like a known show, character or someone else's unreleased work.
- Content that is not safe for work, or a risky edit involving children or removing clothing.
- Boxes with PLACEHOLDER prompts or errors.
- Found images whose source or licence is unclear.

Report: "Check: clean" or the list.
