//
//  ElementsViewController.m
//  Jogo da Velha
//
//  Created by Bira on 23/03/15.
//  Copyright (c) 2015 Senac. All rights reserved.
//

#import "ElementsViewController.h"
#import "SoundManager.h"
#import <QuartzCore/QuartzCore.h>

@interface ElementsViewController ()
{
    int matriz[3][3];
}
@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic) int currentPlayerIndex;
@property (nonatomic) int pontuacao1;
@property (nonatomic) int pontuacao2;

@property (nonatomic, copy) NSArray *player;
@property (nonatomic, copy) NSArray *imageButtons;
@property (nonatomic, copy) NSArray *linhas;
@property (weak, nonatomic) IBOutlet UILabel *vencedor;
@property (weak, nonatomic) IBOutlet UIImageView *traco;
@property (weak, nonatomic) IBOutlet UILabel *pontos1;
@property (weak, nonatomic) IBOutlet UILabel *pontos2;

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
    UIImage *newX2 = [UIImage imageNamed:@"imageX2.png"];
    UIImage *newO = [UIImage imageNamed:@"imageO.png"];
    UIImage *newO2 = [UIImage imageNamed:@"imageO2.png"];
    UIImage *traco1 = [UIImage imageNamed:@"traco1.png"];
    UIImage *traco2 = [UIImage imageNamed:@"traco2.png"];
    UIImage *traco3 = [UIImage imageNamed:@"traco3.png"];
    UIImage *traco4 = [UIImage imageNamed:@"traco4.png"];
    UIImage *traco5 = [UIImage imageNamed:@"traco5.png"];
    UIImage *traco6 = [UIImage imageNamed:@"traco6.png"];
    UIImage *traco7 = [UIImage imageNamed:@"traco7.png"];
    UIImage *traco8 = [UIImage imageNamed:@"traco8.png"];
    self.linhas = @[traco1, traco2, traco3, traco4, traco5, traco6, traco7, traco8];
    self.imageButtons = @[new, newO, newX];
    self.player = @[newX, newX2, newO, newO2];
    [self.playerX setImage:newX2];
    [self.playerO setImage:newO];
    
    
    [SoundManager sharedManager].allowsBackgroundMusic = YES;
    [[SoundManager sharedManager] prepareToPlay];
    
    [[SoundManager sharedManager] playMusic:@"background.wav" looping:YES];
    
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
    _pontuacao1 = 0;
    _pontuacao2 = 0;
    
    
    return self;
}

- (IBAction)resetGame:(id)sender {
    
    
    //[_view.layer removeAllAnimations];
    
    
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
    
    self.traco.hidden = true;

    [self.vencedor setText:[NSString stringWithFormat:@""]];
    
    
    
    
    
}

- (IBAction)area0:(id)sender
{
    
   
    if (matriz[0][0] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];

        
        matriz[0][0] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area0 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex]forState:UIControlStateNormal];
    }
 

    
    [self verMatriz];
    


}


- (IBAction)area1:(id)sender
{
    if (matriz[0][1] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];
        matriz[0][1] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area1 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
    
    
    

 

}

- (IBAction)area2:(id)sender
{
    if (matriz[0][2] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];
        matriz[0][2] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area2 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
    
}

- (IBAction)area3:(id)sender
{
    if (matriz[1][0] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];
        matriz[1][0] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area3 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
    


}

- (IBAction)area4:(id)sender
{
    if (matriz[1][1] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];
        matriz[1][1] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area4 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
    


}

- (IBAction)area5:(id)sender
{
    if (matriz[1][2] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];
        matriz[1][2] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area5 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }
    
    
}

- (IBAction)area6:(id)sender
{
    if (matriz[2][0] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];
        matriz[2][0] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
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
    

}

- (IBAction)area7:(id)sender
{
    if (matriz[2][1] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];
        matriz[2][1] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area7 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

}

- (IBAction)area8:(id)sender
{
    if (matriz[2][2] == 0){
        [[SoundManager sharedManager] playSound:@"jogada.wav" looping:NO];
        matriz[2][2] = _currentPlayerIndex == 1 ? 1 : 2;
        [self condicaoVitoria];
        _currentPlayerIndex = [self mudarJogador:_currentPlayerIndex];
        [self.area8 setImage:[self.imageButtons objectAtIndex:_currentPlayerIndex] forState:UIControlStateNormal];
    }

    
    


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
    if(jogadorAtual==1){
        [self.playerX setImage: [self.player objectAtIndex: jogadorAtual]];
        [self.playerO setImage: [self.player objectAtIndex: jogadorAtual+1]];
    }
    if (jogadorAtual==2) {
        [self.playerX setImage: [self.player objectAtIndex: jogadorAtual-2]];
        [self.playerO setImage: [self.player objectAtIndex: jogadorAtual+1]];
    }

    return jogadorAtual;
}

-(void) atualizaPontos
{
    UIColor *colorGanhador =[UIColor redColor];
    UIColor *colorEmpate =[UIColor blackColor];

    if(self.currentPlayerIndex==1){
        self.pontuacao1 += 1;
        NSString *pont1 = [NSString stringWithFormat:@"%d", self.pontuacao1];
        [self.pontos1 setText: pont1];
    }else{
        self.pontuacao2 += 1;
        NSString *pont2 = [NSString stringWithFormat:@"%d", self.pontuacao2];
        [self.pontos2 setText: pont2];
    }
    if(self.pontuacao1==self.pontuacao2){
        [self.pontos1 setTextColor: colorEmpate];
        [self.pontos2 setTextColor: colorEmpate];
    }
    else if(self.pontuacao1 > self.pontuacao2){
        [self.pontos1 setTextColor:colorGanhador];
        [self.pontos2 setTextColor:colorEmpate];
    }else {
        [self.pontos1 setTextColor:colorEmpate];
        [self.pontos2 setTextColor:colorGanhador];
    }
}

- (void) condicaoVitoria
{
    BOOL ganhou = false;
    
    NSLog(@"%d", _currentPlayerIndex);
    
    for( int i = 0; i < 3; i++){
        // Verificacao Linhas
        if ((matriz[i][0] == _currentPlayerIndex) && (matriz[i][1] == _currentPlayerIndex) && (matriz[i][2] == _currentPlayerIndex)){
            ganhou = true;
            self.traco.hidden = false;
            [self.traco setImage:self.linhas[i+3]];
            [self.vencedor setText:[NSString stringWithFormat:@"Jogador %d ganhou!", _currentPlayerIndex ]];
            [self atualizaPontos];
            
            [UIView animateWithDuration:1.0
                                  delay:0
                                options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionAllowUserInteraction)
                             animations:^{
                                 
                                 _again.alpha = 0.05;
                             }
                             completion:^(BOOL completed) {}];

            

            return;
        }
        
        
        // Coluna
        if ((matriz[0][i] == _currentPlayerIndex) && (matriz[1][i] == _currentPlayerIndex) && (matriz[2][i] == _currentPlayerIndex)){
            ganhou = true;
            [self.vencedor setText:[NSString stringWithFormat:@"Jogador %d ganhou!", _currentPlayerIndex ]];
            self.traco.hidden = false;
            [self.traco setImage:self.linhas[i]];
            [self atualizaPontos];
            [UIView animateWithDuration:1.0
                                  delay:0
                                options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionAllowUserInteraction)
                             animations:^{
                                 
                                 _again.alpha = 0.05;
                             }
                             completion:^(BOOL completed) {}];
            
            return;
        }
        
    }
    
    // Diagonal Primaria
    if ((matriz[0][0] == _currentPlayerIndex) && (matriz[1][1] == _currentPlayerIndex) && (matriz[2][2] == _currentPlayerIndex)){
        ganhou = true;
        [self.vencedor setText:[NSString stringWithFormat:@"Jogador %d ganhou!", _currentPlayerIndex ]];
        self.traco.hidden = false;
        [self.traco setImage:self.linhas[7]];
        [self atualizaPontos];
        [UIView animateWithDuration:1.0
                              delay:0
                            options: UIViewAnimationOptionAllowUserInteraction   |
                                    UIViewAnimationOptionRepeat |
                                    UIViewAnimationOptionAutoreverse
                         animations:^{
                             
                             _again.alpha = 0.08;
                         }
                         completion:^(BOOL completed) {}];
        return;
    }
    
    // Diagonal Secundaria
    if ((matriz[0][2] == _currentPlayerIndex) && (matriz[1][1] == _currentPlayerIndex) && (matriz[2][0] == _currentPlayerIndex)){
        ganhou = true;
        self.traco.hidden = false;
        [self.traco setImage:self.linhas[6]];
        [self.vencedor setText:[NSString stringWithFormat:@"Jogador %d ganhou!", _currentPlayerIndex ]];
        [self atualizaPontos];
        [UIView animateWithDuration:1.0
                              delay:0
                            options: UIViewAnimationOptionAllowUserInteraction   |
         UIViewAnimationOptionRepeat |
         
         UIViewAnimationOptionAutoreverse
                         animations:^{
                             
                             _again.alpha = 0.08;
                         }
                         completion:^(BOOL completed) {}];
        return;
    }
    
    bool velha = true;
    for (int i = 0; i < 3; i++)
        for(int j = 0; j < 3; j++)
            if (matriz[i][j] == 0)
                velha = false;
            
        
    if (velha){
        [self.vencedor setText:[NSString stringWithFormat:@"Deu velha!"]];
        [UIView animateWithDuration:1.0
                              delay:0
                            options: UIViewAnimationOptionAllowUserInteraction   |
         UIViewAnimationOptionRepeat |
         
         UIViewAnimationOptionAutoreverse
                         animations:^{
                             
                             _again.alpha = 0.08;
                         }
                         completion:^(BOOL completed) {}];
        
    }
    
    
   
    
}
    
    
    
//            [NSString stringWithFormat:@"<%@: %d unassigned>", self.label, self.resaleValue];
    


@end
