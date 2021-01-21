      include 'linkedListMod.f03' 
      program linkList00
      use linkedListmod
!
!     This is a linked-list program based on the one in Chapman(see Figure)
!     15-14).
!
!     Defined Derived types
!
      implicit none 
!
      type(real_value),pointer:: head
      character(len=256)::filename
      integer::nvals=0
      type(real_value),pointer::ptr
      type(real_value),pointer::tail
      integer::istat
      real::temp
!
!     Start by Nullifying the head pointer.
!
      NULLIFY(head)
!     Get the name of the input file from the user and then opent that file.
!
      write(*,*)'Enter the name of the file containing the input data.'
      read(*,'(A)') filename
      OPEN(UNIT=9,FILE=filename,STATUS='OLD',ACTION='READ',IOSTAT=istat)
!
!     As long as the file opened withut error,then we proceed to read the data
!     in the file.
!     
      if(istat==0) then
        do 
          read(9,*,IOSTAT=istat) temp
          if(istat /= 0) exit
          if(.not.ASSOCIATED(head)) then 
            ALLOCATE(head,STAT=istat)
            tail => head
            NULLIFY(tail%prev)
            tail%value = temp
          else
            ALLOCATE(tail%prev,STAT=istat)
            tail => tail%prev
            NULLIFY(tail%prev)
            tail%value = temp 
          endIf
      EndDo
!
!     Now, write out the data that we have read.
!
      ptr => head
      do
        if(.not.ASSOCIATED(ptr)) exit
        write(*,*) ptr%value
        ptr => ptr%prev
      endDo
!
!     I am done with the work of the program when the file opened correctly.
!
      else
        write(*,'(1X,A,I6)')'File open failed--status = ',istat
      endif
!
!     The program is done...tell the user..
!
      write(*,*)'The program is complete!'
      end program linkList00

