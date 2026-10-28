# The ladder, and how to build each rung

Climb only as far as the job needs.

| What comes out | Shape | Text boxes |
|---|---|---|
| One edited image inside a photo you already have: swap, relight, recolour, redraw in a reference's line style, put a thing on a subject already in the frame | One box, one sentence, references wired in | 0 |
| A handful of variants you can name (about four at most; more is a list) | Sibling boxes off one source, one sentence each, stacked | 0 |
| The same edit, but the sentence keeps missing | Add a precision tool: annotation, colour map, inpaint, edge lock, layer editor | 0 to 1 |
| A thing placed into a world it was not photographed in | Staged pipeline, one sentence per stage, every middle step left visible | 0 |
| A recipe you already trust: storyboard, angles, resize, animate | One technique box | 0, or 1 holder if it takes a prompt |
| One for each item on a list, however long | One text box with a bulleted list > Batch > generator (a writer between only if the lock needs a full sentence) | 1 list box, plus the writer if used |
| Many views of ONE thing that must stay identical: a product set, a lookbook, a turnaround | Every reference wired into every generator, one invariant prompt, one line different per view | 0, the prompt is the holder |
| One asset per section of a brief, where the brief is the only source | One short writer per asset > generator | 1 per asset |
| A prompt that is itself the deliverable: a look that has to travel as words | Ask > write it > fix it, then paste into holders | 3, plus holders |
| A clip from a still | A holder with the lock sentence > video boxes, two models side by side | 1 holder |
| A film | One holder per shot > one clip per shot > voice, ambience and music lanes > cut | The holders |

The line between the first rung and the staged pipeline is the scene. Sunglasses on a model already in the shot is one box. A lip balm on a shelf that has to be found or built, or a building on a site, is the pipeline, however small the thing and however short the pipeline.

Three checks that catch the wrong rung:

- A row with more model-run text boxes than generators is over-built. Items, holders and the caption never run and do not count; one check box does not count.
- The ask is the box, whatever the rung. The only sentence typed into a generator is the one-clause image-to-image edit.
- A row whose first box is a generated image with no label saying so is not a template yet. The first box is a real file, or a declared last resort.

**Before adding a box, name what would fail, or what the person could not choose, if it were removed.** If the answer is only formatting, reassurance or showing off a tool, leave it out. A writer that only repeats direction you have already written is not a writer. A placement stage is earned by a deliberate visual choice, or by a placement failure you have seen, never by every compositing job.

## One box, one sentence

The prompt lives in the image box. References are wired in. One or two plain sentences that say what stays and what changes:

> change sweater in first image to sweater in second. everything else unchanged

> evening lighting, flash photography look

> sunglasses from second image on model in first. nothing else changes

When the thing has a size, say it and compare it to something in the frame, because the model has no other way to know: *"stick thumb-sized, about 7cm. spoon beside it longer."*

A style reference is the same kind of picture as the input. A plan sketch takes a plan diagram, a section takes a section, a photo takes a photo. Never borrow a different view and hope.

Something that appears in many sentences (their logo, product or model) is an **Element**, called by @ inside the sentence: *"@[sunglasses] on model in first image"*. Make Elements from their real files and name them in their words.

Variants you can name, up to a handful, are sibling boxes off the same source with one sentence each, stacked vertically. Never re-runs of one box, never a batch. A model comparison is the same sentence duplicated into a second box with the other model, stacked underneath, and its label says which one they use next. A comparison with no verdict is a bake-off, not their template. Label boxes by what they are ("evening relight"), never by the technique.

## Precision tools when the sentence misses

Do not write a longer prompt. Reach for the tool and say so: *if saying it is not hitting the mark, mark it.*

- **Annotation.** Draw a circle on a copy, then: *"change the colour of the strap circled in red to bright yellow, hex #FFD400, and remove the red circle."*
- **Colour map.** One text box, the ask: *"write prompt: segmentation map of image. four segments: red = shirt, blue = vest, yellow = bow, grey = background."* An image model draws the map. The edit box then takes map plus original: *"image 1 is the map, image 2 is the original. change only the red region: ..."* Call it a colour map: each colour is one part, and the edit only touches one colour.
- **Crop action** before anything else when a screenshot carries software chrome. Free, and it redraws nothing. (Outside that case, see "No crop boxes in a block" in `grammar.md`.)
- **Edge lock** (an edge-guided model such as Flux Canny, stacked under the main generator as a second lane) when the lines of a drawing must stay exactly where they are. It holds silhouette and line positions and nothing else, so it is wrong for protecting a material, a label or a wordmark.
- **Layer editor** for an exact placement of a logo or a cut-out, instead of asking a model to place it.
- **Inpaint** for a local removal. **It is not a pixel lock.** Inpainting boxes may take only an enable flag, text and an image, with no mask edge: the mask is painted by hand inside the box and cannot be wired, batched or saved as a technique. Anything built as draw-then-edit is an annotation route: the model sees and redraws the whole frame, so that row still needs its check. Verify what a box accepts by wiring before you promise a mask.
- **Wrong or soft type: name the words.** Asking for legibility does nothing. Put the exact string in the ask: *"reads SUMMER across the top and SALE across the bottom, in white letterspaced capitals, both words sharp and correctly spelled"*. A positive target beats a negation, and on type it is the only thing that works. When one word keeps mangling, spell it out letter by letter in an edit pass (*"spelled S, U, M, M, E, R"*) rather than re-rolling the whole frame. Say where the type sits too: models place words the way a designer does, so brief the zone ("headline across the top") as well as the string.

## Staged pipeline: a thing placed into a world

Placing a thing into a world is a sequence, not one prompt. The person needs to see every stage, because each stage is a decision they may want to change.

```
1 GEOMETRY        the real model: a GLB, OBJ or similar export, or captures from their own tool.
                  a screenshot of one view is one view, not geometry. a display, a booth or a stand
                  has geometry too: its model is stage 1 and the shop photo is the site at stage 4.
2 VIEWS           captures from the model: the angle, eye level from the approach, the entrance, the
                  hero interior. for a placement, the view is taken from where the site photo was
                  shot: same height, same direction, same lens.
3 MATERIAL RENDER "same geometry, same camera as the site photo, sun low and from the left, only the
                  surfaces change" + swatches wired in. read the light off the shadows in the photo
                  it will sit in.
4 PLACEMENT       into the site photo / the room / the shelf: "the photo stays exactly the same
                  outside the plot", and when the thing has a size, the size and something in the
                  frame it is smaller than.
5 PEOPLE + TIME   "now open and busy" / "end of the trading day, lights on, daylight gone"
6 CUT             one clip per still, then the timeline
```

Each stage is one image box, one plain sentence, with the previous stage wired in. Enter at the stage their file already is: a screenshot of a shaded viewport is already a view and enters at 3; a photographed product is already rendered and enters at 4 through a remove-background cut-out. Stop at the stage they asked for, and climb every stage below it in order. Going 1 to 2 to 4 is the same failure as 1 to 4. A white clay block dropped into a photo is the "missing render phase" failure. A thing imagined from text with no geometry behind it is the "add a 3D model to the material phase" failure.

When their export is a mesh, stage 1 is a 3D box they upload into and stage 2 is captures from it. That is an upload, never a generation: image-to-3D or text-to-3D is a stand-in and carries the stand-in label. A mesh with no stated size exports one metre tall without an error, so the label on the 3D box states one measured dimension. Use the layer editor or a remove-background cut-out when the placement has to be exact.

The world a thing is placed into obeys the Inputs rule too: the site photo, the room and the shelf are real photographs, theirs or found, with the source in the label. Only when nothing real exists is the environment generated, with an empty slot where the thing goes and a label that says it is generated.

## A technique box for a trusted recipe

Storyboard from one frame, six angles of one character, five aspect ratios, an image animated with a house meta prompt. One box, inputs wired, outputs fanned. The person sees one block with a name. If the technique takes a prompt, feed it from a holder so the words stay visible.

## One for each: the list rows

**The list is one text box holding a bulleted list: one short line per item. Never one box per item, and never a paragraph per item.** When the person asks for 20 variations, or anything above about four, build:

```
text box: bulleted list, one short line per variation  >  Batch  >  image box
```

One click makes all of them. Adding a variation is adding a bullet and running again, with no rewiring. Show the graph before you show the output.

Two ways to run it. Pick one, say which in one line, and offer the other:

- **Batch (default).** The list goes into a Batch and the Batch into one image box, which generates every item.
- **Branches.** The list is split into one branch per item, with an image box on each. Use it when the person wants to tune, re-run or give different references to single items.

Typed by the person or written by the canvas, the shape is the same. If the canvas writes the list, one text box asks for it: *"20 short prompts, bulleted, one line each, no preamble. each puts exact ad in a different out-of-home scene. ad copied exactly, nothing redrawn."*

Each line is a short prompt that stands on its own: a few words to one sentence. A lock that is the same for every item goes in as a few words per line, and only when the wired-in references do not already supply it. If the lock needs a full sentence, put one writer between the Batch and the image box and give the writer's ask the lock instead of repeating it twenty times: *"one material per run. write short image prompt: facade, camera, light unchanged; nothing moves, nothing added; only material changes. prompt only."* When a text edge is bound the generator's own prompt is dead, so the lock lives in the lines or in that writer.

**Traps, all of which look like success:**

- **Check the count before running anything.** A list inside one text box can reach the Batch as one item (`item_count: 1`), and then a single run quietly holds the whole list. Read the Batch's `item_count` and items, confirm the number matches the bullets, and only then run. If it does not match, say what the Batch received and offer the Branches route. Do not quietly fall back to N separate boxes.
- **Your tools may not be able to create a Batch box.** Some connections cannot. Build the list box and the image box, leave a named empty slot for the Batch, and tell the person how: "In FLORA, press + and choose Batch."
- **A text box created without a model silently defaults to a paid one** and will bill to echo your own list back at you. A list the person typed takes no model.
- **Wire the Batch into one consumer only** (the writer if there is one, otherwise the image box). A Batch into two boxes that depend on each other is a cross product, N times N runs, and the UI cannot cancel. See `mechanics.md`, "Batch".

The specificity of the items decides quality. *"hand-laid red brick, 215 by 65 millimetre bricks, flush pointing"* beats *"brick"* every time. A list row that places things into a world is still the staged pipeline; the batch runs the placement stage, not the whole row. Batches run the other way too: many images through one sentence. *"Place this exact installation on the floor of a real convention hall. Keep the structure, materials and logo exactly as shown."*

## One writer per asset from a brief

Brief in, one short writer per deliverable: *"read attached brief. write one image prompt, primary packaging only."* Each writer feeds one generator. Five asks, five boards. This rung is for a brief that is the only source, where every deliverable is made from words: packaging, a wordmark, a palette. A brief that arrives with a photograph or an export does not change the rung; the file does. The brief goes on the canvas as the pages the writers read (placed as images, or as a document box made by hand). A writer cannot read a file the person cannot see.

## The look you will apply many times

This rung is not reached by "we will do this to many files". A house drawing style, a background or a colour is a reference wired into one box, and one sentence over many files is a batch. Come here only when the look has to travel as words because a reference cannot be wired in beside every subject.

1. *"what makes these look like this: light, surface, shadows, lens."*
2. *"write as prompt for image box. short. nothing in picture moves, subject unchanged."*
3. Test it, then: *"tested: things moved, glow strobed. keep prompt structure, fix both."*

Read the writer's output before the image box runs. Paste the finished prompt into holders (text boxes with no model), wire each holder into an image or video box beside a reference, and run two models side by side. The critique lives here, once, with the references fed back in. No complaint box per image.

## A clip from a still

Write the lock sentence yourself into a holder and wire it to the video box. A working version: *"one continuous locked-off take from a tripod. the building does not move and the camera does not move."* Then say what may move: *"only the people walk and the light shifts a little. no cuts."* Two models side by side. If the take still creeps, name each move you do not want (pan, tilt, push in, zoom, handheld drift) and say the first and last frame are identical. There is no camera-lock switch to flip.

**Start/end frames and reference images answer different questions, and one generation can carry both.** Start and end frames decide where the shot begins and ends: pin the first frame to control the opening composition. References decide who or what appears and in what style, and hold across the timeline and many shots. Pin a start frame and attach a character or product reference in the same generation when you need both.

For a build-up or a reveal, wire two stills into one video box; it runs first frame to last frame by itself. The clip treats the stills as references, not copies: check the clip's first and last frame against the stills before you show it. For a turntable or a move through the space, use a reference-to-video model with the still and the product or logo wired in as references. For a clip they already have in a new shape, use a video resize action, not a re-shoot. Make the still the clip's shape first: the video models take a short list of shapes and outpaint the rest, and one clip runs to 15 seconds at most, so a thirty-second ask is two clips and a cut.

## A film

The person's stills are the shots. The shot list is one holder per still, no model, and each holder says why the shot exists and what the camera does, in plain words: *"shot 2 of 4, the approach. seven seconds. a slow push in from a tripod. the building does not move and nothing is added; only the people walk."* Arrive, enter, hero, detail, leave is a shot list; four camera moves is not. Every clip comes from the same still set so the sun, the materials and the people match shot to shot, on current models, with two lanes for the hero shot only. Sound is built to the picture: an ambience per clip wired into that clip, one music bed for the whole cut on the timeline, and a voice line only if the person wrote it and it fits at about two words a second. Then the timeline, and one check box on the row that compares first and last frames for drift.

When the canvas cannot carry the full film, build the clip rung on the hero still with its voice and ambience lanes, and say in the label what the full film adds. A requested film does not vanish from the canvas; it shrinks to the one shot that is honest.

## A tour of every feature

Sometimes the job is an introduction: a canvas that shows a team what FLORA can do. That is a menu, not a chain. Use one group per capability, with the person's own assets swapped in, and plain CAPS names ("VIRTUAL TRY ON", "VFX"). No numbering, no shape notation, no notes by default. Expect 80 to 100 boxes. Cover: image generation and image to image, text > image > video, casting with Elements, try-on or placement, applying a style, Batch, techniques, actions, layers, colour grading, VFX, image to 3D, voice / music / lip sync, and the timeline. The checklist is fixed; each group's example comes from the person's world. Asks stay short and dry. Do not cut a feature to keep the canvas small. Build and wire only; name which boxes they must create by hand.

## Working method

1. **Per row, one line on the plan:** what comes out and where it goes, what they start with, explore or execute. That line picks the rung. The plan goes through the approval before anything below happens.
2. **Put a real file first.** Their own, then files they have rights to, then a real example of the file type, then a declared stand-in. Tag the first box either way.
3. **Build it technically at that rung, then put it in the block shape.** Correctness first. In the block, the lock moves into the ask in the person's words, the generator empties, and any dense working version goes to an appendix band. Do not build at a higher rung and hope to simplify later.
4. **When an output is off, add a tool or a stage, not a text box.**
5. **Run what was approved. Read text outputs first.** Then check images for scale and trade nouns, which plain English loses. Fix in the open (a size sentence, an annotation, a stage), never with a complaint text box. One good image is a candidate, not a workflow: a row is reusable only once a second real input has been through it and come out right.
6. **Read it back as them** at presenting zoom, row by row, out loud. Every place you have to explain something the canvas did not say is a missing step or a missing label.
7. **Converting an existing canvas.** Read it first (outline view past 300 boxes, ids not short numbers, a screenshot per row at presenting zoom). Then per row, the same line as step 1, and rebuild at that rung beside the original. The dense prompt in the image box becomes a what-stays, what-changes, real-sizes sentence, or a holder when it is a look they will reuse. Before you cut the camera language, take the size it was smuggling and write it down in metres. Techniques and Elements stay. The originals move into one PARKED group. Nothing gets deleted.

## Handover

Keep it to a short note in chat, or in the format their profile names. It carries: which canvas is theirs and in which workspace; the swap list (every empty slot, what file goes there, and what format it leaves their tool in); what each row costs to run and what the spend prompt looks like; where every found image came from and which must be replaced before an output leaves the building; and the first things they will see (`failure-atlas.md`, "What you see first"). Before you send the link, open the copy in their workspace and run one box of every kind on it (one technique, one sentence that calls an Element, one clip). What runs for you is not always what runs for them.
