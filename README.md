
# dk-changename
Et simpelt script til at ændre navn spillerens til vrp-framework.

## Konfiguration

Her er konfigurationen for scriptet:

```lua
Config = {}

-- { Steder hvor du kan ændre din identitet } -- 
Config.places = {
    {
        coords = vector3(-377.1937, -1658.4775, 19.0373), -- { Koordinater }
        blip = { blipID = 176, blipColour = 69 }, -- { Blip ID'et, alle blips kan findes her https://docs.fivem.net/docs/game-references/blips/ } --
        name = 'test', -- { Navn på stedet, som vises på blip og textUI }
        use = {
            price = { 
                usePrice = true, -- { Om det skal koste penge at ændre navn } --
                price = 1000000 -- { Beløb } --
            },
            item = { 
                useItem = false, -- { Om det skal kræve et item for at ændre navn } --
                itemName = 'lockpick' -- { Item navn, som kræves for at ændre navn } --
            } 
        }
    }
}
```

Dette script tillader spillere at ændre deres navn på bestemte steder i spillet. Hver placering kan have forskellige krav, som f.eks. en pris i spillet eller et specifikt item, der kræves for at foretage navn ændringen.

- `coords`: Angiver koordinaterne for stedet, hvor spilleren kan ændre navn.
- `blip`: Definerer blippet på kortet, inklusive blip ID og farve.
- `name`: Navnet på stedet, der vises på kortet og i brugergrænsefladen.
- `use.price`: Angiver om det skal koste penge at ændre navn, og hvor meget.
- `use.item`: Angiver om spilleren skal have et bestemt item for at ændre navn, og hvilket item det er.

Tilpas konfigurationen efter dine præferencer og de specifikke behov for din server.