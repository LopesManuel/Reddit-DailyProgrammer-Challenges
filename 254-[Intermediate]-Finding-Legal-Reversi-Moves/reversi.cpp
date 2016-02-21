/**---------------------------------------------------------------------------------------**
 [2016-02-21] Challenge #254 [Intermediate] Finding Legal Reversi Moves
 https://www.reddit.com/r/dailyprogrammer/comments/468pvf/20160217_challenge_254_intermediate_finding_legal/
 
 Find all valid moves on a board in Othello (Reversi).
 https://github.com/LopesManuel/Reddit-DailyProgrammer-Challenges/blob/master/254-%5BIntermediate%5D-Finding-Legal-Reversi-Moves/reversi.cpp
 Manuel Lopes 2/20/2016
**---------------------------------------------------------------------------------------**/

#include <algorithm>
#include <iostream>
#include <vector>
#include <ctime>

std::string board;
int board_side = 8;

struct position{
  int x;
  int y;  
};
//Used to save player positions
std::vector<position> P_positions;

inline int get_pos(int ROW, int COL)
{
  return (board_side) * (ROW) + (COL);
}

void print_board(char player, int moves_count);
void get_possible_moves(char &player, char &enemy);

int main( int argc, char **argv ) {
      clock_t begin = clock();
    //Check if it has a different board side 
    if( argv[1] != NULL){
        board_side = atoi(argv[1]); 
    } 
    //Read Player symbol 
    char player = std::cin.get();
    char enemy;
    player == 'X' ? enemy = 'O' : enemy = 'X';
    //Read board
    char tChar; position temp;
    for ( int i = 0; i < board_side; ++i ) {
        for ( int j = 0; j < board_side; ++j ) {
            std::cin >> tChar;
            board += tChar;
            //if it's a player symbol save it's position   
            if(tChar == player){
                temp.x = i; temp.y = j;
                P_positions.push_back(temp);
            }
        }
    }
    get_possible_moves(player,enemy);
     clock_t end = clock();
    double elapsed_secs = double(end - begin) / CLOCKS_PER_SEC;
    std::cout <<"Time:" << elapsed_secs << std::endl; 
}

/** Checks for possible moves **/
void get_possible_moves(char &player, char &enemy){
    int p_moves_count = 0;
    //positions to check for available moves
    position neighbours[] = {{-1,-1},{0,-1},{1,-1},
                             {-1, 0},       {1, 0},
                             {-1, 1},{0, 1},{1, 1}};
    for(int i = 0; i < P_positions.size(); i++){
        for (position pos : neighbours){
            int pos_in_board = get_pos(pos.x + P_positions[i].x, pos.y + P_positions[i].y );
            //Check if neighboor is an enemy
            if( board[pos_in_board] == enemy){
                int jumps = 2;
                int possible_move = get_pos(pos.x*jumps + P_positions[i].x, pos.y*jumps + P_positions[i].y );
                if( possible_move >= 0 && possible_move < board_side*board_side){
                    //If it's an enemy then get free position to jump to
                    while( board[possible_move] == enemy){
                        jumps++;
                        possible_move = get_pos(pos.x*jumps + P_positions[i].x, pos.y*jumps + P_positions[i].y );
                    }
                    if( board[possible_move] == '-'){
                        board[possible_move] = '*';
                        p_moves_count++;
                    }
                }
            }
        }
    } 
    print_board(player, p_moves_count);
}

/** Prints legal moves and the game board **/
void print_board(char player, int moves_count){
    std::cout << moves_count <<" legal moves for " << player<<std::endl; 
    for ( int i = 0; i < board.length(); i++){
        std::cout << board[i];
        if((i+1) % board_side == 0){
           std::cout << std::endl; 
        }   
    }

}