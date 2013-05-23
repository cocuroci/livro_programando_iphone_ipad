//
//  Livro.h
//  BookObjectOriented
//
//  Created by André Cocuroci on 22/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Livro : NSObject
{
@private;
    NSString *titulo;
    NSString *autor;
    NSString *codigoIsbn;    
    int numeroDePagina;
    int anoDeLancamento;
    BOOL disponivel;
}

-(Livro *)initWithTitulo:(NSString *)pTitulo autor:(NSString *)pAutor;

-(NSString *)getTitulo;
-(NSString *)getAutor;
-(NSString *)getCodigoIsbn;
-(int)getNumeroDePaginas;
-(int)getAnoDeLancamento;

-(void)setTitulo:(NSString *)pTitulo;
-(void)setAutor:(NSString *)pAutor;
-(void)setCodigoIsbn:(NSString *)pCodigoIsbn;
-(void)setNumeroDePaginas:(int)pNumeroDePaginas;
-(void)setAnoDeLancamento:(int)pAnoDeLancamento;

-(BOOL)isDisponivel;

-(void)log;
-(void)salvar;
-(void)selecionar;
-(void)excluir;
-(void)renovarEmprestimoPorMaisDias:(int)dias;
-(void)emprestarPara:(NSString *)usuario dataDeDevolucao:(NSString *)data;

@end
