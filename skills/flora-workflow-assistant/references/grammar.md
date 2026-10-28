# The grammar: what a good FLORA workflow looks like

A workflow is the same graph whether it is simple or hard, but a person should be able to read it. A simple job looks simple. A hard job shows its stages. By the end of a row the person should believe they can make that output again on Monday without you and without the vocabulary.

## Three questions before a node exists

Answer these per row, in writing, before you build. The answers become the plan.

1. **What comes out, and where does it go?** One edited image inside a photo you already have. A thing placed into a world it was not photographed in. A handful of variants you can name. One for each item on a list. A clip. A film. And the destination (a phone, a product page, a pitch board, a printer). The output picks the shape; the destination sets the size and whether the row ends in an upscale.
2. **What do they start with?** Their real file, in the form it leaves their tool: a screenshot of a design tool, a product photo on a plain background, a mesh export, a brief PDF. If you do not have it, ask, or find a real example.
3. **Explore or execute?** Exploring wants many cheap options side by side, and still locks everything that is not being varied. Executing wants one locked reference carried through stages. A row is one or the other.

## The block

The unit is a **block**: a small group frame with two to five boxes reading left to right, and one short gray title above it naming the **shape** (for example "Image + Text > Image"), not the use case. The use case is the example inside the block.

**The person writes an ask, the model writes the prompt, the picture box stays empty.**

- The only thing the person types is an **ask** in a text box: short, dry, no first person. *"write prompt: only hands move, typing. no other motion. camera locked."* The text box's model answers underneath, in the same box. That answer is the prompt.
- The image or video box's own prompt is empty. It takes the writer's text over the text edge and the pictures over the image edges. Nothing is typed into it, so there is nothing to explain: the ask is the lesson and the answer is the receipt. Next time, the person edits the ask and runs again.
- One exception: the simplest edit, image to image. One short sentence typed straight into the image box: *"change the leaf in this image to a monstera leaf."* The moment it needs a second clause, a lock or a size, it becomes an ask.

### The six shapes, in the order a beginner learns them

| Shape | What it looks like | Example |
|---|---|---|
| Image box alone | A sentence typed in, no inputs. The baseline. | "a monstera leaf, studio light" into an image model |
| Text > Image | The ask in a text box, its answer feeding the image box | the same ask through a writer, prompt visible, picture from it |
| Image > Image | A picture in, one short sentence in the box | "change the leaf in this image to a monstera leaf" |
| Image + Text > Image | A picture wired into the ask and into the generator. One writer can fan into two generators. | a writer reads a plant photo and feeds two image models side by side |
| Image + Image > Image | Two pictures into one box, one sentence saying which is which | "change the leaf in the first image to the monstera leaf in the second" |
| Image > Text > Text + Image > Image | Describe, then condense, then apply | "describe composition of image. haziness only." then "condense into prompt for styling another image", then that prompt plus a new photo into an image model |

Video and audio follow the same grammar. Image > Text > Video is a clip from a still (the ask, a video model under it). Several images > Text > Video is a build-up from stage stills into one reference video box. Text list > Batch > Text > Image is a material list. Videos > Timeline > Stitch is a film.

### What a block does not have

Comparison lanes, second takes, hero boxes, batches of ten, paragraph labels, read-me boxes, check boxes. Those are working-canvas material. They go in an appendix band below the blocks, or stay on a private working canvas. Box labels are two to four words, the way FLORA names them. One tip label on the whole canvas where a beginner needs a hint, in gray. Nothing in a block is colour-tagged by role (see "Colour").

## The ask template

The asks that held up, in a form you can copy. Subjects here are invented; keep the shape.

- **Restyle a drawing from a reference, two pictures:** *"write prompt: redraw first image in style of second. every shape, line and label stays in place; only the drawing style changes. no dotted lines, no shading, nothing else drawn. prompt only."*
- **A look applied to many exports:** *"write prompt: first picture looks like second, the hand-drawn paper look. every object stays in place, same count, none added, none lost. prompt only."* When the reference alone drifts, name the look in a few words inside the ask: *"hand-drawn on cream paper, thin ink lines, flat pale colours, no shadows, no texture."* The writer sees one example, never the whole batch.
- **A rough model rendered:** *"write prompt: render the wire-frame chair in first picture as a finished chair, finish of second picture, light of the photo. shape, legs, proportions stay in place. prompt only."* The ask names what the input is (wire frame), because the writer needs it.
- **A pattern on an object, one per run:** *"write prompt: pattern from second picture on the sofa in first, one continuous skin over the whole cushion. shape, camera, light, room unchanged. prompt only."*
- **A material from a photo, one per run:** *"write prompt for image node, two pictures: mug first, glaze photo second. glaze goes on the outside of the mug. never name the glaze; call it 'the glaze in the second picture'. mug, camera, light, handle, table unchanged. scale glaze so the speckles read about 2mm across. prompt only."* The writer sees only the mug. A writer that saw the glaze photo wrote "blue speckled" into every run.
- **A room rendered:** *"write prompt: render the empty room in first picture as a finished living room in style of second: same materials, finishes, furniture, light as the photo, real photographic render. the four white cut-out figures become real people standing in place. walls, windows, daylight unchanged. prompt only."*
- **A build-up from many stills:** *"first and last of nine stages of the model. write video prompt: model grows stage by stage in picture order, each new part rising out of the top of the part below, until last picture complete. camera, background, base never move. no people, no text. prompt only."* All nine stills into one reference video box.
- **A build-up from two stills:** *"write video prompt: first picture to last. the model grows stage by stage, camera locked, background never moves. no people, no text. prompt only."*
- **A clip from a render:** *"write video prompt: only water and people move, slightly. camera locked, building still, nothing else moves, no cuts. prompt only."*

**The template that falls out of them:** what to do to the first picture (with, or in the style of, the second); what stays, named; one number where size matters; "prompt only."

Two of those slots decide whether it works:

- **A measurement.** An ask with a number holds; an ask made of adjectives drifts. *"About 2.4 metres tall, shorter than the shop window"* beats *"a large fixture"*. *"Sentence case, 6 to 10 words"* beats *"keep headlines short"*.
- **One named counter-example:** the specific wrong thing this row has actually produced before. *No second copy, nothing on the pavement, no repeated header, no tiling across the floor.* Take it from `failure-atlas.md`. Do not wait to discover it at a high cost per run.

A row with no measurement and no counter-example is a **weak ask**. Mark it as weak in the plan before building it. Name what must survive; do not describe it. Name the look in a few words only when the reference alone drifts. Never name a material or a colour the reference is supposed to supply. For video: the camera is locked, the things that never move, "no people, no text".

### Naming beats describing

- A busy image merged into a few blocks until the ask named the things that must survive.
- "White model" came back rendered until it said "plain white block, no windows".
- Three pictures got confused until they were named by what they are (the drawing, the photo, the render), never by number.
- Paragraphs taught nothing and bought nothing. A two-part sentence, what changes and what stays, matched or beat a 70 to 270 word paragraph on most rows. Where short lost, it lost on naming, not on length.
- One box beats a chain. Nine stills into one reference video box, with a seed, held the camera and grew the model in order for 15 seconds. Eight chained first-to-last clips cost several times more and jumped at every cut.

## When the set has to hold together: shared part + one changing line

For a twelve-view product set, a lookbook or a turnaround: wire every reference into every generator, use one invariant prompt, and change one line per view. It stays inside the prompt format: a couple of sentences, then bullets.

```
SAME IN EVERY FRAME. Do not paraphrase, reorder or add to it.
The product exactly as in the references, on a plain sweep, soft key light, true colour. One photograph.
- image 1 is the truth of the product: take nothing else from it, not its crop, camera height or pose
- the logo reads on the front only
- no grid, no contact sheet, no turnaround
- no second copy of the product

CHANGES PER FRAME
SHOT: three-quarter front, low angle
```

Three things carry it:

- **A reference contract, as one bullet.** With more than one reference wired in, a model does not know which supplies what. Say what each image is the truth of and what not to take from it: *"it is the truth of her face, her hair and the light: take those and nothing else, not its crop, its camera height or its pose."* Almost every two-reference failure is a missing reference contract.
- **The seam, labelled.** The operator can see which line is theirs to change and that the rest is untouchable. That is what makes twelve a set instead of twelve attempts.
- **The avoid bullets are the failure conditions.** Each one is a rerun trigger. Every new failure a row produces becomes a new bullet. They double as the audit rubric (`finish-and-checks.md`).

## Prompt format: dry fragments, then bullets

Applies to every prompt and ask written for the canvas, and to every prompt you ask a writer box to write: generator prompts, asks, holders, list items. It does not apply to how you talk to the person.

- **Dry.** No "I", "me", "my", "you", "we", "please", no thanks, no emotion, no explaining why. Dead phrases: "I need you to", "can you", "help me write", "look at these", "tell me", "ok now".
- **Fragments, not sentences.** Fewest words that still work. Test: delete a word; if the prompt means the same, it stays deleted.
- **Cut filler, not content.** Keep the named things that must survive, real sizes, and the avoid bullets.
- **One or two short lines, then bullets.** What to make or change, what stays. Things to avoid go in a bulleted list, a few words each.
- **Only the essentials.** Cut what the model does anyway, anything said twice, and gear or quality words ("ultra detailed", lens names).
- **Fits in the box without scrolling.** If a row truly needs more, say what the extra line fixes and ask first.

Example, as it would sit in a box:

```
bottle on wet stone ledge. soft morning light. label unchanged.
- no extra bottles
- no added text or logos
- no hard shadows
```

An ask to a writer box is the same: `write prompt:` plus fragments, ending `prompt only.` The opener stays because a text box must be asked for language, never to perform the edit.

Many variations are not many prompts. Ask for 20 and build one text box with a bulleted list, one short line each, then a Batch (`ladder-and-recipes.md`, "One for each"). Never one box per variation.

Guardrails ride inside the ask. The brand lock and the shape lock do not disappear; they move into the ask the person can read, so they can restate them on the next job.

## When the canvas writes the prompt

Five rules, because each one failed on a real canvas.

- **A text box asks for language. It never performs the edit.** *"write prompt: add two lines of text in empty space on left"*, never *"add two lines of text on left of this picture"*. The second one errors, and the image box underneath quietly runs its own placeholder.
- **Ask for words an image box can act on,** not settings from another tool. *"write image prompt: what stays in place, what changes, real sizes in metres."*
- **Every writer ask ends with the same clause:** *"2 sentences max, then avoid bullets. prompt only. visible things only: no camera or lens names, no render engines, no other-tool settings, no headings, no tips."* Gear numbers are weak levers: models barely tell 35mm from 50mm or f/1.2 from f/8. If one must stay, pair it with the visible effect it stands for: *"35mm film still, real motion blur, muted palette, natural grain."*
- **Never let the writer name what a reference is there to supply.** Any ask whose generator has a material, colour, finish or look wired in ends with *never name it; call it "the material in the second picture"*. Leave it out and the writer names what it sees ("pink panels"), and the row stops being a template: swap the reference and the words still say the old thing. **The mirror rule:** when the prompt is the only source of truth, name it hard and fence it with negations. With no swatch wired in, *"wheat-tan suede, a warm mid-tan, not orange, not caramel, not beige"* holds a colour across twelve frames. The test is whether something wired in already supplies it.
- **Placeholders fail loudly,** because the fallback is silent: *"PLACEHOLDER - a bowl of fruit on a table. if you can see fruit, the text box to the left did not run."*

Read the writer's output before the generator runs. Whatever leaked into it is about to be multiplied by every item downstream. A style extractor told to ignore subject matter still named flowers. A shoe writer told to hold a white backdrop wrote pale blue. On a batch, check the items themselves, not the box that fed them.

## Inputs: the first box is a real file

The input drives the whole success of the workflow, and a generated stand-in is not an input.

**Check the input can host the output first.** A 2.4 metre floor-standing display cannot go into a macro close-up of a counter. A cut-out that contains the product cannot produce a shot of the shoe inside it. A strip 2560 by 563 cannot be reproduced exactly on a square panel. No model rescues an input that cannot physically contain what the row asks for, and the failure looks like a model failure, so it gets re-rolled instead of re-sourced. Ask what the output needs room for, then pick the file.

Source the first box in this order. Go down only when the step above genuinely failed:

1. **Their own files.** Ask by name, for the actual export in the actual format. Ask twice if you have to.
2. **Files they own or have the right to use:** their own site, past campaigns, shoots, brand kit.
3. **A real example of the same file type** from a source that allows reuse (public domain, open licence, a manufacturer's own press page). Place it as a found image and put where it came from in the label. Stock libraries count as a last resort here, and many briefs forbid stock.
4. **A generated stand-in, declared.** Never for a building or a room, where a real photo or export always exists. Build it to look like the export, never like a finished render, and the label says it is generated.

Label the first box *"your product photo (stand-in from a free source: swap this for yours)"*. **The label does this job, not a colour.** Anything shown outside the room starts from step 1, because that is the rights answer as well as the look.

When their file arrives it goes onto the same box, so the wiring holds. A fresh box means re-wiring. Then the row is a new build: read every sentence for nouns that belonged to the example and for sizes measured against it, re-run, and check scale first.

## Colour means one thing: how good the output is

Colour is a verdict channel and nothing else.

| | |
|---|---|
| **green** | 5 / 5. Ship it. |
| **yellow** | 4 / 5. Usable, one thing short of shipping. |
| **red** | A human needs to look: a decision or a fix that is theirs. |
| **no colour** | Not judged yet. Every box on a canvas that has not been run. |

Only **outputs** carry colour. Inputs, asks, items and generators stay untagged. Block title labels go gray (chrome, not a verdict). Do not tag a file blue to mean "swap this": the box label already says it out loud (*your reference*, *your logo*, *the ask*). The payoff is that a run-through scans in one glance: you look for red. The palette is red, orange, yellow, green, blue, purple, gray. Override the meanings in the profile if their team uses other colours.

## Text boxes are dry

Fragments, no first person, no pleasantries. Asks are lowercase, one ask per box, opening `write prompt:` when the box must produce a prompt. Locks are fragments inside the image box: what stays, what changes, real sizes. *"every wall, window and door stay in place. figure 1.8 metres tall."* No paragraph appears anywhere, not even in a prompt the canvas writes.

## Names, captions, layout

- **Group names are CAPS and short,** one job each: `MATERIAL OPTIONS`, `PRODUCT ON THE SHELF`, `CAMERA LOCKED CLIP`. A comma in a group name means two groups.
- **One title per block, no captions.** The ask is the explanation. No read-me boxes, no essays on a row.
- **The first caption on the canvas says how to keep a result:** *"liked one? leave it alone. copy the box and change the copy."* A re-run in place is how the output they approved disappears.
- **Left to right, one step per box.** Comparisons stack vertically. Judge the layout at presenting zoom, 30 to 60 percent, not fit-to-view.
- **Captions are `text` boxes with no model and the words in the prompt.** Not screen-space label nodes (`mechanics.md`).

| Don't write | Write |
|---|---|
| contact shadow | soft shadow underneath |
| colour grade | make it warmer / cooler |
| composition | where things sit in the picture |
| composite | put this into that photo |
| reference-locked | it copies from your photo, not from the internet |
| aspect ratio | tall for phones / wide for screens |
| upscale | make it big enough to print |
| locked-off camera | the camera does not move |

## No crop boxes in a block

A crop action is free, and it still adds a box the person has to understand just to get their own size out. It is also the box most likely to eat the headline. **Put the size in the ask instead.** Name the finished dimensions, and where the output ratio does not match, reserve the band that will be trimmed: *"keep the bottom tenth completely empty, that strip is trimmed off at the end."* Then the frame is safe to trim in any tool they own. A build once generated 9:16 for a 1080 by 1784 spec, cropped on canvas, and the crop cut the last words off a headline that had been correct in the render.

## What does not get simplified

- Model choice and parameters: current models, resolution set explicitly.
- Real inputs: their files, or a real example of the file type, never a generated one.
- The locks: they move into the sentence; they are never dropped.
- The boring step that catches the boring failure: the cut-out, the print-resolution upscale. Audit scaffolding, frame grids, splits and trims stay off the canvas.

## The production bar

If the person would show the output to their own client, the row carries the full stage list and current models. A film row meets the bar in the film recipe (`ladder-and-recipes.md`) or it does not exist. When a row cannot reach the bar, do not build it; say so and park it. The row also has to be theirs: if the same description could be pasted into anyone else's brief, it is not a row for this person yet.
