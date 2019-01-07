pico-8 cartridge // http://www.pico-8.com
version 16
__lua__


box = {}
man = {}
man.x = 16
man.y = 16
man.tick = 0
man.sprites = {6, 7, 8}


box.sprite = 0
box.x = 0
box.y = 0
velocity = 0



map_x = 0
map_y = 0


function solid(x, y)
  val=mget(x, y)
  return fget(val, 0)
end

function solid_area(x, y, w, h)
  return
    solid(x-w, y-h) or
    solid(x+w, y-h) or
    solid(x-w, y+h) or
    solid(x+w, y+h)
end

function move_actor(actor)
  

  if btn(0)
    then actor.x -= velocity 
  end
  if btn(1)
    then actor.x += velocity
  end
  if btn(2)
    then actor.y -= velocity
  end
  if btn(3)
    then actor.y += velocity
  end
end


function animate(object)
  if object.tick >= 30
    then object.tick = 0
  end
  --check the ticks. If the ticks equal a certain thing. Then we change the sprite.
end


function check_location(actor)
  local x = actor.x / 8
  local y = actor.y / 8
  --here we put in the collision logic
  if mget(x + 1, y + 1) == 4
    then actor.sprite = 3
  end
end

function _draw()
 cls()
 map(0, 0, 0, 0, 16, 16)
 spr(box.sprite, box.x, box.y)
 spr(man.sprites[1], man.x, man.y)
 --print('mget: '..mget(7,3), 64, 0)
 print(solid(man.x / 8, man.y / 8), 32, 100 )
 --print('man x : '..man.x / 8, 32, 100 )
 --print('y: '..man.y / 8, 85, 100 )
end

function _update()
  man.tick += 1
  move_actor(man) 
  animate(man)


 check_location(man)
end
__gfx__
bbbbbbbbcccccccc0000000000000000999999990808080800ffff0000ffff0000ffff0000000000000000000000000000000000000000000000000000000000
b000000bc000000c0000000000000000999999998080808000fcfc0000fcfc0000fcfc0000000000000000000000000000000000000000000000000000000000
b000000bc000000c0000000000000000999999990808080800ffff00f0ffff0000ffff0f00000000000000000000000000000000000000000000000000000000
b000000bc000000c000000000000000099999999808080800ffffff00ffffff00ffffff000000000000000000000000000000000000000000000000000000000
b000000bc000000c00000000000000009999999908080808f0ffff0f00ffff0ff0ffff0000000000000000000000000000000000000000000000000000000000
b000000bc000000c0000000000000000999999998080808000ffff0000ffff0000ffff0000000000000000000000000000000000000000000000000000000000
b000000bc000000c0000000000000000999999990808080800f00f0000f00f0000f00f0000000000000000000000000000000000000000000000000000000000
bbbbbbbbcccccccc0000000000000000999999998080808000f00f0000f0000000000f0000000000000000000000000000000000000000000000000000000000
__gff__
0000020000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0505050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0005000505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
