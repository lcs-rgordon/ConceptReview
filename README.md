# Concept Review

This project contains example apps that take their primary input from a variety of sources.

Be sure to review the `README` files within each project for a guided summary.

## Input Mode

### User Action

*Noughts and Crosses*, also known as "x's and o's", generates data entirely from user actions that trigger events.

When a winning condition is detected – three of the same sign in a row, column, or diagonal – the game is won. If nine turns occur and neither player's moves triggers a winning condition, a draw is obtained.

Abstraction is used through the `TileView` structure – this helps to manage complexity as the same code would otherwise be completely repeated nine times within `GameBoardView`.

Instead, the logic for a tile is defined once and simply called nine times from [`GameBoardView`](x-source-tag://game_board). Overall project code length is significantly reduced as a result.

A list is used to store a history of results when the game is played. 

Sequence and selection are employed to check for winning conditions.
