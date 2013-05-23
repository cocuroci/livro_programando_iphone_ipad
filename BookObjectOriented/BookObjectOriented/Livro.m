//
//  Livro.m
//  BookObjectOriented
//
//  Created by André Cocuroci on 22/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "Livro.h"

@implementation Livro

-(Livro *)initWithTitulo:(NSString *)pTitulo autor:(NSString *)pAutor
{
    self = [super init];
    
    if(self){
        [self setTitulo:pTitulo];
        [self setAutor:pAutor];
    }
    
    return self;
}

-(void)log
{
    
}

-(void)salvar
{
    
}

-(void)selecionar
{
    
}

-(void)excluir
{
    
}

-(void)renovarEmprestimoPorMaisDias:(int)dias
{
    
}

-(void)emprestarPara:(NSString *)usuario dataDeDevolucao:(NSString *)data
{
    
}

-(NSString *)getTitulo
{
    return self->titulo;
}

-(NSString *)getAutor
{
    return self->autor;
}

-(NSString *)getCodigoIsbn
{
    return self->codigoIsbn;
}

-(int)getNumeroDePaginas
{
    return self->numeroDePagina;
}

-(int)getAnoDeLancamento
{
    return self->anoDeLancamento;
}

-(void)setTitulo:(NSString *)pTitulo
{
    self->titulo = [pTitulo substringFromIndex:20];
}

-(void)setAutor:(NSString *)pAutor
{
    self->autor = pAutor;
}

-(void)setCodigoIsbn:(NSString *)pCodigoIsbn
{
    self->codigoIsbn = pCodigoIsbn;
}

-(void)setNumeroDePaginas:(int)pNumeroDePaginas
{
    self->numeroDePagina = pNumeroDePaginas;
}

-(void)setAnoDeLancamento:(int)pAnoDeLancamento
{
    self->anoDeLancamento = pAnoDeLancamento;
}

-(BOOL)isDisponivel
{
    return self->disponivel;
}

@end
