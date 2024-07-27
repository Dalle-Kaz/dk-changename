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
