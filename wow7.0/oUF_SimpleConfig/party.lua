
-- oUF_SimpleConfig: party
-- zork, 2016

-----------------------------
-- Variables
-----------------------------

local A, L = ...

-----------------------------
-- Party Config
-----------------------------

L.C.party = {
  enabled = true,
  size = {180*L.C.uiscale,26*L.C.uiscale},
  point = {"TOPLEFT",20,-20},
  scale = 1,
  --healthbar
  healthbar = {
    --health and absorb bar cannot be disabled, they match the size of the frame
    colorDisconnected = true,
    colorClass = true,
    colorReaction = true,
    colorHealth = true,
    colorThreat = true,
    name = {
      enabled = true,
      points = {
        {"TOPLEFT",2*L.C.uiscale,10*L.C.uiscale},
        {"TOPRIGHT",-2*L.C.uiscale,10*L.C.uiscale},
      },
      size = 17*L.C.uiscale,
      tag = "[name]",
    },
    health = {
      enabled = true,
      point = {"RIGHT",-2*L.C.uiscale,0*L.C.uiscale},
      size = 16*L.C.uiscale,
      tag = "[oUF_Simple:health]",
    },
  },
  --powerbar
  powerbar = {
    enabled = true,
    size = {180*L.C.uiscale,5*L.C.uiscale},
    point = {"TOP","BOTTOM",0*L.C.uiscale,-4*L.C.uiscale}, --if no relativeTo is given the frame base will be the relativeTo reference
    colorPower = true,
  },
  debuffCfg = {
    point = {"LEFT",10+150,0}, --this may seem wierd but party frames are generated on the fly, no other way
    num = 5,
    cols = 5,
    size = 22,
    spacing = 5,
    initialAnchor = "TOPLEFT",
    growthX = "RIGHT",
    growthY = "DOWN",
    disableCooldown = true,
  },
  setup = {
    template = nil,
    visibility = "custom [group:party,nogroup:raid] show; hide",
    showPlayer = true,
    showSolo = false,
    showParty = true,
    showRaid = false,
    point = "BOTTOM",
    xOffset = 0*L.C.uiscale,
    yOffset = 14*L.C.uiscale,
  },
}