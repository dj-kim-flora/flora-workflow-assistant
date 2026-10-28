# FLORA mechanics: wiring facts that save a rebuild

Read this before wiring, running or reading a canvas. Facts here were verified on real builds, mostly in September 2026. FLORA changes: if a tool result contradicts a line here, trust the tool and tell the person.

**Tool names.** Two kinds of connection exist and their tools are named differently. A canvas-pane connection has tools like `flora_add_nodes`, `flora_apply_changeset`, `flora_generate`, `flora_run_batch`, `flora_estimate_cost`, `flora_get_node_details`. A hosted connection has tools like `flora_add_to_canvas`, `flora_update_canvas_nodes`, `flora_run_canvas_nodes`, `flora_create_asset`, `flora_attach_asset`. Use whichever you have. Some lines below were verified on one kind only; where it matters it is said. If you have neither, you are working by hand: translate each fact into a UI step.

## The text edge overrides the box's own prompt

This is the mechanism the whole "ask, write it, run it" chain rests on.

> The prompt actually sent is the **first non-empty text arriving on an inbound edge**. The box's own prompt is used only when no bound text input carries text.

So a generator wired text-edge from a text box runs whatever that text box produced; its own stored prompt is dead weight. Put a placeholder in it that fails loudly: *"PLACEHOLDER - a bowl of fruit on a table. if you can see fruit, the text box to the left did not run."* A node-details call can report which upstream node overrides the prompt.

**The fallback is silent, and that is the dangerous part.** A failed or empty upstream text box does not stop the run or turn the image box red. The image box generates from its own stored prompt and reports `done`. A row can look entirely successful while one link never fired. Confirm a chain by reading the text box's output, not by looking at the picture.

Text boxes fail more often than image boxes, usually with a bare `LLM_ERROR` and no message. Three causes seen: an ask shaped like an image edit ("take this picture and add..."), a silent content refusal (some models on pictures of people or lots of bare skin), and a per-model limit on how many images it can read. Retrying never helps. Rewrite the ask if it is edit-shaped; otherwise swap the model (a Gemini Pro-class model cleared every refusal and limit case first try).

The **entire** text output becomes the prompt, headings and all. If the writer emits a structured document ("THE IDEA / WHO IT IS FOR / PROMPT: ..."), the image model receives all of it. Ask the writer for the prompt only. Let any strategy live in a separate, unwired box.

## Connect handles

- Feeding an image into a generative box: the handle is `imageUrl`. Not `image_url`; that is the params key. A wrong handle rejects the whole batch of changes with `invalid_connection` and lists the valid set: `enabled`, `text`, `imageUrl`, `videoUrl`, `audioUrl`.
- There is no `imageUrls` handle, even for multi-image modes. Wire **two** `imageUrl` edges into one video box and it resolves to first-frame-last-frame mode on its own (seen on Seedance 2.5 and Kling 2.5 Turbo Pro; re-confirm on a newer model before shipping a first/last row). Connect order decides first and last. To re-point either frame, disconnect both edges in one change and connect the new pair in first-then-last order in a second change. Doing both in one change rejects with `The connection already exists`.
- That two-edge trick is the clean way to animate a still with a caption on it without the video model drawing type: frame 1 is the clean image, frame 2 is the same image with the text added by an image model. The endpoints are references, not copies: a white ground can come back black and a plate can invent detail. Check the clip's first and last frame against the stills.
- Audio wires with `audioUrl`. Actions wire with `in: "source"` (crop, change aspect ratio) or `in: "videos"` (stitch), and drop their result on a NEW box. Wire the result box, never the action.

## Captions and labels

Screen-space label nodes (`text_label`) are a trap: they render in screen space, not canvas space, so a label that looks right at 60% zoom swallows the row at 12%. They do not appear in a canvas read or stay addressable, an API-made label can render as an empty "Type here" chip, and a prompt on one can reject the whole batch. Captions are `type: "text"` boxes with the sentence in the prompt and no model. They read back, take colours, persist and scale with the canvas. Set the sentence at creation: an update to a model-less text box's prompt can return `no_op`, so a wrong caption is replaced, not edited. Park a caption above the row it heads, outside the group frame. Read the position back: labels have been seen landing 250,000 units off the board.

## Placing a found image

A real-world input found on the web goes on the canvas as a `static_image` box with an `image_url`. On generative boxes, images arrive over `imageUrl` edges, never through a top-level `image_url`. FLORA fetches the URL server-side and rehosts it. A site that blocks hotlinking may fail. If the box renders as a broken thumbnail, upload the file first with `flora_create_asset` (source `signed-url`) and place the resulting FLORA-hosted URL. On a hosted connection: creating an asset with a project id already places the box; calling attach afterwards places it twice. Keep the original source in the box label so provenance and rights stay visible.

## Holders

A finished prompt pasted into a `text` box with no model, wired into an image or video box, is a **holder**. It never runs (`output.source: "prompt_echo"`), so it costs nothing, and the person can read and edit the prompt without regenerating anything. This is how a meta prompt is applied to a dozen images and how a lock sentence reaches a video box. To know whether a text box actually ran, gate on `output.source` being `generated`, not on `status: "done"`.

## Batch

Items are the wired sources: model-less `text` boxes (their prompt is the item) or images. The Batch locks to the type of the first source wired in. A Batch fans out only the box fed directly by it; run that box, wait for the batch status, then run the next.

- **A normal generate call on a box that has a Batch on its input does not fan out and does not error.** It runs the box ONCE against the first item, returns a normal pending result and bills that one run. Nothing signals that the other items were skipped. Any box with a Batch on an input edge is run with the batch-run tool (`flora_run_batch`), always. Check the in-edges before firing, not the label.
- When a text edge is bound, the generator's own prompt is dead, so the lock lives in each item (complete one-line prompts) or in a composing writer between Batch and generator.
- One Batch can feed two direct consumers; run each in turn and poll the batch status.
- Text items > Batch > writer > generator works: the writer is the Batch consumer and the generator downstream still fans out. A writer with a Batch on its text input answers one item at a time. Run the writer's batch, then the generator's. The chain does not propagate on its own.
- **A generator with two batched inputs crosses them.** Five views ran 25 times when the Batch's images and a writer that was itself fed by the Batch both reached the generator. Wire the writer to one example image when the ask is the same for every item. Keep the Batch on the writer only when the ask must read each item. Read `runs` from the cost estimate before running a batch. The UI queue cannot cancel a run.

## Generation pacing and spend approval

- Fire at most 2 to 3 generate calls in quick succession. Firing a dozen about a second apart puts most into error with `CLIENT_KICKOFF_THREW` and no message. They are transient: re-firing at about 5 seconds apart succeeds. For a heavy image model, fire in waves of about six; six or more at once produced `GPU_PROVIDER_ERROR: The generation timed out`, and the box keeps no output, so re-running it is not a re-roll.
- A text box that errors: re-fire with about ten seconds of spacing.
- Spend approval is per browser session and **resets on every page reload**. A reload also silently kills any timer queue used to pace runs, leaving boxes idle. Re-check state after any reload. An idle box after a reload is not broken: run it again.
- The approval box only exists while a generate call is pending, so fire first and then find the button ("Allow for this session"). A cookie banner can sit on top (dismiss it first). A synthetic click may not land; ask the person to click it unless their profile says the assistant may. Some sessions never raise it. Write a fallback and do not block on it.
- Credits follow the workspace the canvas lives in, so a copy in someone else's workspace burns theirs from the first run.
- Price a row before it exists: `flora_estimate_cost` returns a box's cost without running it. `insufficient_credits` and `BILLING_*` errors are not retries: stop and relay the error and its upgrade link.

## Reading a canvas you did not build

- A canvas read caps at 300 boxes. Filter or request the outline on larger boards.
- Node details take at most 20 ids per call. Chunk.
- Short ids (`n123`) renumber when the canvas changes underneath you, and after every add. Capture the full `node_id` ids from the response of the call that created a box and use those for anything you will touch later. Resolve ids by label immediately before each change.
- Focusing on a group and taking a screenshot is the fastest way to see how a section reads. Judge layout at presenting zoom (30 to 60%): at 11% everything looks broken, at 100% you cannot see the row.
- Positions and groups do not always persist. Groups created by a pending reference in the same change as their members returned `ok: true` and then vanished, and positions drifted thousands of units. Re-assert in a separate pass: set every position, create the frames with explicit position and size, then re-parent members into them, and read back to confirm. Re-parenting keeps the box's absolute spot and drags the frame, so fix the member's position first and the frame second. An action box can be placed on the canvas but may not be parentable into a group by tool; position it inside the frame by hand.
- Video placed with `flora_attach_asset` can arrive as a 384 by 384 frame with no size data, so a 4:5 clip shows a checkerboard on both sides, and size cannot be set on non-group boxes. Ask the person to paste or upload clips in the UI and wire from those.
- A canvas the person sends you holds their files and their attempts. Read it the same way as any canvas, download every image and a first frame of every clip, and lay each group out as a contact sheet before deciding anything. `staticImageBlock` boxes are uploads; boxes with a `generation_id` are attempts. An upload label is usually the export's real file name, which tells you the tool and the series. Their uploads become the first inputs of every row. Their attempts go in the plan as what they tried: what they wired, what they typed, what they got, and one honest read of why. A box with no input edges and a one-line prompt is a re-run whose history is gone; say that too. Build the row to fix exactly the miss their attempt shows.

## Documents

A tool connection may not be able to make a document box. Rasterise the pages a writer needs, one PNG per page at 2K, and place them as `static_image` boxes wired into the writer, naming the page in the ask (*"the packaging brief is the second image"*). A document box made by hand in the UI feeds writers over its `documentUrl` output and is fine when the person can drop the file.

## Audio

An ambience track wired into a video box rides under that clip. A music bed goes on the timeline, not on a clip. A text-to-speech voice runs about 2.3 words a second, so a line under thirty words fits a fifteen-second clip. Measure the file before cutting.

## Elements

An Element is a named reference the prompt calls with `@[name]`. Up to six sit in one prompt and they work across text, image and video boxes. A tool connection may not be able to create one; it is made by hand from the person's real files. Before handing a canvas to someone in another workspace, confirm Elements and techniques resolve there: run one prompt that calls every Element and one box from every technique on their copy. A technique the workspace does not own renders as a block with nothing inside.

## 3D

The 3D box may be uncreatable by tool; make it by hand in the UI. Then model swap, upload and captures can run. It is an upload of the person's mesh, never a generation. A mesh with no stated size exports one metre tall without an error, so state one measured dimension on the box. A public file URL for a model comes from the model's asset id when a downstream tool needs the file.

## Actions

- Crop takes a normalized centre and size. Change-aspect-ratio takes an aspect ratio plus `fit: crop|pad`. Both drop the result on a new image box.
- There is no credit-free subject cut-out action. A colour-key filter is only a colour key.
- Non-generative actions such as Remove background reject very large sources (about 89.5 million pixels). Feed them a 2K tile, not the raw shoot master.
- Timeline boxes accept `videoUrl` edges but may not be runnable by tool: they export from the UI. Say "open the timeline, press export".
- A layer-split model (for example Seedream 5 Pro Layerize) keeps the flat composite on its own box and delivers the layers as separate result boxes wired from the source, each transparent. Read those before calling the split flat. Do not add an aspect ratio of `auto` to it: it rejects at add time; add it without params.

## Transparency and vector

- Exports with an alpha channel over a palette colour (some design tools) are RGBA with alpha 0 over, say, a green. Image models composite them fine. For first/last-frame video, flatten onto white first. Put exports on white before they go on the canvas, or they draw with a see-through checkerboard.
- Any image on the canvas can be exported as an SVG from the canvas itself, so a "vector output" requirement is met by clean linework on a raster box plus the export. Keep the drawing to solid fills, hard edges, white paper, no texture. A vector-only model can be text-in only and may not hold geometry.
