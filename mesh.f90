!
! this subroutine creates a mesh of equal distance
!
Subroutine grid(h,ncv,xp,delx)
    real xp(100),delx(100),h
    real ncv
! defining the variables
    ib = 2
    ie = ncv+1
    ibm1 = ib-1
    iep1 = ie+1
    xp(ibm1) = -0.0005
    do 10 i=ib,iep1
        delx(i)=0.001
        xp(i)=xp(i-1)+delx(i)
      !  print*,xp(i)
 10 continue   
end subroutine grid
