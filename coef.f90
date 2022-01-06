! this subroutine creates the coefficients of the discrete equations
!
subroutine coef(mu,delx,an,as,ap,ib,ie,id)
    real mu,delx(id)
    real an(id),as(id),ap(id)
    real ib,ie
    do 10 i=ib,ie
        an(i)=mu/delx(i)
        as(i)=mu/delx(i)
        ap(i)=an(i)+as(i)
      !  print*,i,an(i),as(i),ap(i)
 10 continue
end subroutine coef