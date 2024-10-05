# Project Plan for "Tiny Realms: Micro Civilizations" (Procedurally Generated Edition)

## 1. Core Mechanics and Level Design
### Map Design
- **Assigned Role**: **Level Designer**
- **Tasks**:
  - Design a large map (2048x2048) with sections that represent various environments for each tribe (e.g., forest for Leaf Tribe, rocky areas for Pebble Clan).
  - Ensure the map is divided into multiple explorable areas, each with unique features.
- **Dependencies**: Need basic tile graphics.

### Exploration and Interaction
- **Assigned Role**: **Gameplay Programmer**
- **Tasks**:
  - Implement a system for player exploration on the large map.
  - Develop mechanisms to unlock areas progressively based on game progression.

### Camera System
- **Assigned Role**: **Gameplay Programmer**
- **Tasks**:
  - Set up the camera system (zoom, pan) to efficiently navigate the large map.

## 2. Procedural Generation
### Procedurally Generated Elements
- **Assigned Role**: **Procedural Content Programmer**
- **Tasks**:
  - Develop a procedural generation system for creating variations in each playthrough:
    - **Tribe Locations**: Procedurally vary the locations of different tribes across the 2048x2048 map.
    - **Puzzle Placement**: Randomize the placement of puzzles in different parts of the map.
    - **Relic Fragment Locations**: Each playthrough should feature different relic fragment locations to keep the game experience fresh.
    - **Dynamic NPC Traits**: Assign different personality traits and needs to tribes based on procedural generation to create variety in interactions.

### Random Events
- **Assigned Role**: **Systems Programmer**
- **Tasks**:
  - Implement random events that add gameplay variety (e.g., sudden Gloom influence, dark creatures appearing).
  - Procedurally vary the type and location of events for each playthrough.

## 3. Puzzle Implementation
### Environmental Puzzles (Procedurally Varying)
- **Assigned Role**: **Puzzle Designer**
- **Tasks**:
  - Design simple puzzles (e.g., arranging items, guiding light sources, moving obstacles) that adapt in difficulty or configuration based on procedural placement.
  - Ensure that puzzles fit within different areas of the map as generated.

### Dialogue and Social Puzzles
- **Assigned Role**: **Gameplay Writer**
- **Tasks**:
  - Create multiple-choice puzzles for social interactions that vary based on the tribe’s procedural characteristics.
  - Write diverse dialogue options to keep encounters fresh and engaging.

### Unity Puzzles
- **Assigned Role**: **Puzzle Designer**
- **Tasks**:
  - Develop puzzles that symbolize unity between tribes, with elements procedurally randomized to ensure variability.
  - Ensure these puzzles require a combination of contributions from different tribes to highlight the theme of cooperation.

## 4. User Interface (UI)
### Title Screen, Settings, and Menus
- **Assigned Role**: **UI Designer**
- **Tasks**:
  - Create visuals for the title screen, settings, new game, and load screens.
  - Coordinate with the **Gameplay Programmer** to ensure seamless UI transitions.

### HUD Development
- **Assigned Role**: **UI Designer**
- **Tasks**:
  - Design a HUD to show player progress, active quests, hints, and interactions.

## 5. Gameplay Mechanics
### NPC Interactions and Dynamic Tribes
- **Assigned Role**: **Gameplay Programmer**
- **Tasks**:
  - Implement a system for NPCs to have procedurally assigned personality traits.
  - Ensure that different tribes have unique interactions or challenges based on their procedural characteristics.

### Relic Collection and Activation
- **Assigned Role**: **Systems Programmer**
- **Tasks**:
  - Develop a system for collecting relic fragments that are distributed procedurally across different tribe locations.
  - Ensure each playthrough features different tasks or challenges for collecting these relic fragments.

## 6. Graphics
### Tilemap Graphics
- **Assigned Role**: **Pixel Artist 1**
- **Tasks**:
  - Create 16x16 tiles for various terrains (e.g., forest, rocky areas, Gloom-affected zones).
- **Dependencies**: Provided to the **Level Designer** and **Procedural Content Programmer**.

### Creature Sprites
- **Assigned Role**: **Pixel Artist 2**
- **Tasks**:
  - Create sprites for different tribes' characters (e.g., Leaf Tribe members, Pebble Clan members).
  - Design unique sprites for key characters like Elder Thistle and Ambassador Leaf.

### Puzzle Elements
- **Assigned Role**: **Pixel Artist 3**
- **Tasks**:
  - Design puzzle-related elements (e.g., movable stones, symbols, light sources).

## 7. Sound and Music
### Sound Effects
- **Assigned Role**: **Sound Designer**
- **Tasks**:
  - Create sound effects for interactions, solving puzzles, and environmental changes.

### Background Music (BGM)
- **Assigned Role**: **Composer**
- **Tasks**:
  - Compose different background tracks for each area (e.g., Leaf Tribe forest music, Pebble Clan theme).
  - Include atmospheric tracks for Gloom-affected areas to enhance immersion.

## 8. Game Logic and Systems
### Puzzle Integration
- **Assigned Role**: **Gameplay Programmer**
- **Tasks**:
  - Integrate the puzzles into the game, ensuring that their procedural placement fits into the map structure.
  - Ensure puzzles trigger appropriate game progression events (e.g., unlocking new areas, receiving relic fragments).

### Progress Tracking
- **Assigned Role**: **Systems Programmer**
- **Tasks**:
  - Develop a system to track player progress, quest completions, and relic fragment collection.
  - Ensure progress tracking adapts to procedural elements.

## 9. Game Flow and User Experience
### Tutorial
- **Assigned Role**: **Gameplay Designer**
- **Tasks**:
  - Develop a brief, adaptive tutorial that introduces exploration, NPC interaction, and puzzle-solving, considering the procedural nature of the world.

### Quests and Objectives
- **Assigned Role**: **Gameplay Writer**
- **Tasks**:
  - Create engaging quests that guide players through puzzles, interactions, and uniting the tribes.
  - Randomize certain quest elements to create different experiences in each playthrough.

## 10. Polish and Playtesting
### Playtesting
- **Assigned Role**: **Playtest Team** (any available team members)
- **Tasks**:
  - Test the game with a focus on procedural variety, ensuring that different playthroughs are unique and bug-free.
  - Report bugs and balancing issues to relevant team members.

### Bug Fixing
- **Assigned Role**: **All Programmers**
- **Tasks**:
  - Address reported bugs and refine code for a smooth experience.

### Balancing and Optimization
- **Assigned Role**: **Systems Programmer**
- **Tasks**:
  - Ensure puzzles are challenging but fair and that procedural elements maintain playability.
  - Optimize the game for consistent performance, even with procedural generation.

## 11. Deployment and Submission
### Build Compilation
- **Assigned Role**: **Lead Programmer**
- **Tasks**:
  - Compile the game into executable formats (e.g., Windows, Mac, web).

### Testing and Debugging
- **Assigned Role**: **Testing Team**
- **Tasks**:
  - Perform platform-specific testing to ensure compatibility.

### Final Submission
- **Assigned Role**: **Project Lead**
- **Tasks**:
  - Ensure all assets and files are properly packaged and submitted on time for Ludum Dare.

## Collaboration Tools
- **Version Control**: Use a version control system like **Git** to ensure everyone’s work integrates smoothly.
- **Communication**: Keep everyone connected through **Discord** to streamline coordination.


# Narrative

## Background Story
The Tiny Realms were once a beautiful, thriving miniature world, filled with different creatures and peaceful communities. But an ancient force, known as the "Gloom," began spreading, turning the vibrant gardens into dark wastelands. The different tribes of Tiny Realms went into isolation, afraid of the Gloom and losing their connection to one another.

You, the newly chosen leader of a small tribe, have been tasked with uniting the scattered tiny tribes and defeating the Gloom. Your journey will involve gaining the trust of neighboring tribes, solving puzzles, and finding a way to restore harmony.

## Narrative Arc
The story unfolds in a series of phases, focused on passive exploration, solving puzzles, and fostering unity without complex resource management.

### The Awakening (Starting Phase)
- **Goal**: Lead your small tribe through initial explorations and make first contact with other tribes.
- **Story Element**: Elder Thistle tells you about the Gloom and how it has weakened the world. He encourages you to explore and make contact with other tribes. In this phase, players explore small sections of the map, discovering clues and hints about the neighboring tribes.

### Meeting the Neighbors (Exploration and Diplomacy)
- **Goal**: Passively interact with neighboring tiny tribes by exploring and helping them solve problems.
- **Story Element**: Each neighboring tribe has its own fears and concerns. For instance, the Leaf Tribe is dealing with pest infestations, while the Pebble Clan fears the Gloom more than anything. Players solve simple puzzles to help these tribes, like rearranging leaves to clear paths or using light to scare off pests. This phase is focused on passive interaction rather than active resource building.

### The Gloom's Challenges (Puzzle Encounters)
- **Goal**: As you start uniting tribes, the Gloom sends challenges your way. Players must solve environmental puzzles to keep progressing.
- **Story Element**: The Gloom, aware of your progress, creates obstacles—dark creatures blocking paths or areas turned into toxic wastelands. Players can overcome these obstacles by solving puzzles. For example, they might need to guide fireflies to light up a dark area or rearrange rocks to create a safe path.

### The Relic Quest (Relic Gathering Phase)
- **Goal**: Find the relic fragments by solving puzzles and earning the trust of different tribes.
- **Story Element**: Each tribe has a piece of an ancient relic that can help push back the Gloom. Players need to complete unique puzzles for each tribe to earn their fragment. These could be social puzzles where players must choose the correct dialogue options, or simple environmental puzzles to help fix something in the tribe's area (like helping the Pebble Clan build a bridge by solving a balancing puzzle).

### Unification (Passive Progress Phase)
- **Goal**: Unify the tribes to activate the relic.
- **Story Element**: After collecting all the relic fragments, players must unite the tribes. This involves resolving simple conflicts through puzzle-solving. For example, players might need to place symbols representing each tribe in the correct order to show their unity or help mediate disputes by choosing peaceful solutions in dialogue. No complex building or resource gathering—just completing simple, engaging tasks.

### The Final Confrontation (Endgame Puzzle)
- **Goal**: Use the relic to dispel the Gloom by solving a final series of puzzles.
- **Story Element**: With the relic reassembled, the final challenge is to solve a multi-stage puzzle that symbolizes the unity of all tribes. Players must match elements from each tribe to bring balance and dispel the Gloom, highlighting the importance of each tribe's unique contributions.

### A New Dawn (Epilogue)
- **Goal**: Decide how to guide the future of the unified Tiny Realms.
- **Story Element**: Players are presented with a choice on how to move forward—keeping the tribes semi-independent or uniting them as one federation. The ending varies based on these choices, which players made during their interactions with the tribes.

## Character-Driven Storytelling
- **Elder Thistle**: The wise elder who introduces you to the history of the Tiny Realms and guides you through each phase, giving advice and hints about solving the puzzles.
- **Ambassador Leaf**: A cautious but optimistic representative of the Leaf Tribe who serves as a liaison and helps facilitate interactions with other tribes.
- **The Gloombringer**: The shadowy figure behind the Gloom. Rather than direct combat, players face them through a final series of puzzles that represent overcoming fear and division.

## Narrative Choices and Puzzle Integration
- **Environmental Puzzles**: Simple puzzles scattered throughout the game, such as arranging items, guiding light sources, or connecting pathways to progress through blocked areas.
- **Dialogue Puzzles**: When interacting with different tribes, players may face dialogue-based challenges where they must choose the right responses to gain trust or diffuse conflicts.
- **Unity Puzzles**: As players progress, they must solve puzzles that symbolize unity, such as aligning symbols of each tribe or completing tasks that require combining elements from different tribes.

## Themes
- **Unity vs. Division**: The core theme is the importance of unity. Bringing together the isolated tribes is key to defeating the Gloom.
- **Small Acts, Big Change**: Small actions—helping neighbors, solving puzzles—lead to significant outcomes, demonstrating how cooperation can bring about change.
