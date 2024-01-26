pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
 print("♥")
 px=64
 py=64

 wasbuttons()
end

function _update()
 if btnleft() then
  px-=8
 end

 if btnright() then
  px+=8
 end

 if btnup() then
  py-=8
 end

 if btndown() then
  py+=8
 end

 wasbuttons()
end

function _draw()
 cls()
 spr(1,px,py)
end
-->8
function btnleft()
 return btn(⬅️) and not wasleft
end

function btnright()
 return btn(➡️) and not wasright
end

function btnup()
 return btn(⬆️) and not wasup
end

function btndown()
 return btn(⬇️) and not wasdown
end

function wasbuttons()
 wasleft=btn(⬅️)
 wasright=btn(➡️)
 wasup=btn(⬆️)
 wasdown=btn(⬇️)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700033333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000033333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000033333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700033333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000033000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
