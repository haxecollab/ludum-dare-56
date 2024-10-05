# Project Plan for "Tiny Realms: Micro Civilizations"
1. Core Mechanics and Features

    Autotile (FlxTileMap)
        Set up autotiling to simplify map creation, ensuring seamless terrain transitions.
    Level View (FlxTileMap)
        Autotiling: Develop and implement a complete tile-based map with dynamic autotiling for terrain and environmental features.
        Pathfinding: Integrate an efficient pathfinding system (A* or similar) for NPC movement across the map.
        Map Size: Set up the overworld level with dimensions of 2048x2048 pixels.
        Camera: Implement camera controls (zoom, pan) to allow players to navigate the large map smoothly.

2. Procedural Generation

    BSP (Binary Space Partitioning)
        Use BSP for creating distinct, varied areas within the map (e.g., village zones, forest zones, resources).
    Perlin Terrainmap Generator
        Utilize Perlin noise for creating smooth, natural terrain features such as hills, valleys, and rivers.

3. User Interface (UI)

    Title Screen
        Design a visually engaging title screen, with the game logo, theme music, and menu options.
    Settings Screen
        Include settings for adjusting sound, music volume, controls, screen resolution, and other gameplay preferences.
    New Game Screen
        Provide options to start a new game, select game difficulty, or customize initial civilization features.
    Load Game Screen
        Implement a screen for selecting saved games, allowing players to resume previous sessions.
    HUD (Heads-Up Display)
        Custom Metrics: Design a HUD to display civilization metrics, such as population, resources (food, wood, gold), happiness, and other important game indicators.

4. Gameplay and Mechanics

    AI (Artificial Intelligence)
        Develop AI for villagers, warriors, and other units, allowing for autonomous behavior such as resource collection, combat, and decision-making.
        Rival AI Civilizations: Implement basic AI for neighboring factions, capable of trading, forming alliances, and engaging in conflict.

5. Graphics

    Tilemap Graphics
        Design and refine 16x16 tiles for various terrains (grass, dirt, water, rock) and structures (houses, walls, farms).
    Creature Sprites
        Create tiny 16x16 creature sprites, including villagers, warriors, wizards, and mythological beings.
    Building and Structure Sprites
        Design small structures such as houses, resource-gathering buildings, monuments, and defensive structures.
    Animations
        Add simple animations for resource gathering, construction, and combat to bring the world to life.

6. Sound and Music

    Sound Effects
        Create sound effects for key actions like resource collection, construction, combat, and menu navigation. Sounds should have a nostalgic 16-bit feel.
    Background Music (BGM)
        Compose or source retro-style background music to enhance the atmosphere. Include different tracks for different scenarios (e.g., peaceful village music, battle theme).

7. Game Logic and Systems

    Resource System
        Implement core resources (food, wood, stone, gold) and logic for resource generation, collection, and expenditure.
    Building and Expansion System
        Allow players to construct and upgrade structures. Ensure buildings contribute positively to metrics like population capacity and resource efficiency.
    Tech Tree and Upgrades
        Create a simple tech tree allowing players to research upgrades, leading to better buildings, stronger units, and new abilities.
    Combat and Defense
        Develop a simple combat system for defending the village from threats. Include basic attack and health values for units.

8. Procedural Gameplay Elements

    Random Events
        Add random events to make gameplay dynamic (e.g., attacks by predators, visiting traders, changing weather).
    Exploration
        Include areas that are initially shrouded in fog-of-war, encouraging players to explore the 2048x2048 map.

9. Game Flow and User Experience

    Tutorial
        Develop a brief, interactive tutorial to introduce players to the game mechanics—how to gather resources, build structures, and interact with AI civilizations.
    Quests and Objectives
        Implement quests and goals for players to achieve, helping guide progression and maintain engagement.
    Narrative Integration
        Tie gameplay elements into the story-driven narrative to enhance player immersion. Include dialogues with other factions, cutscenes, and storyline progression.

10. Polish and Playtesting

    Bug Fixing
        Regularly playtest and fix bugs related to pathfinding, UI, and AI behaviors.
    Balancing
        Ensure balancing of resource generation, AI difficulty, and combat to make the gameplay challenging but fair.
    Optimization
        Optimize graphics and AI logic to maintain smooth performance, particularly in a large map environment.

11. Deployment and Submission

    Build and Export
        Compile the game into executable formats for multiple platforms (e.g., Windows, Mac, web).
    Testing on Target Platforms
        Test the game on different platforms to ensure smooth functioning.
    Final Submission
        Ensure all required assets, build files, and documentation are ready for submission for the Ludum Dare deadline.

## 1. Core Mechanics and Level Design
### Autotiling & Level Maps
- **Assigned To**: **Level Designer 1**
- **Tasks**:
  - Set up the autotiling system using FlxTileMap for creating consistent terrain transitions.
  - Design a base tile map (2048x2048) that includes all terrain types for the overworld.
- **Dependencies**: Need basic tile graphics.

### Pathfinding
- **Assigned To**: **Gameplay Programmer**
- **Tasks**:
  - Implement pathfinding for NPCs and player units (use A* algorithm).
- **Dependencies**: Requires level maps to test unit movement.

### Camera System
- **Assigned To**: **Gameplay Programmer**
- **Tasks**:
  - Set up the camera system (zoom, pan) for navigating the large map smoothly.
- **Dependencies**: Should be integrated with the level maps.

## 2. Procedural Generation
### BSP and Terrainmap Generator
- **Assigned To**: **Procedural Content Programmer**
- **Tasks**:
  - Implement BSP to generate distinct map sections.
  - Use Perlin noise for procedural terrain generation (hills, rivers).
- **Dependencies**: Integrated into the tile maps to ensure variety in levels.

## 3. User Interface (UI)
### Title Screen, Settings, New Game, Load Game
- **Assigned To**: **UI Designer**
- **Tasks**:
  - Create visuals for title, settings, new game, and load screens.
  - Coordinate with the **Programmer** to ensure UI screens transition correctly.

### HUD Development
- **Assigned To**: **UI/UX Designer**
- **Tasks**:
  - Design the HUD to show resources, population, and other game metrics.
- **Dependencies**: Coordinate with **Gameplay Programmer** to integrate HUD metrics into gameplay.

## 4. Gameplay Mechanics
### AI Systems
- **Assigned To**: **AI Programmer**
- **Tasks**:
  - Implement AI for NPCs (villagers, workers) to make them perform tasks autonomously.
  - Develop rival civilization AI with basic strategies for trading, alliances, and conflict.
- **Dependencies**: Needs pathfinding to ensure smooth AI behavior.

## 5. Graphics
### Tilemap Graphics
- **Assigned To**: **Pixel Artist 1**
- **Tasks**:
  - Create the 16x16 tiles for various terrains (grass, water, dirt).
- **Dependencies**: Need to provide these to the **Level Designer**.

### Creature Sprites
- **Assigned To**: **Pixel Artist 2**
- **Tasks**:
  - Create tiny creature sprites (villagers, warriors, wizards, creatures).
- **Dependencies**: Provided to the **Gameplay Programmer** for integration.

### Building Sprites and Animations
- **Assigned To**: **Pixel Artist 3**
- **Tasks**:
  - Design and animate small structures like houses, farms, and defenses.
- **Dependencies**: Coordinate with **Level Designer** for placement and size consistency.

## 6. Sound and Music
### Sound Effects
- **Assigned To**: **Sound Designer**
- **Tasks**:
  - Create retro-style sound effects for actions like resource collection, combat, and building.
- **Dependencies**: Work with **Gameplay Programmer** for implementation timing.

### Background Music (BGM)
- **Assigned To**: **Composer**
- **Tasks**:
  - Compose different background tracks (peaceful village music, battle theme).
- **Dependencies**: Coordinate with **Sound Designer** for consistent audio feel.

## 7. Game Logic and Systems
### Resource Management
- **Assigned To**: **Systems Programmer**
- **Tasks**:
  - Implement logic for resource collection, inventory management, and building costs.
- **Dependencies**: Integrate with **HUD** to display real-time metrics.

### Building and Expansion System
- **Assigned To**: **Gameplay Programmer**
- **Tasks**:
  - Develop the structure building mechanics, including resource requirements and progression.
- **Dependencies**: Coordinate with **Systems Programmer** and **AI Programmer** for NPC involvement.

### Tech Tree and Upgrades
- **Assigned To**: **Systems Programmer**
- **Tasks**:
  - Create the technology upgrade paths and implement it into gameplay.
- **Dependencies**: Work with the **UI Designer** to display the tech tree.

## 8. Game Flow and User Experience
### Tutorial
- **Assigned To**: **Gameplay Designer**
- **Tasks**:
  - Develop a step-by-step tutorial to introduce mechanics like resource collection, building, and trading.
- **Dependencies**: Coordinate with **UI Designer** and **Gameplay Programmer** for implementation.

### Quests and Objectives
- **Assigned To**: **Gameplay Writer**
- **Tasks**:
  - Create engaging story-driven quests and objectives that progress the narrative.
- **Dependencies**: Coordinate with **Systems Programmer** for quest triggers.

## 9. Procedural Events and Exploration
### Random Events
- **Assigned To**: **Systems Programmer**
- **Tasks**:
  - Implement random events to make gameplay dynamic, such as surprise attacks or resource drops.
- **Dependencies**: Coordinate with **AI Programmer** for handling NPC responses to these events.

### Fog-of-War Exploration
- **Assigned To**: **Gameplay Programmer**
- **Tasks**:
  - Create fog-of-war mechanics for unexplored areas to encourage exploration.

## 10. Polish and Playtesting
### Playtesting
- **Assigned To**: **Playtest Team** (any available team members)
- **Tasks**:
  - Test different parts of the game, identify bugs, and report issues to relevant programmers.

### Bug Fixing
- **Assigned To**: **All Programmers**
- **Tasks**:
  - Address reported bugs and refine code for smooth performance.

### Balancing and Optimization
- **Assigned To**: **Systems Programmer**
- **Tasks**:
  - Balance resource availability, AI difficulty, and combat for fair yet challenging gameplay.

## 11. Deployment and Submission
### Build Compilation
- **Assigned To**: **Lead Programmer**
- **Tasks**:
  - Compile the game into executable formats (e.g., Windows, Mac, web).

### Testing and Debugging
- **Assigned To**: **Testing Team**
- **Tasks**:
  - Perform platform-specific testing to ensure compatibility.

### Final Submission
- **Assigned To**: **Project Lead**
- **Tasks**:
  - Make sure all assets and files are properly packaged and submitted on time for Ludum Dare.

## Collaboration Tools
- **Version Control**: Use a version control system like **Git** to ensure everyone’s work integrates smoothly.
- **Communication**: Keep everyone connected through **Discord** to streamline coordination.


# Narrative

## Background Story:

The Tiny Realms were once a beautiful, thriving miniature world, filled with different creatures and peaceful communities. But an ancient force, known as the "Gloom," began spreading, turning the vibrant gardens into dark wastelands. The different tribes of Tiny Realms went into isolation, afraid of the Gloom and losing their connection to one another.

You, the newly chosen leader of a small tribe, have been tasked with uniting the scattered tiny tribes and defeating the Gloom. Your journey will involve gaining the trust of neighboring tribes, solving puzzles, and finding a way to restore harmony.
Narrative Arc:

The story unfolds in a series of phases, focused on passive exploration, solving puzzles, and fostering unity without complex resource management.

    The Awakening (Starting Phase)
        Goal: Lead your small tribe through initial explorations and make first contact with other tribes.
        Story Element: Elder Thistle tells you about the Gloom and how it has weakened the world. He encourages you to explore and make contact with other tribes. In this phase, players explore small sections of the map, discovering clues and hints about the neighboring tribes.

    Meeting the Neighbors (Exploration and Diplomacy)
        Goal: Passively interact with neighboring tiny tribes by exploring and helping them solve problems.
        Story Element: Each neighboring tribe has its own fears and concerns. For instance, the Leaf Tribe is dealing with pest infestations, while the Pebble Clan fears the Gloom more than anything. Players solve simple puzzles to help these tribes, like rearranging leaves to clear paths or using light to scare off pests. This phase is focused on passive interaction rather than active resource building.

    The Gloom's Challenges (Puzzle Encounters)
        Goal: As you start uniting tribes, the Gloom sends challenges your way. Players must solve environmental puzzles to keep progressing.
        Story Element: The Gloom, aware of your progress, creates obstacles—dark creatures blocking paths or areas turned into toxic wastelands. Players can overcome these obstacles by solving puzzles. For example, they might need to guide fireflies to light up a dark area or rearrange rocks to create a safe path.

    The Relic Quest (Relic Gathering Phase)
        Goal: Find the relic fragments by solving puzzles and earning the trust of different tribes.
        Story Element: Each tribe has a piece of an ancient relic that can help push back the Gloom. Players need to complete unique puzzles for each tribe to earn their fragment. These could be social puzzles where players must choose the correct dialogue options, or simple environmental puzzles to help fix something in the tribe's area (like helping the Pebble Clan build a bridge by solving a balancing puzzle).

    Unification (Passive Progress Phase)
        Goal: Unify the tribes to activate the relic.
        Story Element: After collecting all the relic fragments, players must unite the tribes. This involves resolving simple conflicts through puzzle-solving. For example, players might need to place symbols representing each tribe in the correct order to show their unity or help mediate disputes by choosing peaceful solutions in dialogue. No complex building or resource gathering—just completing simple, engaging tasks.

    The Final Confrontation (Endgame Puzzle)
        Goal: Use the relic to dispel the Gloom by solving a final series of puzzles.
        Story Element: With the relic reassembled, the final challenge is to solve a multi-stage puzzle that symbolizes the unity of all tribes. Players must match elements from each tribe to bring balance and dispel the Gloom, highlighting the importance of each tribe's unique contributions.

    A New Dawn (Epilogue)
        Goal: Decide how to guide the future of the unified Tiny Realms.
        Story Element: Players are presented with a choice on how to move forward—keeping the tribes semi-independent or uniting them as one federation. The ending varies based on these choices, which players made during their interactions with the tribes.

Character-Driven Storytelling:

    Elder Thistle: The wise elder who introduces you to the history of the Tiny Realms and guides you through each phase, giving advice and hints about solving the puzzles.
    Ambassador Leaf: A cautious but optimistic representative of the Leaf Tribe who serves as a liaison and helps facilitate interactions with other tribes.
    The Gloombringer: The shadowy figure behind the Gloom. Rather than direct combat, players face them through a final series of puzzles that represent overcoming fear and division.

Narrative Choices and Puzzle Integration:

    Environmental Puzzles: Simple puzzles scattered throughout the game, such as arranging items, guiding light sources, or connecting pathways to progress through blocked areas.
    Dialogue Puzzles: When interacting with different tribes, players may face dialogue-based challenges where they must choose the right responses to gain trust or diffuse conflicts.
    Unity Puzzles: As players progress, they must solve puzzles that symbolize unity, such as aligning symbols of each tribe or completing tasks that require combining elements from different tribes.

Themes:

    Unity vs. Division: The core theme is the importance of unity. Bringing together the isolated tribes is key to defeating the Gloom.
    Small Acts, Big Change: Small actions—helping neighbors, solving puzzles—lead to significant outcomes, demonstrating how cooperation can bring about change.
v
