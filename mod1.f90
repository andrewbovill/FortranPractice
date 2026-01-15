      Program moduleExample_1
!     This is an example program demonstrating some uses of modules.

      implicit none
      integer,parameter::nDimensions=3
      real,dimension(3,3)::matrixA,matrixB,matrixC
!
!     Fill matrixA and matrixB with random numbers.      
!     hello
      call random_number(matrixA)
      call random_number(matrixB)
      write(*,*)' Matrix A:'
      write(*,*) matrixA
      write(*,*) 'Here is Matrix A:'
      call print_matrix(nDimensions,matrixA)
      write(*,*) 'Here is Matrix B:'
      call print_matrix(nDimensions,matrixB)

      End Program moduleExample_1

      Subroutine print_matrix(nDimension,matrix)
!
!     This subroutine prints a matrix
!
      implicit none
      integer,intent(in)::nDimension
      real,dimension(nDimension,nDimension)::matrix
      integer::i
!
!     print the matrix.
!
 1000 Format(f10.5,1x,f10.5,1x,f10.5,1x,f10.5,1x,f10.5,1x,f10.5)
      do i = 1,nDimension
        write(*,1000) matrix(i,:)
      enddo

      return
      End Subroutine print_matrix
