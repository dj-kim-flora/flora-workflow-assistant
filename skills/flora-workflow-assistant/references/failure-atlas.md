# Failure atlas

Every entry is a failure that happened on a real build. Symptom, cause, fix. Read the one that matches the picture in front of you. The last section is not a build failure: it is what a person sees first.

### Scale: the lip balm the size of a tub of gelato
**Symptom.** A product placed into a world comes back wildly the wrong size, though nothing in the prompt was wrong.
**Cause.** Technical prompts smuggle scale in through camera language ("100mm macro", "front third of frame"). Strip that out for plain English and the model has no idea how big the thing is.
**Fix.** A sentence with a real measurement and a comparison in the frame: *"chapstick small: thumb-sized, about 7cm long, 2cm across. state what is bigger."* "Make it smaller" does nothing. Check scale first on every placement row.

### Trade nouns: the endcap that was a shelf
**Symptom.** A word that means something precise in a trade (endcap, power wing, shelf talker, hero shot) produces something recognisably retail and recognisably not the thing.
**Cause.** The noun carries a full definition in the person's head and almost none in the prompt.
**Fix.** One text box with no downstream edge, dry and short: *"what makes a retail endcap read as endcap, not shelf: structure, placement in store, how photographed. practical, photographer's brief."* Read the answer and put the two or three things it named into the placement sentence yourself: *"a four-foot end-of-aisle fixture with a header sign, shot from the cross-aisle"*. Wiring that box into the image box would replace the placement sentence.

### The writer that spoke Stable Diffusion
**Symptom.** A room drifted, the door moved, the glazing was rebuilt, and the row grew a repair loop.
**Cause.** Asked *"what has to be said so the room stays exactly the room?"*, the text model answered with settings from another tool ("img2img, denoising strength 0.2 to 0.35, ControlNet, mask protection"). That text became the prompt, and the image model cannot act on any of it.
**Fix.** Skip the writer. One box: *"furnish as warm living room. walls, glazing, door, grey figure stay in place. figure 1.8 metres tall."* If a writer is genuinely needed, its ask ends with the standard clause: *"visible things only: no camera or lens names, no render engines, no other-tool settings."* Read its output before the image box runs.

### The invented input
**Symptom.** An expert says it is "not a starting point anyone in my field would use".
**Cause.** The row started from a generated box, a grey shape imagined by an image model, or a scene made from a text prompt. Nothing downstream was anchored to anything the person owns.
**Fix.** The first box is a real file: their export, then something they own, then a real example of the same file type, placed as a found image. For a building or a room there is no generated stand-in at all; a text-to-3D box is an invented input whatever box made it. Then views, then materials. The input drives the whole success of the workflow.

### The missing render phase
**Symptom.** A white clay model sits in a photo and looks like a white clay model sitting in a photo.
**Cause.** The row jumped from geometry to placement. No facade, no materials, no site light on the object before it was composited.
**Fix.** Climb the stage list in order: geometry, a view from where the photo was shot, a material render with the site's light named (read off the shadows in the photo), placement ("the photo stays exactly the same outside the plot"), then people and time of day. A model shown white is still rendered white, in that light, first. Use the layer editor when the placement has to be exact.

### The toy film
**Symptom.** "Doesn't meet pro production level", said twice.
**Cause.** Two stills, one sentence about motion, two five-second clips on an old model, a synthetic voice reading one line, a generic piano bed, a stitch. It assembled, so it looked finished.
**Fix.** The film recipe: one holder per shot that says why the shot exists and what the camera does; clips from one still set on current models; an ambience per clip; one bed on the timeline; a voice line only if the person wrote it and it fits at two words a second; a cut; one drift check. If the canvas cannot carry that, build the clip rung on the hero still with its sound lanes and say what the full film adds.

### Poor model selection
**Symptom.** A verdict of "poor model selection" on clips that looked fine: the locked-camera takes held the framing, and the fault was invisible in the picture.
**Cause.** Models two generations behind. Look at the model name on the box, not at the clip.
**Fix.** The newest in the workspace for the job, and the pre-build check in `models-and-cost.md`.

### The mismatched exemplar
**Symptom.** "Doesn't quite make sense": a sketch-to-house-style row nobody would run.
**Cause.** The style reference was a 3D axonometric of a building; the input was a floor-plan sketch. A plan does not become an axon. The chain then asked the canvas to describe a style it had itself invented.
**Fix.** The exemplar is the same drawing type as the input, and it is the person's real diagram. One box: *"redraw this sketch in the exact line style of the reference. every wall, opening and the stair stay where they are."* An edge-guided model as the second lane if the lines matter. It holds silhouette and line positions and nothing else, so it is wrong for protecting a material, a label or a wordmark, which need a masked edit.

### The silent fallback
**Symptom.** A row looks fully green and one picture is confident, plausible and wrong: packaging with no product in it.
**Cause.** A text box failed, usually because it was asked to perform an edit. No text arrived on the edge, and the image box ran its own placeholder.
**Fix.** Loud placeholders (*"PLACEHOLDER - a bowl of fruit on a table. if you can see fruit, the text box to the left did not run."*) and verification at the text boxes before the pictures.

### The paragraph prompt
**Symptom.** "These workflows are all using text boxes with long prompts that don't teach how the prompt was built." Every generator carried 70 to 270 words.
**Cause.** Drafts that were reviewed by agents that only ever add clauses. The result was typed into the generator and explained in a caption. The person saw a finished paragraph and no way to make one.
**Fix.** The block shape in `grammar.md`: the ask in a text box, the model's answer as the prompt, the generator empty. Measured, the short sentence matched or beat the paragraph on nine of eleven rows; where it lost, it lost on naming, never on length. It came back later because the closing clause for writer asks said "one paragraph", which kept producing one. The clause now asks for a couple of sentences and bullets of what to avoid.

### The twenty boxes
**Symptom.** A request for 20 variations became 20 separate text boxes, each holding a paragraph. The person had to scroll every one.
**Cause.** The list rung taught one small text box per item, and the prompts inside ran long.
**Fix.** One text box with a bulleted list, one short line per variation, into a Batch and one image box. Or split the list into branches with an image box on each. Check the batch count before running.

### The use-case assembly
**Symptom.** "I've realised what's off about your workflows": rows of twenty to forty boxes with lanes, takes, batches and hero boxes, each row a bespoke machine, and a beginner cannot see the grammar that made any of it.
**Cause.** Building per use case instead of per graph shape. The shape is the lesson; the use case is only the example.
**Fix.** One block per graph shape (two to five boxes, one gray title naming the shape, the ask in the person's words, the generator empty), and everything else in an appendix band. Rebuild fresh beside the old build, farther away on the canvas, with fresh input boxes. Delete nothing.

### The square video frame
**Symptom.** Clips placed through the API drew as square frames with the checkerboard beside a 4:5 video. Two see-through PNG exports drew with the checkerboard behind them.
**Cause.** An API-attached video box carries no width or height, and a non-group box's size cannot be set. Palette PNGs with a transparent index render see-through.
**Fix.** Clips are pasted or uploaded by the person in the UI and wired from there. Exports go on white before they go on the canvas. Park the bad boxes, unwired, with a "delete me" note; deletion is the person's click.

## What you see first

Four things that are not build failures. They will happen, and they go in the handover.

- **The spend prompt.** First run of the session, a box asks to allow spending. It is not an error. Credits follow the workspace the canvas lives in, so a copy in someone else's workspace burns theirs from the first run.
- **A red text box.** They edited an ask into an instruction ("take this picture and add...") and it errored. Re-running does nothing. The fix is the rule: ask for the words, `write prompt: add...`.
- **A clip the wrong shape, or with invented edges.** The still was not one of the shapes the video model takes, so it was padded or outpainted. Make the still the clip's shape first.
- **An idle box after a reload.** A reload resets the spend approval and drops anything queued. Run the box again; nothing is broken.
