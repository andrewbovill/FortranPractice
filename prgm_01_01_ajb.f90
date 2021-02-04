      Program prgm_01_01

      implicit none
      integer :: i,j
      real:: a1,a2,a3
      ! A is printed out 3x3 matrix from 'input_01_01.txt'
      character(len=256)::fileName
      logical::fileExist

      fileName="input_01_01.txt"
      
      open(unit=20, file="input01_01.txt")
      INQUIRE(FILE=fileName, EXIST=fileExist)

      if(fileExist.eqv..true.) then
        write(*,*)"Creating 3x3 Matrix from: input_01_01.txt"
      else
        write(*,*)"You do not have 'input_01_01.txt' in your directory"
      end if


      open(unit = 1, file = fileName)
        do i = 1,3
          read(1,*) a1,a2,a3
          write(*,*)a1,a2,a3
      enddo


      End Program prgm_01_01

