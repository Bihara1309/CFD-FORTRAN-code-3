!
! this subroutine is a gauss seidel solver for the laminar flow discrete equations
!
subroutine solver(an,as,ap,b,u,un,us,uold,delx,ib,ie,id)
    real u(id),un(id),us(id),uold(id),b(id)
    real an(id),as(id),ap(id),delx(id)
    real ib,ie
    ibm1 = ib-1
    iep1 = ie+1
    u(ibm1) = as(ibm1)*uold(ib)+b(ibm1)
!    print*,u(ibm1)
    do 10 i=ib,ie
        u(i)=(1/ap(i))*((an(i)*uold(i+1))+(as(i)*u(i-1))+b(i))
!        print*,u(i)
 10 continue
        u(iep1) = an(iep1)*uold(ie)+b(iep1)
!        print*,u(iep1)
    do 11 i=ibm1,iep1
        uold(i)=u(i)
 11 continue
end subroutine solver