# Models and cost

## Rule zero: check what the workspace offers

Model names and prices change every few weeks. Before choosing a model or quoting a price:

1. List the models in the person's workspace (`flora_list_models`, or ask them to open the model picker).
2. Prefer the newest generation of the model family the table names. A model more than one generation behind does not go on a build that will be shown to others, whether this page names it or not.
3. If a pick below is missing from their workspace, say so and offer the closest current one. Do not silently switch.
4. If their profile names preferred or banned models, that wins over this page.

The table is a **snapshot of September 2026**. It was written from real builds, and its date is the thing to check.

## Defaults for image work

Two models carry the image work, in this order: **GPT Image 2 first, Nano Banana Pro second.** These were the author's calls in September 2026; the profile can override them. Where a row needs the second choice, the reason is named. Older, cheaper image models are skipped on shown work, and that costs money on purpose: fewer, better items beats more, cheaper ones.

| Job | Model |
|---|---|
| Edits, relights, swaps, placements | GPT Image 2. Nano Banana Pro where the frame must survive untouched. Resolution set explicitly either way |
| Product or brand set with several references | GPT Image 2. Nano Banana Pro when the row is a preservation row (see below) |
| Composites and boards with type on them | GPT Image 2 |
| Batch fan-out and explore rows | GPT Image 2 at its lower quality setting; Nano Banana Pro at 2K as the second lane |
| Colour map | Seedream 5 Pro |
| A drawing redrawn with its lines locked | Nano Banana Pro, with an edge-guided model (Flux Canny) as the second lane |
| Turned views of one product | Qwen Image Edit Angles |
| Image to video | Seedance 2.5 at 5 s for a clip from a render or a two-still build-up. Seedance 2.0 Reference with a seed for a build-up from many stills (all stills wired in order, then a free Speed Up Video action) and for turntables and tracking shots with references. Kling 3.0 Pro as the second lane |
| First frame to last frame | Kling 3.0 Pro or Seedance 2.5, two image edges into one video box |
| Asks, lists, writers | GPT-5.5, or Claude Sonnet 5 / Opus 4.8 |
| A technical prompt from a brief | GPT-5.5 |
| Checks | Gemini 3.1 Pro or Claude Opus 4.8 |
| A voice line | ElevenLabs text-to-speech, about two words a second, under thirty words for a fifteen-second clip |
| Ambience under a clip | ElevenLabs Sound Effects, wired to the clip's audio edge |
| A music bed for the cut | ElevenLabs Music, one per film, on the timeline |
| Big enough to print | Topaz upscale, an action, last box in the row |

Seedance 1.5 Pro and Kling 2.5 Turbo Pro do not go on shown work: they were two generations behind in September 2026, and a row that shipped them was judged "poor model selection" even though the clips looked fine.

**On a preservation row, type and geometry are a trade, not a choice.** GPT Image 2 fixes the lettering and re-casts the scene around it: it once made a two-metre poster wall-sized and re-rendered the people in front of it. Nano Banana Pro holds the scene almost pixel-honest and lets a letter clip at an edge. Where the brief is *preserve this frame*, keep Pro and fix the defect geometrically (move the artwork off the edge) instead of switching models and accepting a new scene.

## Traps verified by wiring, not by generating

Check these before a run, not after. Each was found the expensive way.

- **"GPT Image 2" is two different models, and only one takes a reference.** The OpenAI-hosted one was roughly 160 credits and offered only `auto / 3:2 / 1:1 / 2:3`. Its image-to-image lane errored after a real 16 to 19 second attempt at every resolution, so treat it as text-to-image only. The fal-hosted one offers the full ratio list including 9:16, takes references, and cost far more than its list price in practice: about 519 credits at 3:2/2k and 880 at 9:16. So: the cheap lane for prompt-only rows; the fal lane the moment a picture is wired in or the ratio is 9:16. Six runs died on this before it was understood. Verify the current behaviour of each lane before relying on this.
- **Estimate every box before committing a set.** `flora_estimate_cost` is free, and the list price can mislead badly: one plan quoted about 4,100 credits and the real figure was 11,238. A video billed $6.05 against a "~$2.50" label. Put a billed price on a video box's label only after a billed run or an estimate. The estimator can read 0 on a fresh video box until duration and resolution are set as strings; set them and re-estimate before quoting.
- **Set `resolution` explicitly, and `"4k"` can be a trap.** It can pass validation and then fail at the provider in about three seconds. `2k` is the safe default. Nano Banana Pro's stored default fails too: set `"2K"` or `"4K"` in the params.
- **Video boxes created by tool can get an invalid default `aspect_ratio`.** Set it explicitly.
- **Seedance 2.5** has no camera-lock parameter and takes 16:9, 9:16, 4:3, 3:4, 1:1 and 21:9 exactly. Write the lock into the prompt and pad the still to a supported ratio when the edges matter. It has no seed, so a good take is the output you keep, not one you can regenerate. `aspect_ratio: "auto"` keeps a 4:5 still at 4:5. 7 s costs double 6 s. At the time, 2.5 ran about three times the price of Seedance 2.0 Reference at the same length, and 10 s at 1080p 16:9 cost about 7,300 credits.
- **Seedance 2.0 Reference** takes nine `imageUrl` edges into one box, has a seed, and estimated about 4,498 credits for 15 s at 1080p.
- **Clips cap at 15 seconds.** A longer ask is two clips and a cut.
- **Text models:** Claude Opus 4.8 listed at about 10 credits a run, Gemini 3.1 Pro about 28, and a Fable-class model at 800. Opus 5 returned a bare `LLM_ERROR` on prompts that ask it to read the people in a frame. Opus 4.8 errored on frames with lots of bare skin and on sets of nine tall frames; Gemini 3.1 Pro cleared both. Default asks and writers to Opus 4.8 or Sonnet 5; checks to Gemini 3.1 Pro (Opus 4.8 when inputs are few, landscape and show no skin).
- **Seedream 5 Pro Layerize:** see `mechanics.md`, "Actions".

## Quoting a price

- Say the price in **USD**, per box and for the whole plan. If the tool only returns credits, say "about N credits" and that you could not convert; never invent an exchange rate.
- Quote from the estimate tool where you have one. Where you do not, say it is a guess and by how much it could be off.
- Read `runs` before a batch. A cross product (see `mechanics.md`, "Batch") multiplies the price and cannot be cancelled.
- A spend cap in the profile is a hard stop: tell the person when a plan would pass it.
- Exploring on a cheaper setting and re-running the winner at full quality in a fresh box beside it is usually the cheapest honest path.
