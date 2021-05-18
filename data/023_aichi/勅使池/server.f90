program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(7),altitude(7),top
    integer(int32) :: i

    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! メッシュの元となったデータ：
    ! 牧　隆泰, 1958, 日本水利施設進展の研究, 土木雑誌社
    ! p. 209 勅使池（愛知県愛知郡豊明村)

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call dam%create(meshtype="Cube",x_num=30,y_num=30,z_num=12)
    ! 堤体寸法(上下流方向長,堤長235間, 堤高25尺)
    !15:6.1=x:30.1
    call dam%resize(x=30.00d0,y=427.20d0,z=2.10d0)
    call dam%move(x=-5.0d0,z=-2.0d0)
    ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
    x(1) = 0.00d0; altitude(1) = 0.10d0;
    x(2) = 3.75d0; altitude(2) = 7.50d0;
    x(3) = 7.50d0; altitude(3) = 7.50d0;
    x(4) =7.50d0+15.0d0; altitude(4) = 0.10d0;
    call dam%edit(x=x, altitude=altitude)

    ! 保存
    call dam%msh("勅使池")
    call dam%stl("勅使池")
    
end program main
