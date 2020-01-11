NB. lapack validation
NB.
NB. validation routines that check argument is a matrix:
NB.    vmatrix
NB.    vhermitian
NB.    vorthogonal
NB.    vsquare
NB.    vsymposdef
NB.
NB. validation routines that check argument is either
NB. a matrix or vector:
NB.    vmatrixorvector

iscomplex=: -. @ (-: +)
isvector=: 1: = #@$
ismatrix=: 2: = #@$
ismatrixorvector=: 1 2 e.~ #@$
isreal=: -: +
issquare=: =/ @ $
ishermitian=: -: +@|:

NB. =========================================================
isorthogonal=: 3 : 0
q=. y mp |: y
*./ 0 = clean ,q - idmat $q
)

NB. =========================================================
issymposdef=: 3 : 0
if. 0==/$y do. 0 return. end.
y-:|:y
)

NB. =========================================================
NB. f=. 2 : 'm&(13!:8)@(#&12)@(0 e. v)'
NB. 
NB. vmatrix=: 'argument should be a matrix' f ismatrix
NB. vmatrixorvector=: 'argument should be either a matrix or vector' f ismatrixorvector
NB. vhermitian=: 'argument should be a hermitian matrix' f ishermitian [ vmatrix
NB. vorthogonal=: 'argument should be an orthogonal matrix' f isorthogonal [ vmatrix
NB. vsquare=: 'argument should be a square matrix' f issquare [ vmatrix
NB. vsymposdef=: 'argument should be a symmetric positive-definite matrix' f issymposdef [ vmatrix
