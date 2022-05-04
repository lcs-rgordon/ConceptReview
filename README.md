# Concept Review

This project contains example apps that take their primary input from a variety of sources.

## Input by User Action

### Noughts and Crosses

![image alt text](noughts-and-crosses.png)

*Noughts and Crosses*, also known as "x's and o's", generates data entirely from [user actions that trigger events](x-source-tag://user_action).

Sequence and selection statements are used to detect a [winning condition](x-source-tag://winning_condition) – three of the same symbol in a row, column, or diagonal. If nine turns occur and neither player's moves triggers a winning condition, a draw is obtained.

Abstraction is used through the [`TileView` structure](x-source-tag://tile_view) – this helps to manage complexity as the same logic would otherwise be completely repeated nine times within `GameBoardView`. Instead, the logic for a tile is *defined* once and simply *called* nine times from [`GameBoardView`](x-source-tag://game_board). As a result, overall project code length is significantly reduced.

When a game is completed, the [result is added to a list](x-source-tag://adding_to_list) that tracks the history of games played. This list is then displayed to the user in the History section of the user interface.

