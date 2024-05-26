# Godot 4.x Roguelike FOV Algorithms
Two FOV algorithms for roguelikes for Godot 4.x

![image](https://i.imgur.com/1rU4JgF.gif)

## Information

This is a fork of AikonCWD's implementation of two different FOV algorithms for roguelikes, updated to Godot 4.x.
The [original repo](https://github.com/aikoncwd/Godot-FOV-algorithms-roguelike) is still up, if you need the 3.x version.
AikonCWD also uploaded a [web build on itch.io](https://aikoncwd.itch.io/godot-fov-algorithms-for-roguelikes), which you can try online.
Their web version is the original Godot 3.x version. However, since I only updated the scripts to Godot 4, it is functionally the same and I didn't upload a new build.

- Arrow keys to move
- Left/Right Mouse click to edit walls
- Esc to go back and select other algorithm

## Algorithms
These links were provided as references in AikonCWD's original README. I have not used them, only naively ported the project to 4.x.

- Raycasting
  - https://www.roguebasin.com/index.php/Ray_casting
- Shadowcasting (I like this one the most)
  - https://www.roguebasin.com/index.php/Shadow_casting
  - https://www.albertford.com/shadowcasting

AikonCWD also recommended this article to read: http://www.adammil.net/blog/v125_roguelike_vision_algorithms.html

## Acknowledgement
- This is a fork of [Godot-FOV-algorithms-roguelike](https://github.com/aikoncwd/Godot-FOV-algorithms-roguelike) by [AikonCWD](https://github.com/aikoncwd)
- The user [thedyze](https://github.com/thedyze) already began a port to 4.x, which I just completed to include both algorithms.
Their contributions can be found here: [https://github.com/aikoncwd/Godot-FOV-algorithms-roguelike/issues/1](https://github.com/aikoncwd/Godot-FOV-algorithms-roguelike/issues/1)
- From what I can tell, the art assets were made by [Rogue Yun](http://www.bay12forums.com/smf/index.php?topic=144897.0) for Dwarf Fortress in 2014 and released under CC0.
