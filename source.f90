!
! this subroutine sets the value for the source term of the discrete equation
!
subroutine source(b,dpdx,delx,ib,ie,id)
    real dpdx,delx(id),b(id)
    real ib,ie
    ib = 2
    do 10 i=ib,ie
        b(i)=dpdx*delx(i)
!        print*,b(i)
 10 continue
end subroutine source