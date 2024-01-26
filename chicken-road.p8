pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function prewarm_spawner(sp)
 step=abs(sp.s)*30*sp.r
 it=128/step
 for i=0,it do
   ax=i*step
   if sp.s<0 then ax=(136-ax) end
   if sp.ty=="car" then
    add(cars,{x=ax,y=sp.y,s=sp.s})
   elseif sp.ty=="log" then
    w=flr(rnd(2))+2
    if sp.s>0 then ax-=w*8 end
    add(logs,{x=ax,y=sp.y,s=sp.s,w=w})
   end
 end
end
prints={}

function _init()
 print("♥")
 px=64
 py=-16
 level=1
 dead=false
 cars={}
 logs={}

 // spawn spawners
 spawners={}
 add(spawners,{y=96,s=0.8,r=1.5,t=t(),ty="car"})
 add(spawners,{y=80,s=-0.7,r=1.5,t=t(),ty="car"})
 add(spawners,{y=64,s=-0.5,r=3.5,t=t(),ty="log"})
 add(spawners,{y=56,s=0.5,r=3.5,t=t(),ty="log"})

 // prewarm spawners
 for i=1,#spawners do
  prewarm_spawner(spawners[i])
 end

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
 
	pos=py\8

 for i=1,#spawners do
  sp=spawners[i]
  if t()-sp.t >= sp.r then
   // spawn obj
   x=-8
   if sp.s<0 then x=136 end
   if sp.ty=="car" then
    add(cars,{x=x, y=sp.y, s=sp.s})
   elseif sp.ty=="log" then
    w=flr(rnd(2))+2
    if sp.s>0 then x-=w*8 end
    add(logs,{x=x, y=sp.y, s=sp.s,w=w})
   end
   sp.t+=sp.r //reset spawn timer
  end
 end

 i=#cars
 while i>0 do
  c=cars[i];
  c.x += c.s

  // player collision
  pb={x=px,y=py,w=8,h=8}
  cb={x=c.x,y=c.y,w=8,h=8}
  if aabb_overlap(pb,cb) then
   dead=true
  end

  // delete out of bounds cars
  if (c.s>0 and c.x>136) or
     (c.s<0 and c.x<-8) then
   deli(cars, i)
  end

  i-=1
 end

 i=#logs
 while i>0 do
  l=logs[i];
  l.x += l.s

  pb={x=px,y=py,w=8,h=8}
  lb={x=l.x+2,y=l.y,w=l.w*8-4,h=8}
  if aabb_overlap(pb,lb) then
   px=(px-l.x+4)\8*8+l.x

   px=max(px,l.x)
   px=min(px,l.x+l.w*8-8)
  end

  // delete out of bounds logs
  if (l.s>0 and l.x>128) or
     (l.s<0 and l.x+l.w*8<0) then
   deli(logs, i)
  end

  i-=1
 end

 wasbuttons()
end

function _draw()
 cls()
 update_camera()
 render_map()
 spr(1,px,py)

 palt(0,false)
 palt(15,true)
 for i=1,#cars do
  c=cars[i]
  spr(2,c.x,c.y,1,1,c.s<0)
 end
 for i=1,#logs do
  l=logs[i]
  for i=1,l.w do
   s=4
   if i>1 and i<l.w then s=3 end
   spr(s,l.x+(i-1)*8,l.y,1,1,i==1)
  end
 end
 palt(0,true)
 palt(15,false)

 spr(1,px,py)

 if dead==true then
  cls(rnd(16))
 end
 
 if #prints>0 then
  camera(0,0)
  for i=1,#prints do
   print(prints[i])
  end
 end
end

-->8
-- test overlap between bounding
-- boxes
function aabb_overlap(b0, b1)
 if b0.x<b1.x+b1.w and
    b0.x+b0.w>b1.x and
    b0.y<b1.y+b1.h and
    b0.y+b0.h>b1.y then
  return true
 else
  return false
 end
end
-- translate aabb
function trans_aabb(b, x, y)
  return{
   x=b.x+x,
   y=b.y+y,
   w=b.w,
   h=b.h
  }
end

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

-->8
viewheight=16 --sprites
lvlheights={24,16} -- sprites
cumheights={24,40} -- sprites

function get_lvl()
 for lvl=1,#lvlheights do
  if cumheights[lvl]>=pos then
   return lvl
  end
 end
 return 0
end

function get_campos()
 lvl=get_lvl()
 height=lvlheights[lvl]
 cumheight=cumheights[lvl]
 relpos=pos-cumheight+height

	prints[1]=relpos
 if relpos > -8 then
  prints[3]=1
  campos=-viewheight
 elseif relpos > 8-height then
  prints[3]=2
  campos=pos-8
 else
  prints[3]=3
  campos=-height
 end
 prints[2]=campos
 return campos
end

function update_camera()
 campos=get_campos()
 camera(0,campos*8)
end

function render_map()
 map(0,0)
end
__gfx__
0000000000000000eeeeeeee44444444444444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000003333330e00ee00e44444444444444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700033333308888888844444444444444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000033333308888887744444444444444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000033333308888887744444444444444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700033333308888888844444444444444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000003333330e00ee00e44444444444444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000003300eeeeeeee44444444444444490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77757775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77757775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0040404040404040404040404040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011000000d05500005140550c005110550c005100550b0050f055000051405500005080550000514055000050d055000051405500005110550100510055130050f05507005140551300508055000051405500005
01100000190550000019055000001d055000001c055000001b05500000180550000014055000001805500000190550000019055000001d055000001c055000001b055000001805500000140550c0001805500000
01100000007000070025750227502275524750227502075518750197501a7551b7501b755207551475114755007000070025750227502275524750227502075518750197501a7551b7501b755207551475114755
011000000d0550a005140550000508055000050a055000050c05500005140550000508055000050505500005070550000516055000050c0550000516055000051105500005140550000511055000051405500000
011000001905500005190550000514055000051605500005180550000518055180051405500005110550000513055000051805500005000050000518055000050000500005180550000500005000051805500000
011000000070000700257502275022755247502275020755187551d755207552275524755297552c7552e755307552e7552b7552875524755227551f7551c7551d7551e7551f75520750207551b7501475500000
__music__
01 00010244
01 03040544
01 00010244

