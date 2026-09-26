# Beginner Roblox Coin Game

This repo is a simple starter project for a beginner Roblox game where players collect coins and try to win.

## What this project teaches
- Creating a basic 3D map
- Adding collectible parts
- Writing simple Roblox scripts
- Displaying score in a HUD
- Making a simple win condition

## Build this in Roblox Studio

1. Open Roblox Studio.
2. Create a new Baseplate project.
3. Build a small platform or obstacle course using parts.
4. Create a folder in Workspace named `Coins`.
5. Add a few `Part` objects inside the `Coins` folder.
6. Make each coin look like a coin:
   - Shape: Cylinder or Part
   - Material: Neon or SmoothPlastic
   - Color: Gold or yellow
   - Size: about `0.5 x 0.5 x 0.2`
7. Put a `SpawnLocation` in the map.
8. Put the script from `scripts/CollectCoins.server.lua` into `ServerScriptService`.
9. Press Play and test the game.

## Recommended beginner setup

- Ground: large part anchored to the floor
- Platforms: a few raised parts
- Coins: 5-10 in the `Coins` folder
- Spawn point: `SpawnLocation`

## Script

The file `scripts/CollectCoins.server.lua` handles:
- leaderstats
- coin collection
- HUD display
- win message when all coins are collected

## Next upgrades
- add sound effects
- add a timer
- add enemies
- add multiple levels
- add a start screen

## Quick tips
- Remember to anchor the floor and platforms.
- Put coin parts inside `Workspace > Coins`.
- Use collection script after you create the folder.
- Keep your game simple at first.
