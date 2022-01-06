!
! this is the mainline code for a laminar channel flow.
! this code is just to test the coding ability
program lamflow
    real ncv,id,ib,ie
    real mu,dpdx,den
    real an(100),as(100),ap(100),b(100)
    real delx(100),xp(100)
    real u(100),un(100),us(100)
    real uold(100)
    open (unit = 24, file = 'output.dat', status = 'replace', form = 'formatted')
!
! define the variables
    h = 0.03
    dpdx = 0.1
    ncv = 30
    id = 100
    ib = 2
    ie = ncv+1 
    mu = 0.00018
    den = 1.12
    nu = mu/den
    uinit = 3.0
    do 12 i=1,32
        uold(i) = uinit
!        print*,uold(i)
 12 continue
! this subroutine creates a uniform grid for the channel    
    call grid(h,ncv,xp,delx)
    call bcond(ap,as,an,b,ib,ie,id)
    call coef(mu,delx,an,as,ap,ib,ie,id)
    call source(b,dpdx,delx,ib,ie,id)
    do 10 i=1,10000
    call solver(an,as,ap,b,u,un,us,&
                uold,delx,ib,ie,id)
 10 continue
    write(24,100)
    do i=ib,ie
        write(24,110) i,xp(i),u(i)
    end do
    100 format('',/,'Final Solution Fields: ',//,5X,'    I  ',4X,'      y  '&
               ,3X,'      Velocity   ')
    110 format('',5X,I5,2(3X,E14.7))
end program lamflow
