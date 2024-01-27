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

function _init()
 print("♥")
 px=64
 py=-16
 pd=1
 level=1
 dead=false
 cars={}
 logs={}
 pads={}
 swirls={}
 prints={}

 music(0)

 init_cumheights()

 add(pads, {x=32,y=-56})

 // spawn spawners
 spawners={}
 add(spawners,{y=-96,s=0.8,r=2.5,t=t(),ty="car"})
 add(spawners,{y=-88,s=-0.7,r=2.5,t=t(),ty="car"})
 add(spawners,{y=-19*8,s=0.5,r=3.5,t=t(),ty="log"})
-- add(spawners,{y=-72,s=0.5,r=3.5,t=t(),ty="log"})

 // prewarm spawners
 for i=1,#spawners do
  prewarm_spawner(spawners[i])
 end

 update_pos()
 oldcampos=get_campos()

 wasbuttons()
end

function _update()
 player_movement()
 update_pos()

 update_spawners()
 update_cars()
 update_logs()
 update_pads()

 -- check if death occurs
 check_death()

 wasbuttons()
end

function _draw()
 cls()
 update_camera()
 render_map()

 palt(0,false)
 palt(15,true)
 draw_swirls()
 draw_cars()
 draw_logs()
 draw_pads()

 //player
 sp=0
 if pd==2 then sp=32
 elseif pd==3 then sp=16
 end
 sp+=(t()*4)%2
 spr(sp,px,py-1,1,1,pd==0)

 if dead==true then
  cls(rnd(16))
 end

 draw_dialogue()


 camera(0,0)
 for i=1,#prints do
  print(prints[i])
 end
 prints={}
end

-->8
-- helper functions --

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
-- all map and camera stuff --

viewheight=16
lvlheights={36,16}
cumheights={}

function init_cumheights()
 cum=0
 for i=1,#lvlheights do
  cum+=lvlheights[i]
  add(cumheights,cum)
 end
end

function update_pos()
 pos=py\8
end

function get_lvl()
 for lvl=1,#lvlheights do
  if -cumheights[lvl]<=pos then
   return lvl
  end
 end
 return 0
end

function get_campos()
 offset=8 -- distance chicken from screen bottom

 -- usual position (middle of level)
 campos=pos-offset

 -- get relative position from lvl bottom
 lvl=get_lvl()
 height=lvlheights[lvl]
 cumheight=cumheights[lvl]
 relpos=-(pos+cumheight-height)

 if relpos < offset then
  -- correct at start of level
  diff=offset-relpos
  campos-=diff
 elseif relpos > height-offset then
  -- correct at end of level
  diff=relpos-(height-offset)
  campos+=diff
 end

 return campos*8
end

function update_camera()
 fac=0.2

 campos=get_campos()
 diff=campos-oldcampos
 smoothpos=oldcampos+fac*diff

 camera(0,smoothpos+0.5)

 oldcampos=smoothpos
end

//mget with camera transform
function mget2(x,y)
 local lvl=get_lvl()
 if lvl!=1 then
  assert() // handle multiple levles
 end
 local height=lvlheights[lvl]

 local tilex=x\8
 local tiley=(y+height*8)\8
 return mget(tilex,tiley)
end

function render_map()
 lvl=get_lvl()
 height=lvlheights[lvl]
 cumheight=cumheights[lvl]

 tilex=16*(lvl-1)
 tiley=0
 sx=0
 sy=-cumheight*8
 tilew=16
 tileh=height

 map(tilex, tiley, sx, sy, tilew, tileh)
end
-->8
-- gameplay code --

function player_movement()
 local dx=0
 local dy=0
 if btnleft() then
  dx-=8
  pd=0
 end

 if btnright() then
  dx+=8
  pd=1
 end

 if btnup() then
  dy-=8
  pd=2
 end

 if btndown() then
  dy+=8
  pd=3
 end

 // player tilemap collsion
 local targx=px+dx
 local targy=py+dy
 local samplex=targx
 local sampley=targy

 if dx!=0 then
  if dx>0 then samplex+=7 end
  c0=fget(mget2(samplex,py),0)
  c1=fget(mget2(samplex,py+7),0)
  if c0 or c1 then
   if dx>0 then
    targx=(samplex-8)\8*8
   else
    targx=(samplex+8)\8*8
   end
  end
 end

 if dy!=0 then
  if dy>0 then sampley+=7 end
  c0=fget(mget2(targx,sampley),0)
  c1=fget(mget2(targx+7,sampley),0)
  if c0 or c1 then
   if dy>0 then
    targy=(sampley-8)\8*8
   else
    targy=(sampley+8)\8*8
   end
  end
 end

 px=targx
 py=targy
end

function check_death()
 -- get player bounding box
 pb={x=px,y=py,w=8,h=8}

 -- car collision
 for c in all(cars) do
  cb={x=c.x,y=c.y,w=8,h=8}
  if aabb_overlap(pb,cb) then
   dead=true
  end
 end

 -- log collision
 for l in all(logs) do
  lb={x=l.x,y=l.y,w=l.w*8,h=8}
  if aabb_overlap(pb,lb) then
   dead=false
  end
 end
end

function update_spawners()
 for sp in all(spawners) do
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
end

function update_cars()
 i=#cars
 while i>0 do
  c=cars[i];
  c.x += c.s

  // delete out of bounds cars
  if (c.s>0 and c.x>136) or
     (c.s<0 and c.x<-8) then
   deli(cars, i)
  end

  i-=1
 end
end

function update_logs()
 i=#logs
 while i>0 do
  local l=logs[i];
  l.x += l.s

  pb={x=px,y=py,w=8,h=8}
  lb={x=l.x+2,y=l.y,w=l.w*8-4,h=8}
  if aabb_overlap(pb,lb) then
   px=(px-l.x+4)\8*8+l.x

   px=max(px,l.x)
   px=min(px,l.x+l.w*8-8)

   if l.pcol != true then
    add(swirls, {x=l.x+2,y=l.y,s=-0.5,t=t()})
    add(swirls, {x=l.x+l.w*8,y=l.y,s=0.5,t=t()})
   end
   l.pcol=true
  else
   l.pcol=false
  end

  // delete out of bounds logs
  if (l.s>0 and l.x>128) or
     (l.s<0 and l.x+l.w*8<0) then
   deli(logs, i)
  end

  i-=1
 end
end

function update_pads()
 for lp in all(pads) do
  pb={x=px,y=py,w=8,h=8}
  lpb={x=lp.x,y=lp.y,w=8,h=8}

  if aabb_overlap(pb,lpb) then
   px=lp.x
   if lp.pcol != true then
    add(swirls, {x=lp.x+1,y=lp.y,s=-0.5,t=t()})
    add(swirls, {x=lp.x+7,y=lp.y,s=0.5,t=t()})
   end
   lp.pcol=true
  else
   lp.pcol=false
  end
 end
end
-->8
-- all dialogue stuff
dialogue={
 {pos=-8,txt={"\"please, be careful,\n my little chicklet!\""}},
 {pos=-15,txt={"\"why would you\n cross the road?\"","\"what could possibly\n be worth such dangers?\""}},
}

function get_dialogue()
 for dial in all(dialogue) do
  if pos==dial.pos then
   return dial.txt
  end
 end
 return {}
end

function draw_dialogue()
 txt=get_dialogue()
 if #txt>0 then
  camera(0,0)
  cls(0)
  local l=8
  local t=32
  local r=128-l-1
  local b=128-t-1

  rect(l,t,r,b,7)
  spr(15,l-2,t-2,1,1,true,false)
  spr(15,r-5,t-2,1,1,false,false)
  spr(15,l-2,b-5,1,1,true,true)
  spr(15,r-5,b-5,1,1,false,true)
  sspr(0,0,8,8,l+8,b-16,16,16)

  lines=split(txt[1],"\n")

  local midh=(l+(r-l)/2)
  local midv=(t+(b-t)/2)
  for i,l in ipairs(lines) do
   local tl=midv+8*(i-#lines/2)-5
   local ll=midh-2*#l+1
   print(l,ll,tl,7)
  end
 end
end
-->8
-- draw graphics

function draw_swirls()
 local i=#swirls
 while i>0 do
  s=swirls[i]
  local t1=t()-s.t
  local col=7
  local speedscale=1
  if t1>0.08 then
   col=6
   speedscale=0.5
  end
  s.x+=s.s*speedscale

  color(col)
  d=-1
  if s.s>0 then d=1 end
  pset(s.x,s.y+0)
  pset(s.x+d*1,s.y+1)
  for i=2,5 do
   pset(s.x+d*2,s.y+i)
  end
  pset(s.x+d*1,s.y+6)
  pset(s.x,s.y+7)


  if t1 > 0.15 then
   deli(swirls,i)
  end

  i-=1
 end
end

function draw_cars()
 for c in all(cars) do
  spr(2,c.x,c.y,1,1,c.s<0)
 end
end

function draw_logs()
 for l in all(logs) do
  for i=1,l.w do
   s=4
   if i>1 and i<l.w then s=3 end
   local sy = l.y
   if l.pcol then sy+=1 end
   spr(s,l.x+(i-1)*8,sy,1,1,i==1)
  end
 end
end

function draw_pads()
 for p in all(pads) do
  local sy=p.y
  if p.pcol then sy+=1 end
  spr(5,p.x,sy)
 end
end

__gfx__
fff77fffffffffffffffffffffffffffffffffffffffffff00666600000000000000000000000000000000000000000000000000000000000000000000777700
fff7799ffff77ffff00ff00f444444444444449ffbbffbbf06000060000000000000000000000000000000000000000000000000000000000000000000070700
fff778fffff7799f888888884444444444444449bbbffbbb60000006000000000000000000000000000000000000000000000000000000000000000077770077
f77777fffff778ff888888774444444444444449bbbbbbbb60000006000000000000000000000000000000000000000000000000000000000000000000070007
777777fff77777ff888888774444444444444449bbbbbbbb60000006000000000000000000000000000000000000000000000000000000000000000000077777
f7777fff777777ff888888884444444444444449bbbbbbbb60000006000000000000000000000000000000000000000000000000000000000000000000000707
fff9fffff7777ffff00ff00f444444444444449ffbbbbbbf06000060000000000000000000000000000000000000000000000000000000000000000000000700
fff99ffffff99fffffffffffffffffffffffffffffbbbbff00666600000000000000000000000000000000000000000000000000000000000000000000000700
fffffffffff77fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fff77ffffff799ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fff799fffff78fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fff78fffff7777ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff7777fff777777f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f777777fff7777ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff7777ffff9ff9ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff9ff9ffff9ff9ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fffffffffff77fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fff77fffff977fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff977ffffff77fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fff77fffff7777ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff7777fff777777f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f777777fff7777ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff7777ffff9ff9ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff9ff9ffff9ff9ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5555555533333333cccccccc00000000000000000000000000000000000000000000000000000000000000003333333666663333333333300000000003333333
5555555533333333cccccccc00000000000000000000000000000000000000000000000000000000000000003333333366663333333333044444444440333333
5555555533b33333cccccccc000000000000000000000000000000000000000000000000000000000000000033b333366663333333b330444444444444033333
5555555533333333cccccccc00000000000000000000000000000000000000000000000000000000000000003333333666663333333304444444444444403333
5555555533333333cccccccc00000000000000000000000000000000000000000000000000000000000000003333333366663333333044444444444444440333
5555555533333333cccccccc00000000000000000000000000000000000000000000000000000000000000003333333666633333330444444444444444444033
55555555333333b3cccccccc0000000000000000000000000000000000000000000000000000000000000000333333b6666633b3304444444444444444444403
55555555b3333333cccccccc0000000000000000000000000000000000000000000000000000000000000000b333333366633333000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444444444444444444033
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444444444444444444033
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444444444444444444033
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444444444444444444033
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444440000000000044033
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444440aaaa0aaaa044033
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444400aaaa0aaaa044033
77557755000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b30444040aaaa0aaaa044033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444444440aaaa0aaaa044033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444444440000000000044033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444444440aaaa0aaaa044033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444444440aaaa0aaaa044033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444444440aaaa0aaaa044033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444444440aaaa0aaaa044033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044440000000000044033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444404444444444444444033
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444044444044400000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003304440444a4044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b30444044444044400000000
141414141414141414141414d5d6e5f5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
141414141414141414141414d7e7e6f6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
141414141414141414141414b4c41414000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14141414141414141414141414141414000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101000000000000000000000000000101010000000000000000000000000001010100000000000000000000000000010100
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5050505050505050505050505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414d4e4e4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011000000d05500005140550c005110550c005100550b0050f055000051405500005080550000514055000050d055000051405500005110550100510055130050f05507005140551300508055000051405500005
01100000190550000019055000001d055000001c055000001b05500000180550000014055000001805500000190550000019055000001d055000001c055000001b055000001805500000140550c0001805500000
01100000007000070025750227502275524750227502075518750197501a7551b7501b755207551475114755007000070025750227502275524750227502075518750197501a7551b7501b755207551475114755
011000000d0550a005140550000508055000050a055000050c05500005140550000508055000050505500005070550000516055000050c0550000516055000051105500005140550000511055000051405500000
011000001905500005190550000514055000051605500005180550000518055180051405500005110550000513055000051805500005000050000518055000050000500005180550000500005000051805500000
011000000070000700257502275022755247502275020755187501d750207502275024750297502c7502e755307512e7552b7552875524750227501f7501c7551d7551e7551f75520751207551b7501475000000
011000000d055000051405500005080550000517055000050605500005160550000507055000051305500005080550000514055000050a0550000508055000050d05500005000050000500005000050805500005
01100000190551800519055000051405500005190550000512055000051905500005130550000514055000051405520750190551f7501f750190551d7511d7501975119750197501975500005000050000000000
01100000007002470025752227502275024755227551d755207511d7551e7552775127750257552275022755207551d755207511d7501b7501b75519750197551955524000195552470019555000000000000000
01100000007002470025752227502275024755227551d755207511d7551e7552775127750257552275022755207551d755207511d7501d7501d7551b7501b7551975019755195522400018552247001755200000
011000000c055000051405500005080550000514055000050c0550000514055000050805500005060550000505055000051405500005080550000514055000050d05500005140550000511055000051005500005
011000001d75500000180551b75514055000001e755000001d755000001e0551b75514055000001d755000001b755000001905519750197551d75516750167551d7501d7550d0550000000000000000000000000
011000002975520750247552775127755247552a7502a7552975520750247552775127755247552a75524755277551d7502075525751257552075522751227552075020750207502075020755227512275525755
011000000c055000001405500000080550000014055000000f0550000014055000000805500000060550000005055000001405500000080550000014055000000d05500000000000000000000000000a05500000
00100000187550000018055187501875500000167550000018755000001e055000001405500000120550000019755000001905518751187551975016750167551475014755145501455513550135551255012555
01100000247501b7501e75524750247551e75522751227552075020750207502075020755227502275524755257501d7502075524751247551d7502275022755207502075520550205551f5501f5551e5501e555
001000000605500000120550000007055000001305500000080550000014055000000a05500000160550000003055000000f05500000080550000014055000000105500000000000000000000000000805500000
001000001675500700160551b75013055197051b0551a00519055147551d055167551675500000147501475500000147551405500000000000000012750127551175111755000000000000000000000000000000
0110000022755197501e7552775127755257552275022755207551d750207552275122755207551d7501d7551d7551b7501d75520751207551d7551b7501b755197501975520550205551f5501f5551e5501e555
001000001205500000160550000013055000001a0550000014055000001d0550000016055000001d0550000000000000001405519750197551675512754127551175011755140551100011055140001405500000
001000002c7552a7502c75529750297552c7512a7552975027755267502775524750247552775126755247502275521750227551d7501d7551e75520751227552575525705147501475519750197550000000000
0101000027710297212a7612b7612a771287612674128721267002570124701247012470126701277012170122701237012470125701257010070100701007010070100701007010070100701007010070100701
010100002b7102a731297612877128761297612a7512a721000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01010000297102e7212f7412e7612c7612a7512973129721000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01010000277102674126761277712877127751287412a721000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100002773025750277602a7702a7702a7602a760267502a7502a74029730297302972023700247002470023700000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 00010244
00 03040544
00 00010244
00 06070844
00 00010244
00 03040544
00 00010244
00 06070944
00 0a0b0c44
00 0d0e0f44
00 0a0b0c44
00 10111244
00 0a0b0c44
00 0d0e0f44
00 0a0b0c44
02 10131444
01 40414244
00 41424344
00 41424344
00 41424344
00 4a4b4c44
00 4d4e4f44
00 50515244
00 50535444

