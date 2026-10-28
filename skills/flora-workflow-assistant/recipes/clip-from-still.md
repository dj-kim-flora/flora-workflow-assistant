# Clip from a still

**Makes:** a 5 to 15 second clip from one image where only the things you choose move: water, people, a hand typing, a product turning.
**Start with:** one real image, already in a shape the video model takes (16:9, 9:16, 4:3, 3:4, 1:1 or 21:9).
**Shape:** execute. Image > Text > Video (ladder: "A clip from a still").

## Blocks
1. **THE STILL:** the real image. If its shape is odd, make it the right shape first (an image-edit box), so the model does not invent edges.
2. **THE ASK:** one text box: *"write video prompt: only water and people move, slightly. camera locked, building still, nothing else moves, no cuts. prompt only."*
3. **THE CLIP:** one video box. Still wired in, text edge from the ask. Duration, resolution and aspect ratio set explicitly.
4. **SECOND LANE (optional):** the same ask into a second video model, stacked under. Label which one the person uses next.

## Empty slots
The still. What may move. How long.

## Watch out
- There is no camera-lock switch. Write the lock in words. If it creeps, name each move you do not want (pan, tilt, push in, zoom, handheld) and say the first and last frame are identical.
- Compare the clip's first and last frame to the still.
- Type in a still may get redrawn. Animate the clean image and add type later, or use the two-frame trick.
- Over 15 seconds is two clips and a cut.
- Quote the estimate first. A video can bill several times its label.

## Cost note
The most expensive recipe per run. Estimate with duration and resolution set as strings, run once, keep the take (some models have no seed).

## Notes
Starter recipe.
