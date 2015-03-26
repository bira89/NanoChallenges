//
//  ElementsViewController.m
//  Jogo da Velha
//
//  Created by Bira on 23/03/15.
//  Copyright (c) 2015 Senac. All rights reserved.
//

#import "ElementsViewController.h"

@interface ElementsViewController ()
{
    int matriz[3][3];
}

@property (nonatomic) int currentPlayerIndex;

@property (nonatomic, copy) NSArray *player;
@property (nonatomic, copy) NSArray *imageButtons;
@property (weak, nonatomic) IBOutlet UILabel *vencedor;

@property (weak, nonatomic) IBOutlet UIImageView *playerX;
@property (weak, nonatomic) IBOutlet UIImageView *playerO;
@property (weak, nonatomic) IBOutlet UIButton *again;
@property (weak, nonatomic) IBOutlet UIButton *area0;
@property (weak, nonatomic) IBOutlet UIButton *area1;
@property (weak, nonatomic) IBOutlet UIButton *area2;
@property (weak, nonatomic) IBOutlet UIButton *area3;
@property (weak, nonatomic) IBOutlet UIButton *area4;
@property (weak, nonatomic) IBOutlet UIButton *area5;
@property (weak, nonatomic) IBOutlet UIButton *area6;
@property (weak, nonatomic) IBOutlet UIButton *area7;
@property (weak, nonatomic) IBOutlet UIButton *area8;


@end

@implementation ElementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *new = [UIImage imageNamed:@"empty.png"];
    UIImage *newX = [UIImage imageNamed:@"imageX.png"];
    UIImage *newO = [UIImage imageNamed:@"imageO.png"];
    self.imageButtons = @[new, newO, newX];
    [self.playerX setImage:newX];
    [self.playerO setImage:newO];
}

- (void) didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
//    UIImage *new = [UIImage imageNamed:@"nil.png"];
//    UIImage *newX = [UIImage imageNamed:@"imageO.png"];
//    UIImage *newO = [UIImage imageNamed:@"imageX.png"];
//    self.imageButtons = @[new, newO, newX];
//    [self.playerX setImage:newX];
//    [self.playerO setImage:newO];
    
    for (int i = 0; i < 3; i++)
        for ( int j = 0; j < 3; j++)
            matriz[i][j] = 0;
    
    _currentPlayerIndex = 1;
    
    return self;
}

- (IBAction)resetGame:(id)sender {
    
    [self.area0 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    [self.area1 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    [self.area2 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    [self.area3 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    [self.area4 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    [self.area5 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    [self.area6 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    [self.area7 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    [self.area8 setImage:[self.imageButtons objectAtIndex:0] forState:UIControlStateNormal];
    
//    Zera a matriz
    for (int i=0; i<3; i++) {
        for ( int j = 0; j < 3; j++){
            matriz[i][j] = 0;
        }
    }
    
}

- (IBAction)area0:(id)sender
{
    if (matriz[0][0] == 0){
        matriz[0][0] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area0 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex]forState:UIControlStateNormal];
    }
 
    [self verMatriz];
    
//        [self condicaoVitoria];
    

    [self verMatriz];

}


- (IBAction)area1:(id)sender
{
    if (matriz[0][1] == 0){
        matriz[0][1] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area1 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
//    [self condicaoVitoria];
    
    
    

 

}

- (IBAction)area2:(id)sender
{
    if (matriz[0][2] == 0){
        matriz[0][2] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area2 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
//        [self condicaoVitoria];
    
}

- (IBAction)area3:(id)sender
{
    if (matriz[1][0] == 0){
        matriz[1][0] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area3 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
//        [self condicaoVitoria];
    


}

- (IBAction)area4:(id)sender
{
    if (matriz[1][1] == 0){
        matriz[1][1] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area4 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
//        [self condicaoVitoria];
    


}

- (IBAction)area5:(id)sender
{
    if (matriz[1][2] == 0){
        matriz[1][2] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area5 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }
    
//        [self condicaoVitoria];
    
}

- (IBAction)area6:(id)sender
{
    if (matriz[2][0] == 0){
        matriz[2][0] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area6 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    /*
    if (_currentPlayerIndex == 1){
        matriz[2][0] = 1;
    } else {
        matriz[2][0] = 2;
    }
     */
    
//        [self condicaoVitoria];

}

- (IBAction)area7:(id)sender
{
    if (matriz[2][1] == 0){
        matriz[2][1] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area7 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
    /*
    if (_currentPlayerIndex == 1){
        matriz[2][1] = 1;
    } else {
        matriz[2][1] = 2;
    }
     */
    
//        [self condicaoVitoria];
    
    


}

- (IBAction)area8:(id)sender
{
    if (matriz[2][2] == 0){
        matriz[2][2] = _currentPlayerIndex == 1 ? 1 : 2;
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area8 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
//        [self condicaoVitoria];
    


}

- (void) verMatriz
{
    for (int i = 0; i < 3; i++){
        NSLog(@"%d %d %d ", matriz[i][0], matriz[i][1], matriz[i][2]);
    }
    NSLog(@"Fim Matriz");
}

- (void) verGanhador
{
    int fimd1=0, fimd2=0, contd=2;
    for (int i = 0; i < 3; i++) {
        int l=i, c=i, fiml=0, fimc=0;
        for (int j = 0; j < 3; j++) {
            fiml += matriz[l][j];
            fimc += matriz[j][c];
        }
        fimd1 += matriz[l][c];
        fimd2 += matriz[l][contd];
        contd--;
        
        if(fiml==3){ NSLog(@"Jogador X ganhou na linha: %d",l); return;}
        if(fiml==6){ NSLog(@"Jogador O ganhou na linha: %d",l); return;}
        if(fimc==3){ NSLog(@"Jogador X ganhou na coluna: %d",c); return;}
        if(fimc==6){ NSLog(@"Jogador O ganhou na coluna: %d",c); return;}

    }
    
    if(fimd1==3){ NSLog(@"Jogador X ganhou na diagonal principal"); return;}
    if(fimd1==6){ NSLog(@"Jogador O ganhou na diagonal principal"); return;}
    if(fimd2==3){ NSLog(@"Jogador X ganhou na diagonal secundária"); return;}
    if(fimd2==6){ NSLog(@"Jogador O ganhou na diagonal secundária"); return;}    
}

- (int) mudarJogador:(int) jogadorAtual
{
    
    jogadorAtual = jogadorAtual == 1  ? 2 : 1;

    return jogadorAtual;
}



- (void) condicaoVitoria
{
    BOOL ganhou = false;
    
    NSLog(@"%d", _currentPlayerIndex);
    
    // Verificacao Linhas
    for( int i = 0; i < 3; i++){
        if ((matriz[i][0] == _currentPlayerIndex) && (matriz[i][1] == _currentPlayerIndex) && (matriz[i][2] == _currentPlayerIndex)){
            ganhou = true;
            [self.vencedor setText:[NSString stringWithFormat:@"Jogador %d ganhou!", _currentPlayerIndex ]];
            return;
        }
    }
//            [NSString stringWithFormat:@"<%@: %d unassigned>", self.label, self.resaleValue];
    


}

@end
