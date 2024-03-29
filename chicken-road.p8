pico-8 cartridge // http://www.pico-8.com
version 41
__lua__

function car_spawner(l,s,r)
 add(spawners,{y=l*-8,s=s,r=r,t=t(),ty="car"})
end
function log_spawner(l,s,r,minw,maxw)
 minw=minw or 2
 maxw=maxw or 3
 add(spawners,{y=l*-8,s=s,r=r,minw=minw,maxw=maxw,t=t(),ty="log"})
end
function llog_spawner(l,s,r,minw,maxw)
 minw=minw or 2
 maxw=maxw or 3
 add(spawners,{y=l*-8,s=s,r=r,minw=minw,maxw=maxw,t=t(),ty="llog"})
end
function clog_spawner(l,s,r,minw,maxw)
 minw=minw or 2
 maxw=maxw or 3
 add(spawners,{y=l*-8,s=s,r=r,minw=minw,maxw=maxw,t=t(),ty="clog"})
end
function peng_spawner(l,s,r)
 add(spawners,{y=l*-8,s=s,r=r,t=t(),ty="peng"})
end
function snow_spawner(l0,l1,s,r,b)
 if b==nil then b=true end
 add(spawners,{y=l0*-8,y1=l1*-8,s=s,r=r,bothd=b,t=t(),ty="snow"})
end
function fire_spawner(l0,l1,s,r,b)
 if b==nil then b=true end
 add(spawners,{y=l0*-8,y1=l1*-8,s=s,r=r,bothd=b,t=t(),ty="fire"})
end
function star_spawner(l0,l1,s,r,b)
 if b==nil then b=true end
 add(spawners,{y=l0*-8,y1=l1*-8,s=s,r=r,bothd=b,t=t(),ty="star"})
end

function init_lvl1()
 local base=0
 spawn_pads(base+8,0b0000011111000000)

 car_spawner(base+12,-0.7,2.5)
 car_spawner(base+13,0.8,2.5)

 log_spawner(base+20,0.5,3.5)

 log_spawner(base+25,-0.7,3.5)
 spawn_pads(base+26,0b0011110000011000)

 log_spawner(base+34,-1.0,2.5)
 spawn_pads(base+35,0b0011001110001100)
 log_spawner(base+36,1.2,3)

 car_spawner(base+38,1.5,1.1)

 car_spawner(base+44,0.8,3)
 car_spawner(base+45,-0.7,3)
 log_spawner(base+46,0.8,3)

 car_spawner(base+52,0.8,1.6)
 car_spawner(base+53,1.0,1.8)

 log_spawner(base+55,0.6,3.1)
 spawn_pads(base+56,0b0111001111001110)
 log_spawner(base+57,-0.7,2.9)
 log_spawner(base+58,0.7,3)
end

function init_lvl2()
 local base=cumheights[1]
 car_spawner(base+5,0.8,2)
 car_spawner(base+6,1.2,2.5)
 car_spawner(base+7,1.5,3)

 log_spawner(base+19,-0.8,2.5)
 log_spawner(base+20,1,2)

 car_spawner(base+26,-1.2,2)
 car_spawner(base+27,-1.5,2.5)

 car_spawner(base+34,0.8,2.0)
 car_spawner(base+35,1.0,2.2)
 car_spawner(base+36,-1.0,2.0)
 car_spawner(base+37,-1.2,2.2)

 car_spawner(base+40,1.0,1.8)
 car_spawner(base+41,1.5,1.6)
 car_spawner(base+42,-1.5,2.0)
 car_spawner(base+43,-1.8,2.2)
 car_spawner(base+44,1.6,2.4)
 car_spawner(base+45,2.0,2.5)

 car_spawner(base+48,1.0,1.5)
 car_spawner(base+49,-1.0,1.4)
 log_spawner(base+50,0.8,2.0)
 log_spawner(base+51,-0.8,2.5)
 car_spawner(base+52,4.0,4.0)
 car_spawner(base+53,-4.0,3.0)
end

function init_lvl3()
 local base=cumheights[2]

 snow_spawner(base+10,base+12,2,2.5,false)

 peng_spawner(base+15,-1.5,1.6)

 peng_spawner(base+22,2.0,1.3)

 snow_spawner(base+25,base+28,-2.2,1.6)

 peng_spawner(base+32,1.7,1.5)
 peng_spawner(base+33,-2.0,1.3)
 snow_spawner(base+35,base+40,-2.5,1.0)
 peng_spawner(base+38,2.7,2.0)

 snow_spawner(base+45,base+47,-1.5,1.6)
 peng_spawner(base+48,1.4,2.0)
 peng_spawner(base+49,-1.6,1.7)

 snow_spawner(base+52,base+59,-1.5,1.5)
 peng_spawner(base+53,-1.2,2.2)
 peng_spawner(base+55,1.4,1.9)
 peng_spawner(base+56,-1.7,1.7)

-- snow_spawner(base+5,base+10,3.0,0.5)
end

function init_lvl4()
 local base=cumheights[3]

 llog_spawner(base+7,0.7,5)

 llog_spawner(base+9,-0.6,4.2)

 fire_spawner(base+10,base+14,-1.2,1.3)

 llog_spawner(base+15,1.7,3)

 llog_spawner(base+18,0.7,2)
 llog_spawner(base+19,-1.6,2)

 fire_spawner(base+23,base+27,-1.2,1.3)

 llog_spawner(base+28,1.4,2)
 llog_spawner(base+29,-0.5,4)
 llog_spawner(base+30,1.6,1.7)

 fire_spawner(base+31,base+33,-1.2,1.5)

 llog_spawner(base+35,-1.7,3)

 fire_spawner(base+38,base+42,-1.0,2.2)
 llog_spawner(base+39,-1.5,3)
 llog_spawner(base+40,0.6,3.2)
 llog_spawner(base+41,-1.0,2)
 llog_spawner(base+42,1.4,2.4)

 llog_spawner(base+49,-1.4,1.4)
 llog_spawner(base+50,1.1,2.2)
 llog_spawner(base+51,-1.5,1.8)
 llog_spawner(base+52,-0.6,2)
 fire_spawner(base+49,base+58,-1.0,2.5)
 llog_spawner(base+54,1.3,2.4)
 llog_spawner(base+55,0.8,1.8)
 llog_spawner(base+56,-1.8,1.5)
 llog_spawner(base+57,0.8,2.6)
 llog_spawner(base+58,-1.6,1.2)
end

function init_lvl5()
 local base=cumheights[4]

 clog_spawner(base+4,0.5,3.0,5,5)
 clog_spawner(base+5,0.7,2.8,5,5)
 clog_spawner(base+6,-0.5,3.0,5,5)
 clog_spawner(base+7,-0.7,2.8,5,5)
 clog_spawner(base+8,0.5,3.3,2,6)

 star_spawner(base+9,base+13,2.8,1.4)
 clog_spawner(base+10,-0.8,3.2,5,6)
 clog_spawner(base+11,1.0,2.5,2,5)
 clog_spawner(base+12,0.7,3.0,2,6)
 clog_spawner(base+13,-0.4,2.8,3,4)

 star_spawner(base+14,base+19,2.8,1.5)
 clog_spawner(base+15,0.5,3.0,2,5)
 clog_spawner(base+16,0.8,3.0,3,5)
 clog_spawner(base+17,0.7,3.0,4,6)
 clog_spawner(base+18,0.6,3.0,5,6)
 clog_spawner(base+19,1.0,3.0,4,7)

 star_spawner(base+20,base+24,2.8,2.0)
 clog_spawner(base+21,-1.3,2.3,4,7)
 clog_spawner(base+22,-1.0,2.3,4,7)
 clog_spawner(base+23,-1.4,2.3,4,7)
 clog_spawner(base+24,-1.2,2.3,4,7)

 star_spawner(base+25,base+35,2.8,0.5)
 clog_spawner(base+26,0.5,3.0,3,5)
 clog_spawner(base+27,0.7,2.6,3,5)
 clog_spawner(base+28,0.6,2.8,3,5)
 clog_spawner(base+29,0.8,2.6,3,5)
 clog_spawner(base+30,0.6,2.8,3,5)
 clog_spawner(base+31,0.7,2.6,3,5)
 clog_spawner(base+32,0.5,3.0,3,5)
 clog_spawner(base+33,0.8,2.6,3,5)
 clog_spawner(base+34,0.7,2.7,3,5)
 clog_spawner(base+35,0.6,2.8,3,5)


 // house
 spawn_pads(base+54,0b0000011111000000)
end

function _init()
 print("♥")
 px=64
 py=-16
 vx=0
 vy=0
 pd=1
 level=1
 dead=false
 deaths=0
 death_dialogues=0
 died_how=""
 died_t=0
 dialoguemode=false
 opening_done=false
 cars={}
 logs={}
 pads={}
 swirls={}
 prints={}
 bubbles={}
 bubble_time=0
 bottom_level_bound=-8

 music(0)

 init_cumheights()
 init_voice()

 // spawn ahead
-- py=cumheights[2]*-8-16

 // spawn spawners
 spawners={}
 init_lvl1()
 init_lvl2()
 init_lvl3()
 init_lvl4()
 init_lvl5()

 // prewarm spawners
 for s in all(spawners) do
  prewarm_spawner(s)
 end

 update_pos()
 oldcampos=get_campos()

 wasbuttons()
end

function _update()
 if allowinput() then
  player_movement()
 end

 if dialoguemode then
  next_dialogue()
 end

 update_spawners()
 update_cars()
 update_logs()
 update_pads()
 update_bubbles()

 // clamp in screen bounds
 px=max(0,px)
 px=min(120,px)
 py=min(bottom_level_bound,py)
 py=max(cumheights[6]*-8,py)

 update_pos()

 -- check if death occurs
 if not dead then
  check_death()
 end

 if dead then
  -- spawn bubbles if drowned
  if died_how=="drowned" or
     died_how=="lava" or
     died_how=="fall" then
   if t()-bubble_time > 0.3 then
    bubble_time=t()
    add(bubbles,{x=rnd(8),y=7-rnd(6),t=t(),lava=died_how=="lava"})
   end
  end

  if t()-died_t>1.5 then
   lvl=get_lvl()
   bubbles={}
   px=64
   if lvl==1 then
    py=-16
   else
    py=-16-8*cumheights[lvl-1]
   end

   dead=false
   deaths+=1
   died_t=0
  end
 end

 // update bottom bound
 local lvl=get_lvl()
 if lvl>1 then
  bottom_level_bound=-cumheights[lvl-1]*8-8
 end

 wasbuttons()
end

function _draw()
 cls()
 update_camera()

 local lvl=get_lvl()
 render_map(lvl)
 if lvl>1 then
  render_map(lvl-1)
 end

 palt(0,false)
 palt(15,true)
 draw_spawners()
 draw_swirls()

 draw_logs()
 draw_pads()

 if dead then
  if died_how=="splat" or died_how=="penguin" then
   spr(48,px,py-1)
  elseif died_how=="drowned" then
   draw_bubbles()
  elseif died_how=="lava" then
   draw_bubbles()
  elseif died_how=="fall" then
   draw_bubbles()
  elseif died_how=="ice" or died_how=="fireball" or died_how=="star" then
   spr(48,px,py-1)
  else
   assert() // unkonwn reason
  end
 end

 //player
 if not dead then
  sp=0
  if pd==2 then sp=32
  elseif pd==3 then sp=16
  end
  sp+=(t()*4)%2
  spr(sp,px,py-1,1,1,pd==0)
 end

 draw_mama()
 draw_cars()
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

function btno()
 return btn(🅾️) and not waso
end

function btnx()
 return btn(❎) and not wasx
end

function wasbuttons()
 wasleft=btn(⬅️)
 wasright=btn(➡️)
 wasup=btn(⬆️)
 wasdown=btn(⬇️)
 waso=btn(🅾️)
 wasx=btn(x)
end

-->8
-- all map and camera stuff --

viewheight=16
lvlheights={64,64,64,64,64,24,1}
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
 local height=cumheights[lvl]
 local tilex=((lvl-1)*16)+x\8
 local tiley=(y+height*8)\8
 return mget(tilex,tiley)
end

function render_map(lvl)
 local height=lvlheights[lvl]
 local cumheight=cumheights[lvl]

 local tilex=16*(lvl-1)
 local tiley=0
 local sx=0
 local sy=-cumheight*8
 local tilew=16
 local tileh=height

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

 snd=31

 // player tilemap collsion
 local targx=px+dx
 local targy=py+dy
 local samplex=targx
 local sampley=targy

 local oldmaxv=max(
  abs(vx),abs(vy))

 local wasonice=false
 if mget2(px+4,py+4)==84 then
  wasonice=true
  dx/=4
  dy/=4
  targx=px+dx
  targy=py+dy
 end

 // ice
 local onice=false
 if mget2(targx+4,targy+4) == 84 then
  onice=true
  if dx!=0 then
   if not wasonice then dx/=2 end
   vx=sgn(dx)
  end
  if dy!=0 then
   if not wasonice then dy/=2 end
   vy=sgn(dy)
  end
 else
  vx=0
  vy=0
 end

 if dx!=0 or dy!=0 then
  local maxv=max(abs(vx),abs(vy))
  if maxv>0.1 and oldmaxv < 0.2 then
   snd=37
  end
  sfx(snd)
 end

 dx += vx
 dy += vy
 vx-=0.1*vx
 vy-=0.1*vy
 targx=px+dx
 targy=py+dy

 if abs(vx)<0.1 then vx=0 end
 if abs(vy)<0.1 then vy=0 end

 if dx!=0 then
  if dx>0 then samplex+=7 end
  c0=fget(mget2(samplex,py),0)
  c1=fget(mget2(samplex,py+7),0)
  if c0 or c1 then
   vx=0
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
   vy=0
   if dy>0 then
    targy=(sampley-8)\8*8
   else
    targy=(sampley+8)\8*8
   end
  end
 end

 local sptl=mget2(targx+1,targy+1)
 local sptr=mget2(targx+7,targy+1)
 local spbl=mget2(targx+1,targy+7)
 local spbr=mget2(targx+7,targy+7)

 -- snap player to grid
 if (sptl==sptr) and (sptl==spbl)
   and (sptl==spbr) then
  if fget(sptl,2) then
   targx=(targx+4)\8*8
   targy=(targy+4)\8*8
  end
 end

 px=targx
 py=targy
end

function kill_player(reason)
 if reason=="splat" or reason=="ice" or reason=="penguin"
   or reason=="fireball" or reason=="star" then
  sfx(35,3)
 elseif reason=="drowned" or reason=="fall" then
  sfx(32,3)
 elseif reason == "lava" then
  sfx(36,3)
 end

 dead=true
 died_t=t()
 died_how=reason
end

function check_death()
 -- car collision
 for c in all(cars) do
  pb={x=px+2,y=py,w=4,h=8}
  cb={x=c.x,y=c.y+4,w=8,h=3}
  if aabb_overlap(pb,cb) then
   sprite=c.sp
   if sprite==20 then
    reason="ice"
   elseif sprite==21 then
    reason="penguin"
   elseif sprite==35 then
    reason="star"
   elseif sprite==36 then
    reason="fireball"
   else
    reason="splat"
   end
   kill_player(reason)
  end
 end

 local cur_tile=mget2(px+4,py+7)
 local on_deadly=fget(cur_tile,1)

 -- test if on log
 for l in all(logs) do
  pb={x=px,y=py,w=8,h=8}
  lb={x=l.x,y=l.y,w=l.w*8,h=8}
  if aabb_overlap(pb,lb) then
   on_deadly=false
  end
 end

 -- test if on lily pad
 for l in all(pads) do
  pb={x=px,y=py,w=8,h=8}
  lpb={x=l.x,y=l.y,w=8,h=8}
  if aabb_overlap(pb,lpb) then
   on_deadly=false
  end
 end

 if on_deadly then
  local reason=""
  if cur_tile==37 or cur_tile==66 or cur_tile==100 then
   reason="drowned"
  elseif cur_tile==70 then
   reason="fall"
  elseif cur_tile==83 or cur_tile==99 then
   reason="lava"
  else
   assert() //unknown reason
  end
  kill_player(reason)
 end
end

function spawn_pads(y,mask)
 y*=-8
 for i=0,15 do
  if band(lshr(mask,15-i),1)==1 then
   add(pads, {x=i*8,y=y})
  end
 end
end

function spawn_swirls(x0,x1,y)
 add(swirls, {x=x0,y=y,s=-0.5,t=t()})
 add(swirls, {x=x1,y=y,s=0.5,t=t()})
end

function spawn_car(sp,x)
 sprite=flr(rnd(3))
 sprite=16*sprite+2
 add(cars,{x=x, y=sp.y, s=sp.s,sp=sprite})
end

function spawn_peng(sp,x)
 local sprite=21
 local cnt=flr(rnd(3))
 local a=-sgn(sp.s)*8
 for i=0,cnt do
  add(cars,{x=x+a*i,y=sp.y,s=sp.s,sp=sprite})
 end
end

function spawn_ball(sp,x,sprite)
 local lns=abs(sp.y-sp.y1)\8

 local y=flr(rnd(lns))*8
 local lim=0
 while y==sp.lasty and lim<8 do
  y=flr(rnd(lns))*8
  lim+=1
 end
 sp.lasty=y

 y+=min(sp.y,sp.y1)

 local spd=sp.s
 if sp.bothd and flr(rnd(2))==0 then
  spd=-spd
 end

 if spd>=0 then
  x=-8
 else
  x=136
 end
 add(cars,{x=x,y=y,s=spd,sp=sprite})
end
function spawn_snow(sp,x)
 spawn_ball(sp,x,20)
end
function spawn_fire(sp,x)
 spawn_ball(sp,x,36)
end
function spawn_star(sp,x)
 spawn_ball(sp,x,35)
end

function spawn_gen_log(sp,x,ty)
 local w=sp.minw
 w += flr(rnd(sp.maxw-sp.minw+1))
 if sp.s>0 then x-=w*8 end
 add(logs,{x=x,y=sp.y,s=sp.s,w=w,ty=ty})
end
function spawn_log(sp,x)
 spawn_gen_log(sp,x,"log")
end
function spawn_llog(sp,x)
 spawn_gen_log(sp,x,"llog")
end
function spawn_clog(sp,x)
 spawn_gen_log(sp,x,"clog")
end

function prewarm_spawner(sp)
 step=abs(sp.s)*30*sp.r
 it=128/step
 for i=0,it do
   local ax=i*step
   if sp.s<0 then ax=(136-ax) end
   if sp.ty=="car" then
    spawn_car(sp, ax)
   elseif sp.ty=="peng" then
    spawn_peng(sp,ax)
   elseif sp.ty=="log" then
    spawn_log(sp,ax)
   elseif sp.ty=="llog" then
    spawn_llog(sp,ax)
   elseif sp.ty=="clog" then
    spawn_clog(sp,ax)
   end
 end
end

function update_spawners()
 for sp in all(spawners) do
  if t()-sp.t >= sp.r then
   // spawn obj
   local x=-8
   if sp.s<0 then x=136 end
   if sp.ty=="car" then
    spawn_car(sp, x)
   elseif sp.ty=="peng" then
    spawn_peng(sp,x)
   elseif sp.ty=="snow" then
    spawn_snow(sp)
   elseif sp.ty=="fire" then
    spawn_fire(sp)
   elseif sp.ty=="star" then
    spawn_star(sp)
   elseif sp.ty=="log" then
    spawn_log(sp,x)
   elseif sp.ty=="llog" then
    spawn_llog(sp,x)
   elseif sp.ty=="clog" then
    spawn_clog(sp,x)
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
  if not dead and
     aabb_overlap(pb,lb) then
   px=(px-l.x+4)\8*8+l.x

   px=max(px,l.x)
   px=min(px,l.x+l.w*8-8)

   if l.pcol != true then
    spawn_swirls(l.x+2,l.x+l.w*8,l.y)
    sfx(33,3)
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
    spawn_swirls(lp.x+1,lp.x+7,lp.y)
    sfx(34,3)
   end
   lp.pcol=true
  else
   lp.pcol=false
  end
 end
end

function update_bubbles()
 local i=#bubbles
 while i>0 do
  b=bubbles[i]
  b.y-=0.2
  if t()-b.t > 0.5 then
   deli(bubbles,i)
  end
  i-=1
 end
end

function allowinput()
 if dead then
  return false
 elseif dialoguemode then
  return false
 elseif t()<2 then
  return false
 else
  return true
 end
end
-->8
-- all dialogue stuff
dialogue={
 {pos=-10,txt={
  "\"please, be careful,\n my little chicklet!\""
  }},
 {pos=-15,txt={
  "\"why would you\n cross the road?\"",
  "\"what could possibly\n be worth such dangers?\""
  }},
 {pos=-62,txt={
  "\"pfew, you managed\nto get across...\"",
  "\"finally, the end\nof my worries\"",
 }},
 -- 64: city starts
 {pos=-66,txt={
  "\"gosh darn it.\"",
  "\"i didn't expect there to \nbe worlds beyond our own\"",
 }},
 {pos=-80,txt={
  "\"a concrete jungle where\ndreams are made of...\"",
  "\"that does not make\ngrammatical sense to me\"",
 }},
 {pos=-96,txt={
  "\"fine, i give up...\"",
  "\"go ahead and cross\nthat road too\"",
  "\"seems like a\nsafe thing to do\""
 }},
 {pos=-103,txt={
  "\"no!\"",
  "\"that was\nreverse psychology!\"",
  "\"you weren't supposed\nto listen!\"",
 }},
 -- 128: ice starts
 {pos=-130,txt={
  "\"what is this?\"",
  "\"how did you end up in\nthis frigid wilderness?\""
 }},
 {pos=-147,txt={
  "\"at least make sure\nto wear a scarf\"",
  "\"otherwise, you'll\ncatch a cold\"",
 }},
 {pos=-172,txt={
  "\"don't make eye contact!\"",
  "\"those penguins have\na real mean look\"",
  "\"given the chance, they\nwill waddle all over you\""
 }},
 -- 192: lava starts
 {pos=-194,txt={
  "\"i know i warned you\nnot to catch a cold...\"",
  "\"but descending to the\nninth circle of hell...\"",
  "\"is also not what\ni had in mind\"",
 }},
 {pos=-214,txt={
  "\"how are you even able to\nstand on those rocks?\"",
  "\"i did not know chickens\nhave heat-resistant feet\"",
 }},
 {pos=-236,txt={
  "\"this is getting\nridiculous!\"",
  "\"my little chicklet\nhaving to dodge\nliteral balls of fire\"",
 }},
 -- 256: sky starts
 {pos=-258,txt={
  "\"please be careful,\nmy little chicklet!",
  "\"and don't look down!\""
 }},
 {pos=-281,txt={"\"i never knew\nthat `shooting stars'\nwas meant literally\""}},
 -- 294: back home
 {pos=-303,txt={
  "\"oh, my little chicklet\"",
  "\"how happy i am\nto see you again!\"",
  "\"finally, back home safe\nand sound\"",
  "\"i now only have one\nquestion for you...\"",
  "\"why did my little\nchicklet cross the road?\"",
  "♥",
  "\"what do you mean yes?\"",
  "♥",
  "\"can you say something\nother than yes?\"",
  "♥",
  "\"well let's hear it then!\"",
  "♥",
  "\"so you can\nonly say yes...\"",
  "♥",
  "\"promise me you will stay\nin the garden this time?\"",
  "♥"
 }},
 {pos=-310,txt={
  "\"but...\nyou promised...\"",
 }},
 {pos=-316,txt={
  "\"stop!\"",
  "\"the developers did not\neven finish that part\nof the map!\""
 }},
 {pos=-324,txt={
  "\"you weren't meant\nto go here\"",
  "\"i tried to warn you!\"",
  "\"there is no way back now\"",
  "\"i hope you're\nhappy with yourself\"",
 }},
}

-- gets dialogue for current pos
function get_dialogue()
 for dial in all(dialogue) do
  if pos==dial.pos then
   return dial.txt
  end
 end
 return {}
end

-- delete current dialogue card
function del_dialogue()
 for i,dial in ipairs(dialogue) do
  if pos==dial.pos then
   deli(dial.txt,1)
   tdialstart=nil
   if #dial.txt==0 then
    deli(dialogue,i)
   end
   return
  end
 end
end

-- add dialogue card
function add_dialogue(txt)
 tbl={pos=pos,txt=txt}
 add(dialogue,tbl)
end

-- render first dialogue card
-- for current position (if any)
function draw_dialogue()
 optional_dialogue()

 txt=get_dialogue()

 if #txt>0 then
  if not dialoguemode then
   dialogue_t0=t()
   dialoguemode=true
  end

  dialogue_dt=t()-dialogue_t0

  local bl=8
  local bt=32
  local br=128-bl-1
  local bb=128-bt-1

  camera(0,0)
  rectfill(bl,bt,br,bb,0)
  rect(bl+1,bt+1,br-1,bb-1,7)
  spr(15,bl-2,bt-2,1,1,true,false)
  spr(15,br-5,bt-2,1,1,false,false)
  spr(15,bl-2,bb-5,1,1,true,true)
  spr(15,br-5,bb-5,1,1,false,true)

  if tdialstart==nil then
   tdialstart=t()
  end

  if txt[1]=="♥" then
   sspr(flr(t()%2)*8,0,8,8,br-24,bb-17,16,16,true)
   print("choose an option", bl+16, 40)
   print("⬆️ yes",bl+16,50+sin(t()))
   print("⬇️ yes",bl+16,56+sin(t()))
   print("⬅️ yes",bl+16,62+sin(t()))
   print("➡️ yes",bl+16,68+sin(t()))
   print("❎ yes",bl+16,74+sin(t()))
   print("🅾️ yes",bl+16,80+sin(t()))
   return
  end

  // mama chicken
  sspr(112,16,8,8,bl+8,bb-32,16,16)
  sspr(120,16,8,8,bl+24,bb-32,16,16)
  sspr(112,24,8,8,bl+8,bb-16,16,16)

  dialogue_len=#(txt[1])/32
  if dialogue_dt < dialogue_len then
   sfx_voice_update()

   if wascons then
    sspr(120,24,8,8,bl+24,bb-16,16,16)
   else
    sspr(120,8,8,8,bl+24,bb-16,16,16)
   end
  else
   sspr(120,24,8,8,bl+24,bb-16,16,16)
  end

  lines=split(txt[1],"\n")

  local midh=(bl+(br-bl)/2)
  local midv=(bt+(bb-bt)/2)-16
  for i,l in ipairs(lines) do
   local tl=midv+8*(i-#lines/2)-5
   local ll=midh-2*#l+1
   print(l,ll,tl,7)
  end

  if t()-tdialstart>0.5 then
   print("continue ➡️",70,84+sin(t()))
  end
 end
end

-- player input to go to next
-- dialogue card
function next_dialogue()
 local tdiff=0.5
 if t()-tdialstart>tdiff then
  if btnleft() or btnright()
    or btnup() or btndown()
    or btno() or btnx() then
   sfx(38,1)
   del_dialogue()
   dialoguemode=false
  end
 end
end

-- add opening dialogue only once
optional_done={false,false,false,false,false}

-- splat,drown,...
death_types={false,false,false,false,false,false,false,false}
death_dialogues=0

function optional_dialogue()
 -- opening dialogue
 if not optional_done[1] then
  if t()>1.5 then
   opening_dialogue()
   optional_done[1]=true
  end
 end

 -- death dialogue
 lvl=get_lvl()
 if lvl==1 then
  respawn_pos=-2
 else
  respawn_pos=-2-cumheights[lvl-1]
 end

 if pos==respawn_pos then
  if deaths>death_dialogues then
   death_dialogue()
   death_dialogues=deaths
  end
 end
end

function opening_dialogue()
 txt={
  "\"good morning,\n my little chicklet\" ♥",
  "\"you can use ⬅️➡️⬆️⬇️ to     \nhave fun in the garden\"",
  "\"but whatever you do...\"",
  "\"do not cross the road!\"",
 }
 add_dialogue(txt)
end

function death_dialogue()
 if died_how=="splat" and not death_types[1] then
  new_death=true
  death_types[1]=true
 elseif died_how=="drowned" and not death_types[2] then
  new_death=true
  death_types[2]=true
 elseif died_how=="penguin" and not death_types[3] then
  new_death=true
  death_types[3]=true
 elseif died_how=="ice" and not death_types[4] then
  new_death=true
  death_types[4]=true
 elseif died_how=="lava" and not death_types[5] then
  new_death=true
  death_types[5]=true
 elseif died_how=="fireball" and not death_types[6] then
  new_death=true
  death_types[6]=true
 elseif died_how=="star" and not death_types[7] then
  new_death=true
  death_types[7]=true
 elseif died_how=="fall" and not death_types[8] then
  new_death=true
  death_types[8]=true
 else
  new_death=false
 end

 lvl=get_lvl()

 if deaths==1 and lvl==1 then
  txt={
   "\"my poor little chicklet\"",
   "\"why did you not\nheed my warning?\"",
   "\"please stay in the\ngarden this time\"",
  }
 elseif new_death then
  if died_how=="splat" then
   txt={
    "\"hit by a car...\"",
    "\"what a dumb way to die\""
   }
  elseif died_how=="drowned" then
   txt={
    "\"just because you look\na bit like a duckling...\"",
    "\"does not mean you can\nswim like one!\""
   }
  elseif died_how=="penguin" then
   txt={
    "\"darn flightless birds!\""
   }
  elseif died_how=="ice" then
   txt={
    "\"what a cold surprise\""
   }
  elseif died_how=="lava" then
   txt={
    "\"i never thought i\nwould see my little\nchicklet drown in lava\""
   }
  elseif died_how=="fireball" then
   txt={
    "\"ouch, that has\ngot to hurt!\""
   }
  elseif died_how=="star" then
   txt={
    "\"they say if you\nshoot for the moon...\"",
    "\"you may land\namong the stars\"",
    "\"but they never\nmention getting hit\nin the face by one\""
   }
  elseif died_how=="fall" then
   txt={
    "\"such a long way down\""
   }
  else

  end
 elseif deaths==2 then
  txt={
   "\"you really are quite\nstubborn, aren't you?\"",
  }
 else
  txt=nil
 end

 if txt!=nil then
  add_dialogue(txt)
 end
end
-->8
-- draw graphics

function draw_spawners()
 for s in all(spawners) do
  if s.ty=="log" then
   local offset=(t()*s.s*30)%8
   for i=-1,15 do
    spr(66,i*8+offset,s.y)
   end
  elseif s.ty=="llog" then
   local offset=(t()*s.s*30)%8
   for i=-1,15 do
    spr(83,i*8+offset,s.y)
   end
  end
 end
end

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

function draw_bubbles()
 for b in all(bubbles) do
  local t0=t()-b.t
  if b.lava == true then
   color(8)
  else
   color(7)
  end
  if t0<0.40 then
   circ(px+b.x,py+b.y,1)
  else
   pset(px+b.x,py+b.y)
   pset(px+b.x-1,py+b.y)
   pset(px+b.x+1,py+b.y)
   pset(px+b.x,py+b.y-1)
   pset(px+b.x,py+b.y+1)
  end
 end
end

function draw_cars()
 for c in all(cars) do
  spr(c.sp,c.x,c.y,1,1,c.s<0)
 end
end

function draw_logs()
 for l in all(logs) do
  for i=1,l.w do
   local flipx=false
   local s=nil
   if l.ty=="log" then
    s=4
    if i==1 then flipx=true end
    if i>1 and i<l.w then s=3 end
   elseif l.ty=="llog" then
    if i==1 then
     s=22
    elseif i==l.w then
     s=24
    else
     s=23
    end
    if l.w==1 then
     s=19
    end
   elseif l.ty=="clog" then
    if i==1 then
     s=6
    elseif i==l.w then
     s=8
    else
     s=7
    end
   else
    assert(false, "can't  draw this log type.")
   end
   local sy = l.y
   if l.pcol then sy+=1 end
   spr(s,l.x+(i-1)*8,sy,1,1,flipx)
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

function draw_mama()
 if flr(t()*1.8)%2==0 then
  sspr(96,16,16,14,80,-8*3)
  sspr(96,16,16,14,80,-8*305)
 else
  sspr(96,16,16,14,80,-8*3+1)
  sspr(96,16,16,14,80,-8*305+1)
 end
 sspr(96,30,16,2,80,-8*3+14)
 sspr(96,30,16,2,80,-8*305+14)
end
-->8
-- dialogue voice

-- initiate or reset sound
-- variables
function init_voice()
 tstart=t()
 wascons=false
 tsfx=0.0
end

-- dialogue sound update logic
function sfx_voice_update()
 if t() - tstart > tsfx then
  if wascons then
   wascons=false
   if rnd(1) > 0.8 then
    sfx_emph()
    tsfx=(10/120)
   else
    sfx_vowel()
    tsfx=(14/120)
   end
  else
   wascons=true
   sfx_cons()
   tsfx=(26/120)
  end
  tstart=t()
 end
end

-- play random consonant
function sfx_cons()
 local i = flr(rnd(4)) + 21
 sfx(i, 3, 0, 8)
end

-- play random vowel
function sfx_vowel()
 local i = flr(rnd(4)) + 25
 sfx(i, 3, 0, 12)
end

-- play random emphasized vowel
function sfx_emph()
 local i = flr(rnd(2)) + 29
 sfx(i, 3, 0, 24)
end
__gfx__
fff77ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff777ff000000000000000000000000000000000000000000000000f00000ff
fff7799ffff77ffff00ff00f444444444444449ffbbffbbfff77777fff7777fff777777f000000000000000000000000000000000000000000000000f07770ff
fff778fffff7799f888888884444444444444449bbbffbb3f7777777677777677777777600000000000000000000000000000000000000000000000000707000
f77777fffff778ff888888774444444444444449bbbbbbb367777777767776777777777600000000000000000000000000000000000000000000000077700770
677777fff77777ff888888774444444444444449bbbbbbb367777777767776777777777600000000000000000000000000000000000000000000000000700070
f6666fff677777ff888888884444444444444449bbbbbbb367777777767776777777777600000000000000000000000000000000000000000000000000777770
fff9fffff6666ffff00ff00f444444444444449ff3bbbb3f66777777677777677777776f00000000000000000000000000000000000000000000000000007000
fff99ffffff99fffffffffffffffffffffffffffff3333fff666666666666666666666ff000000000000000000000000000000000000000000000000000070ff
fffffffffff77fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000777fffff
fff77ffffff799fff00ff00ff444444fff77cccffffffffff4444444444444444444444f0000000000000000000000000000000000000000000000007799999f
fff799fffff78fffcccccccc44444944f7cc777cffffffff44444944444449444444494400000000000000000000000000000000000000000000000079999999
fff78fffff7777ffcccccc77449444447c7777c1ff11110f4444444449444444494444440000000000000000000000000000000000000000000000007999ffff
ff7777fff677776fcccccc77444444447cccccc199ddd199494444444444444444444444000000000000000000000000000000000000000000000000789999ff
f677776fff6666ffcccccccc444449446111ccc19777771f44444494444944494444944400000000000000000000000000000000000000000000000078899fff
ff6666ffff9ff9fff00ff00f94444449f666111fffffffff9444444444444444444444490000000000000000000000000000000000000000000000007888ffff
ff9ff9ffff9ff9fffffffffff999999ffffffffffffffffff9999999999999999999999f0000000000000000000000000000000000000000000000006778ffff
fffffffffff77fffffffffffffffffffffffffffcc777777000000000000000000000000000000000000000000000000fff888ffffffffffffffff888fffffff
fff77fffff977ffff00ff00fff9ffffffff888ff77111111000000000000000000000000000000000000000000000000f8888888fffffffffff88f8888ffffff
ff977ffffff77fffaaaaaaaafff9a9fff8899a8f7111c111000000000000000000000000000000000000000000000000f8888888ffffffffff88888888f88fff
fff77fffff7667ffaaaaaa779f9a7a9f889aa7a8711c1cc1000000000000000000000000000000000000000000000000f887788fffffffffff888888888888ff
ff7667fff677776faaaaaa77f9a777a98998aa7871111111000000000000000000000000000000000000000000000000ff70777fffff77ffff888888888888ff
f677776fff6666ffaaaaaaaaff9a7a9ff889a98f7111c111000000000000000000000000000000000000000000000000f997777ffff7767fff88877788888fff
ff6666ffff9ff9fff00ff00ff9f9a9fffff888ff71cc1c11000000000000000000000000000000000000000000000000999777777f77677ffff677777888ffff
ff9ff9ffff9ff9ffffffffffffffffffffffffff7111111c000000000000000000000000000000000000000000000000ff98776667767767fff67777770fffff
ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff88767776777677fff67770777fffff
ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff676767677777ffff677777799999f
ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff677676767777ffff6777779999999
ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffff67767677777fff677777799999ff
ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffff667777777fff677777778899fff
ff7777ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffffff9fff9ffff677777767888ffff
f666666f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffffff9fff9ffff777677767878ffff
ff9ff9ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffff99f9f9f9fff776777776777ffff
5555555533333333cccccccc94444494677677771666111111d11111000000000000000000000000dddddddd3333333666663333333333300000000003333333
5555555533333333ccccc7cc444444447767667666666611111111d1000000000000000000000000dddddddd3333333366663333333333044444444440333333
5555555533b33333cccc7c774444444467777766ddd66d1111111111000000000000000000000000dddd777d33b333366663333333b330444444444444033333
5555555533333333cccccccc4444494477776777111dd111d1111111000000000000000000000000dddd7ddd3333333666663333333304444444444444403333
5555555533333333ccc7cccc44449444766777761111116611116111000000000000000000000000dddd777d3333333366663333333044444444444444440333
5555555533333333c77c77cc44444444777766676116666611111111000000000000000000000000dddddd7d3333333666633333330444444444444444444033
55555555333333b3cccccccc4444444466777777d11d666d1d111111000000000000000000000000dddd777d333333b6666633b3304444444444444444444403
55555555b3333333cccccccc49444449767767761111ddd111111116000000000000000000000000ddddddddb333333366633333000000000000000000000000
555555556566666655555555aaa99999cccccccc11111111000000000000000000000000000000002222222267767ccc33333ccc330444444444444444444033
555555556566666607c50cc59999aa997ccccccc8888888800000000000000000000000000000000222222227761119c333888ac330444444444444444444033
55555555555555550cc507c5aa9999aaccccccc7999999990000000000000000000000000000000022727772667191cc3338a8cc330444444444444444444033
5555555566666566055505559aaaaa99cccccc7caaaaaaaa000000000000000000000000000000002272727222211137999888b3330444444444444444444033
55555555666665660cc50c7599999999ccccc7ccbbbbbbbb0000000000000000000000000000000022727272292737369a93b3b3330444440000000000044033
555555556666656607c50cc59aaaaa99cccc7ccc333333330000000000000000000000000000000022727272222736379993b3b3330444440aaaa0aaaa044033
55555555555555550cc507c5aa9999aaccc7cccccccccccc0000000000000000000000000000000022727772737737373b33b3b3330444400aaaa0aaaa044033
775577556566666600000000999aaa99cccccccc111111110000000000000000000000000000000022222222637767763b333333b30444040aaaa0aaaa044033
55555555000000000000000094444494000000000000000000000000000000000000000000000000888888880000000000000000444444440aaaa0aaaa044033
aaaaaaaa000000000000000099999499000000000000000000000000000000000000000000000000888888880000000000000000444444440000000000044033
555555550000000000000000499aa994000000000000000000000000000000000000000000000000777877780000000000000000444444440aaaa0aaaa044033
55555555000000000000000099aa7a99000000000000000000000000000000000000000000000000788878780000000000000000444444440aaaa0aaaa044033
55555555000000000000000049a7aa94000000000000000000000000000000000000000000000000777878780000000000000000444444440aaaa0aaaa044033
55555555000000000000000049aaaa94000000000000000000000000000000000000000000000000887878780000000000000000444444440aaaa0aaaa044033
aaaaaaaa000000000000000049994994000000000000000000000000000000000000000000000000777877780000000000000000000044440000000000044033
55555555000000000000000049494499000000000000000000000000000000000000000000000000888888880000000000000000444404444444444444444033
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333330000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333330000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000337773330000000000000000330444044444044400000000
000000000000000000000000000000000000000000000000000000000000000000000000000000003373733300000000000000003304440444a4044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000337373330000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000337373330000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000337773330000000000000000330444044444044400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333330000000000000000b30444044444044400000000
141414141414141414c5141414141414151515151515151515151515151515154545454545454545454545454545454535343435353535343634343434363435
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414141414c5141414141414c5141414151515151515151515151515151515154444444545454545454545454545454535353535353535353434343434353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414c5c51414141414141414c51414141515151515151515151515151515151544b5444444454545454545454544444435353535353535353535353535353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14c514141414c5c5c5141414141414142515151525252525252525252525252544b54444b5444545454545444444b5b535353535353535353535353535353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14141414141414141414141414c51414251515152525252525252525252525254444b5b5b5b54444444444b5b5b5444435353535353535353535353535353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
141414141414141414141414141414140505050505050505050505050505050544b5b544b5b5b5444444b5b5b5b5b54435353434343434353535353535353536
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2424242424242424242424242424242404040404040404040404040404040404b5b54444b544444444444444b5b5b5b534343434343434343535353535353536
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
242424242424242424242424242424242515151525252525251515152525252544b5b5b54444444444444444444444b534343436343434343435353535353434
55555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414141414141414141414141414141425151515252525252515151525252525b544444444454545454545454545444434343434343434343435353535343634
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414141414141414c514141414c51414151515151515152525151515151515154545454545454544444445454545454534363434343434343535353535343434
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14c5c514141414141414141414141414151515151515152525151515151515154545454545454545454545454545454534343434343434353535353434343436
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14141414141414141414141414141414151515151515152525151515151515154444454545454545454544444444444434343434343535353535353436343434
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
242424242424242424242424242424242424242424242424242424242424242444444444444444444444444444b5444435343434343434353535353535353636
55555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14141414141414141414141414141414242424242424242424242424242424244444b5b544444444444444b5b544444435353535353535353535353535353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414c514141414141414c514141414141515151515151525251515152525252544444444444444b5b54444444444444435353535353535353535353535353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414c5141414c51414141414c5c51414151515151515152525151515252525254444444444444444444444444444444435363635353635353535343634343435
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414141414c514141414141414141414252525252525252525151515151515154444454545454444444444454545454536353636353535353434343434343535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14c514141414141414c5141414141414252525252525252525151515151515154545454545454545454545454545454535353535353535353535353535353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14141414141414141414141414141414151515151515151515151515252515154444444444454545454544444444444435353434343434353535353535353535
55555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05050505050505050505050505050505151515151515151515151515252515154444444444444444444444444444444435353534343434343634363435353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040404151525251515151525252525252515154444444444444444444444444444444435353535343434343434343634353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14141414141414141414141414141414151525251515151525252525252515154444444444444444444444444444444435353534363434343434343434343535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14c5141414141414141414141414c5c5151525251515151515151515252515154444b54444444444444444b54444444435353434343434343435353535353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1414c514141414141414141414c5141415152525151515151515151525251515b544444444444444444444444444b54435353535353535353535353535353535
55555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
24242424242424242424242424242424151525251515151515151515252515154444b5454545454545454444b544444436363535353535343436353634343434
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2414c51414141414141414c5c5141414050505050505050505050505050505054545454545454545454545454545454435353535353535353535353535353535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
242414c51414141414141414d4e4e4f4050505050505050505050505050505054545454545454545454545454545454535353434363434343434343436343535
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
242414c5c514141414141414d5d6e5f5040404040404040404040404040404044545454545454545454545454545454535343634343434343434343434363435
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
241414c5c514141414141414d7e7e6f6151525251515151515151515252515154445454545454545454545454545454534343436343434343434343436343434
64646464646464646464646464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2424141414c5141414141414b4c4c5c5151525251515151515151515252515154444444545454545444444454545454536343434343434343434343434343634
64646464646454545454546464646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2424142424c5c51414141414141414141515151515151515151515151515151544b5444444444444444444444444444434343434343434343434343434343434
64646454545454545454545454646464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
242424242424c5c5c5c51414141414c515151515151515151515151515151515444444444444444444444444b544b54434343434343434343434343434343434
64645454545454545454545454546464000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555005500555555555555555555555555555555555555555555555555555555005500555555555555555555555
5555555555555555555555555555555555555555888888885555555555555555555555555555555555555555555555555555cccccccc55555555555555555555
5555555555555555555555555555555555555555888888775555555555555555555555555555555555555555555555555555cccccc7755555555555555555555
5555555555555555555555555555555555555555888888775555555555555555555555555555555555555555555555555555cccccc7755555555555555555555
5555555555555555555555555555555555555555888888885555555555555555555555555555555555555555555555555555cccccccc55555555555555555555
55555555555555555555555555555555555555555005500555555555555555555555555555555555555555555555555555555005500555555555555555555555
77557755775577557755775577557755775577557755775577557755775577557755775577557755775577557755775577557755775577557755775577557755
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00555555555555555555555555555555555555555555555500550055555555555555555555555555555555555555555555555005500555555555555555555555
aaa55555555555555555555555555555555555555555555888888885555555555555555555555555555555555555555555558888888855555555555555555555
aaa55555555555555555555555555555555555555555555778888885555555555555555555555555555555555555555555557788888855555555555555555555
aaa55555555555555555555555555555555555555555555778888885555555555555555555555555555555555555555555557788888855555555555555555555
aaa55555555555555555555555555555555555555555555888888885555555555555555555555555555555555555555555558888888855555555555555555555
00555555555555555555555555555555555555555555555500550055555555555555555555555555555555555555555555555005500555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333bb33bb33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b33333bbb33bbb33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333bbbbbbbb3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333bbbbbbbb3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333bbbbbbbb3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b33bbbbbb3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3bbbb33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333330000000000000000003333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333304444444444444444440333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33044444444444444444444033333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333330444444444444444444444403333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333304444444444444444444444440333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333044444444444444444444444444033
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b330444444444444444444444444444403
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b333333300000000000000000000000000000000
333333333333333333333ccc33333ccc33333ccc3333333333333333333333333333333333333333333333333333333333044444444444444444444444444033
3333333333333333333888ac333888ac333888ac3333333333333333333333333333333333333333333333333333333333044444444444444444444444444033
33b3333333b333333338a8cc3338a8cc3338a8cc33b3333333b3333333b3333333b3333333b3333333b3333333b3333333044444444444444444444444444033
3333333333333333999888b3999888b3999888b33333333333333333333333333333333333333333333333333333333333044444444444444444444444444033
33333333333333339a93b3b39a93b3b39a93b3b33333333333333333333333333333333333333333333333333333333333044444444444440000000000044033
33333333333333339993b3b39993b3b39993b3b33333333333333333333333333333333333333333333333333333333333044444444444440aaaa0aaaa044033
333333b3333333b33b33b3b33b33b3b33b33b3b3333333b3333333b3333333b3333333b3333333b3333333b3333333b333044440000044440aaaa0aaaa044033
b3333333b33333333b3333333b3333333b333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3044404444404440aaaa0aaaa044033
333333333333333333333ccc33333ccc33333ccc3333333333333333333333333333333333333333333333333333333333044404444404440aaaa0aaaa044033
3333333333333333333888ac333888ac333888ac3333333333333333333333333333333333333333333333333333333333044404444404440000000000044033
33b3333333b333333338a8cc3338a8cc3338a8cc33b3333333b3333333b3333333b3333333b3333333b3333333b3333333044404444404440aaaa0aaaa044033
3333333333333333999888b3999888b3999888b3333333333333333333333333333333333333333333333333333333333304440444a404440aaaa0aaaa044033
33333333333333339a93b3b39a93b3b39a93b3b33333333333333333333333333333333333333333333333333333333333044404444404440aaaa0aaaa044033
33333333333333339993b3b39993b3b39993b3b33333333333333333333333333333333333333333333333333333333333044404444404440aaaa0aaaa044033
333333b3333333b33b33b3b33b33b3b33b33b3b3333333b3333333b3333333b3333333b3333333b3333333b3333333b333044404444404440000000000044033
b3333333b33333333b3333333b3333333b333333b3333333b3333333b3333333b3377333b3333333b3333333b3333333b3044404444404444444444444444033
333333333333333333333333333333333333333333333333333333333333333333377993333333333333333333333333333333366666333333333ccc33333ccc
3333333333333333333333333333333333333333333333333333333333333333333778333333333333333333333333333333333366663333333888ac333888ac
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b333333777773333b3333333b3333333b3333333b33336666333333338a8cc3338a8cc
3333333333333333333333333333333333333333333333333333333333333333777777333333333333333333333333333333333666663333999888b3999888b3
33333333333333333333333333333333333333333333333333333333333333333777733333333333333333333333333333333333666633339a93b3b39a93b3b3
33333333333333333333333333333333333333333333333333333333333333333339333333333333333333333333333333333336666333339993b3b39993b3b3
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333993b3333333b3333333b3333333b3333333b6666633b33b33b3b33b33b3b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333666333333b3333333b333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3
b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000004040204040002000000000404010101040401020004000000000001010101010400000200000000000000000001010100000000000000000000000000010100
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
5c5c415c5c5c414141415c415c5c4141525252525251514040515152525252524444445b44444444444444445b444444535363434343434343434363436353539e9e9eafafafafafafafaf9efefefe9ec0c1c2c3c4c5c6c7c8c9cacbcccdcecf0000000000000000000000000000000000000000000000000000000000000000
5c415c5c5c4141414141415c5c5c5c5c52525252525151404051515252525252445b5b5b44444444444444445b44445b53634343634343434343634343635353ddaf419e419e9eaf9e419eaf9e9e419ed0d1d2d3d4d5d6d7d8d9dadbdcdddedf0000000000000000000000000000000000000000000000000000000000000000
41415c41414141414141414141415c415252525252515140405151525252525244445b44445b444444444444445b5b4453534343434343434343434363535353dd419eaf9eaf9e41fe9e419e9e41419ee0e1e2e3e4e5e6e7e8e9eaebecedeeef0000000000000000000000000000000000000000000000000000000000000000
5c5c415c41414141414141414141415c52525252525151404051515252525252445b444444445b4444445b444444445b5353634343434343434343434363535341419e41419e9eaf9e41ae41af419eaff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff0000000000000000000000000000000000000000000000000000000000000000
414141414141414141414141414141415252525252515140405151525252525244444444444444444444444444445b445353434343634343434363434343535341bd41af41feafdd419e9e419e9eaf9e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414152525252525151404051515252525252444444445454545454545454444444445343434353535343435353534343435341fe419edd41419e41419d41419eafaf404142434445464700004a4b4c4d4e4f0000000000000000000000000000000000000000000000000000000000000000
42424242424242424242424242424242525252525251514040515152525252524444545454545454545454545454545453535353535353535353535353535353414141419e4141414141419e4141af41505152535455560000005a5b5c5d5e5f0000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424252525252525151515151515252525252445454545454545454545454545454545353535353535353535353535353535341414141414141414141414141414141600000630000000000006a006b6d6e6f0000000000000000000000000000000000000000000000000000000000000000
424242424242424242424242424242425151515151515151515151515151525254545454545454545454545454545454535353535353535353535353535353535c5c4141414141414141414141415c5c000000000000000000007a00007d7e000000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424251515152525151515252515151515252545454545454545454545454545454545353535353535353535353535353535341415c414141414141414141415c4141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414151515152525151515252515151515252545454545454545454545454545454545353535353535353535353535353535342424242424242424242424242424242808182838485868788898a8b8c8d8e8f0000000000000000000000000000000000000000000000000000000000000000
5050505050505050505050505050505060606060606060606060606060606060545454545454545454545454545454545353434343535343435353636363535342415c41414141414141415c5c414141909192939595969798999a9b9c9d9e9f0000000000000000000000000000000000000000000000000000000000000000
404040404040404040404040404040406060606060606060606060606060606054545454545454545454545454545454535353535353535353535353535353534242415c41414141414141414d4e4e4fa0a1a2a3a4a5a6a7a8a9aaabacadaeaf0000000000000000000000000000000000000000000000000000000000000000
414141414141414141414141414141414242424242424242424242424242424254545454545454545454545454545454535353535353535353535353535353534242415c5c414141414141415d6d5e5fb0b1b2b3b4b5b6b7b8b9babbbcbdbebf0000000000000000000000000000000000000000000000000000000000000000
4141415c41414141414141415c415c414242424242424242424242424242424254545454545454545454545454545454535353535353535353535353535353534241415c5c414141414141417d7e6e6f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41415c5c5c41414141415c415c5c414150505050505050505050505050505050545454545454545454545454545454545353535353535353535353535353535342424141415c4141414141414b4c5c5c0001020304050607080000000000000f0000000000000000000000000000000000000000000000000000000000000000
415c5c4141414141415c5c5c5c5c414140404040404040404040404040404040545454545454545454545454545454545353535343434343434353535353535342424142425c5c4141414141414141411011121314151617180000000000001f0000000000000000000000000000000000000000000000000000000000000000
414141414141414141414141414141415151515151515151515151515151515154545454545454545454545454545444535353434363434343434343435353534242424242425c5c5c5c41414141415c2021222324250000000000002c2d2e2f0000000000000000000000000000000000000000000000000000000000000000
424242424242424242424242424242425151515151515151515151515151515154545444444444545454545454544444534343434343434363434343434343534242424242415c5c4141414141415c413000000000000000000000003c3d3e3f0000000000000000000000000000000000000000000000000000000000000000
5050505050505050505050505050505040404040404040404040404040404040444444445b5b4444444454545444444453434363434343434343434363434353424242415c5c5c414141414141415c41000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
40404040404040404040404040404040505050505050505050505050505050504444445b44445b444444444444444444535343434343434343434343434353534242415c41414141414141414141415c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
414141414141414141414141414141414040404040404040404040404040404044445b44445b44445b4444445b4444445353534343634343436343436353535342414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
415c4141414141414141414141414141505050505050505050505050505050504444445b5b44444444445b4444445b445353535353535353535353535353535341414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
414141415c41414141415c41415c414140404040404040404040404040404040445b44444444445b44444444444444445353535353535353535353535353535341414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41415c415c4141414141414141415c414040404040404040404040404040404044444444444444445b5b4444445b44445353535353535353535353535353535341414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414151515151515151515151515151515151445454545454545454545454444444445353535353535353535353535353535341414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404051515151515151515151515151515151545454545454545454545454545454545353535343434343434343535353535345454545454545454545454545454545000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414140404040404040404040404040404040545454545454545454545454444444445353434343434363436343634353535345454545454545454545454545454545000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424250505050505050505050505050505050545444444454545454545444445b5b445363434353535353536363636363535355555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
42424242424242424242424242424242404040404040404040404040404040405444445b44444444545454544444445b5353535353535353535353535353535346464646464646464646464646464646000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4242424242424242424242424242424240404040404040404040404040404040545444445b44445454545454545454545353535353535353535343434353535346464646464646464646464646464646000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414151515151515151515151515151515151545454545454545454545454545454545343535343435363436343434343635346464646464646464646464646464646000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011000000d03500005140350c005110350c005100350b0050f035000051403500005080350000514035000050d035000051403500005110350100510035130050f03507005140351300508035000051403500005
01100000190350000019035000001d035000001c035000001b03500000180350000014035000001803500000190350000019035000001d035000001c035000001b035000001803500000140350c0001803500000
01100000007000070025730227302273524730227302073518730197301a7351b7301b735207351473114735007000070025730227302273524730227302073518730197301a7351b7301b735207351473114735
011000000d0350a005140350000508035000050a035000050c03500005140350000508035000050503500005070350000516035000050c0350000516035000051103500005140350000511035000051403500000
011000001903500005190350000514035000051603500005180350000518035180051403500005110350000513035000051803500005000050000518035000050000500005180350000500005000051803500000
011000000070000700257302273022735247302273020735187301d730207302273024730297302c7302e735307312e7352b7352873524730227301f7301c7351d7351e7351f73520731207351b7301473000000
011000000d035000051403500005080350000517035000050603500005160350000507035000051303500005080350000514035000050a0350000508035000050d03500005000050000500005000050803500005
01100000190351800519035000051403500005190350000512035000051903500005130350000514035000051403520730190351f7301f730190351d7311d7301973119730197301973500005000050000000000
01100000007002470025732227302273024735227351d735207311d7351e7352773127730257352273022735207351d735207311d7301b7301b73519730197351953524000195352470019535000000000000000
01100000007002470025732227302273024735227351d735207311d7351e7352773127730257352273022735207351d735207311d7301d7301d7351b7301b7351973019735195322400018532247001753200000
011000000c035000051403500005080350000514035000050c0350000514035000050803500005060350000505035000051403500005080350000514035000050d03500005140350000511035000051003500005
011000001d73500000180351b73514035000001e735000001d735000001e0351b73514035000001d735000001b735000001903519730197351d73516730167351d7301d7350d0350000000000000000000000000
011000002973520730247352773127735247352a7302a7352973520730247352773127735247352a73524735277351d7302073525731257352073522731227352073020730207302073020735227312273525735
011000000c035000001403500000080350000014035000000f0350000014035000000803500000060350000005035000001403500000080350000014035000000d03500000000000000000000000000a03500000
01100000187350000018035187301873500000167350000018735000001e035000001403500000120350000019735000001903518731187351973016730167351473014735145301453513530135351253012535
01100000247301b7301e73524730247351e73522731227352073020730207302073020735227302273524735257301d7302073524731247351d7302273022735207302073520530205351f5301f5351e5301e535
011000000603500000120350000007035000001303500000080350000014035000000a03500000160350000003035000000f03500000080350000014035000000103500000000000000000000000000803500000
011000001673500700160351b73013035197051b0351a00519035147351d035167351673500000147301473500000147351403500000000000000012730127351173111735000000000000000000000000000000
0110000022735197301e7352773127735257352273022735207351d730207352273122735207351d7301d7351d7351b7301d73520731207351d7351b7301b735197301973520530205351f5301f5351e5301e535
011000001203500000160350000013035000001a0350000014035000001d0350000016035000001d0350000000000000001403519730197351673512734127351173011735140351100011035140001403500000
011000002c7352a7302c73529730297352c7312a7352973027735267302773524730247352773126735247302273521730227351d7301d7351e73520731227352573525705147301473519730197350000000000
00010000277102a721297612b761287712a7612674128721267002570124701247012470126701277012170122701237012470125701257010070100701007010070100701007010070100701007010070100701
000100002b7102a7312b761287712a76129761287512a721000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000297102e7212d7412e7612c7612b7512c73129721000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000277102674127761277712877126751287412a721000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0001000028730297512776129771297712876127761287512875127741287312a7310a70100700247002470023700000000000000000000000000000000000000000000000000000000000000000000000000000
000100002671028730257402674028740277502875026760237602476026760257502570024700247002570025700000000000000000000000000000000000000000000000000000000000000000000000000000
000100002671028721277312a751297612a7612976126761287412773128721267112270023700257002470000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100002275024741277612577127771257712376124761257612475125741237310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100002d7102f7302f74031760307702f770307702f770307602e7602d7602e7602b7502a7502b7402973028730297202772027720297302773027730287302970028700277002670025700267002770029700
0001000026750297502775027750277502a750297502c7502b7502c7502f7502d750307502f75031750317502f7502f750307502f7502e7502f75029750297500000000000000000000000000000000000000000
490600002a5142e541325152e5002e5012e5012e5050c5000b5000b5000b5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c5000c500
710200002c014280222404228062240722007224072200721c072200721c072180721c072180721407218072140721007214072100720c072100520c032080220c01208015040150000000000000000000000000
4d040000236142462125631256412663126621256112461123611216111f6111d6111a61117611146111261509600076000560000100001000010000100001030010300103001030000000000000000000000000
010300000c6141262115631176311963119621196211861116611106110c6110961106611046110361103615096000760005600266002b600296002260020600266002c60023600146001a600216001560026600
590400002a64325673206731b6711766314661116610f6630e6510c6410c6310b6210b6210a6230a6110a6110a6110a6110b61104611046110461500000000000000000000000000000000000000000000000000
b50400002c0142802224042280722407220072180722007228073200721c0721807228073180721407218072140722807314072100720c072100520c032080222405308015040150000000000000000000000000
010600001a51135541345713356132541315212f5112f515225000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010a00002e04500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00 40414244
00 41424344
00 41424344
00 41424344
00 4a4b4c44
00 4d4e4f44
00 50515244
00 50535444

