# XCustomCodex / "Long Codex"

XCustomCodex is an improved codex menu boasting some very big features.

## Stock compatibility

* No need to make custom items, no need to edit your codex entries. It just works(TM). Using a vanilla auto-generated codex item will register it in this system's custom registry.

## Custom compatibility

* Don't feel like writing the same codex twice? You can now define codex entries like so, and the system will use the long data:
```json
"contentPages" : ["^red;Use the High-Fidelity codex to view this entry."],
"longContentPages" : [
"your codex stuff here"
]
```
The custom codex system ALWAYS targets longContentPages if it's available. If it's nil or empty, it goes to contentPages. This way, you can create an error message for the stock codex menu (as I did there) and make it only work on the good UI.

## Future-proof

* Got custom races? Not a problem! The UI has a scrollable list of custom races that automatically extrapolates on the race's icon. Can't get an icon? It'll generate an abbrevation on the fly for you.
* Use a fancy-schmancy custom gender? Not a problem! The system simply targets the first available species gender for the icon, it doesn't care if it's called "generation 69 apache attack helicopter".
* Get rid of a mod that adds a codex? Cool. No problems here.

## Example

![dat ui tho](https://i.imgur.com/GksuuTj.png)
