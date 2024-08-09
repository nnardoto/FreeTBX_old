module FreeTBX
  character(len = 20) :: SystemName 

contains

    subroutine LoadSystem(InputFile)
      use fdf
      
      fdf_init(InputFile, "log.txt")
      SystemName = fdf_get("SystemName", "null")
    end subroutine
end module
