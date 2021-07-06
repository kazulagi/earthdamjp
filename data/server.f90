program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(4),altitude(4),height,length,grad1, grad2,width
    integer(int32) :: i
    type(IO_) :: file,list
    character(len=:),allocatable :: fname,line
    
    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! メッシュの元となったデータ：
    ! 牧　隆泰, 1958, 日本水利施設進展の研究, 土木雑誌社

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call list%open("../list.txt")

    do i=1,1
        fname = list%readline()    
        call file%open(trim(fname),"r")
        line = file%readline()
        read(line,*) height
        line = file%readline()
        line = file%readline()
        read(line,*) width
        line = file%readline()
        read(line,*) grad1
        line = file%readline()
        read(line,*) grad2
        line = file%readline()
        read(line,*) length
        call file%close()
        ! 尺貫法>>m
        height = height*0.3030303d0
        width = width*0.3030303d0
        length = length*1.818182d0

        call dam%create(meshtype="Cube",x_num=40,y_num=30,z_num=15)
        ! 堤体寸法(上下流方向長 m,堤長48m, 堤高20m)
        call dam%resize(x=height*grad1+width+height*grad2+10.0d0,y=length,z=2.0d0)
        call dam%move(x=-5.0d0,z=-1.0d0)
        ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
        x(1) = 0.00d0;              altitude(1) = 0.0d0+1.00d0;
        x(2) = height*grad1;        altitude(2) = height+1.0d0;
        x(3) = height*grad1+width;  altitude(3) = height+1.0d0;
        x(4) = height*grad1+width+height*grad2; altitude(4) = 0.0d0+1.0d0;
        call dam%edit(x=x, altitude=altitude)
    
        ! 保存
        call dam%vtk(trim(fname)//".vtk" )
        !call dam%stl(trim(fname)//".stl" )
    
    enddo

    
    

    

end program main
