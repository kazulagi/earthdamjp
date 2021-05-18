program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(6),altitude(6),top
    integer(int32) :: i

    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! メッシュの元となったデータ：
    ! 牧　隆泰, 1958, 日本水利施設進展の研究, 土木雑誌社
    ! p. 209 入鹿池（愛知県犬山市)

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call dam%create(meshtype="Cube",x_num=30,y_num=30,z_num=12)
    ! 堤体寸法(上下流方向長185m,堤長95間, 堤高29m)
    call dam%resize(x=200.00d0,y=95.0d0*1.80d0,z=3.0d0)
    call dam%move(x=-5.0d0,z=-2.0d0)
    ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
    x(1) = 0.00d0; altitude(1) = 1.00d0;
    x(2) = 73.5d0; altitude(2) = 29.4d0+1.0d0;
    x(3) = 81.3d0; altitude(3) = 29.4d0+1.0d0;
    x(4) =120.3d0; altitude(4) = 16.4d0+1.0d0;
    x(5) =127.8d0; altitude(5) = 16.4d0+1.0d0;
    x(6) =185.2d0; altitude(6) = 1.00d0;
    
    call dam%edit(x=x, altitude=altitude)

    ! 保存
    call dam%msh("入鹿池")
    call dam%stl("入鹿池")




end program main
