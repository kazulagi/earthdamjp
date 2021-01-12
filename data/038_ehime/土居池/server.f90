program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(4),altitude(4)
    
    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! メッシュの元となったデータ：
    ! 牧　隆泰, 1958, 日本水利施設進展の研究, 土木雑誌社

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call dam%create(meshtype="Cube",x_num=40,y_num=30,z_num=12)
    ! 堤体寸法(上下流方向長 m,堤長42m, 堤高15m)
    call dam%resize(x=15.0d0*2.5d0+4.2d0+15.0d0*2.50d0+10.0d0,y=42.0d0,z=3.0d0)
    call dam%move(x=-5.0d0,z=-2.0d0)
    ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
    ! 勾配はgoogle earth からの推定
    x(1) = 0.00d0;              altitude(1) = 0.0d0+1.00d0;
    x(2) = 15.0d0*2.5d0;         altitude(2) = 15.0d0+1.0d0;
    x(3) = 15.0d0*2.5d0+4.2d0;  altitude(3) = 15.0d0+1.0d0;
    x(4) = 15.0d0*2.5d0+4.2d0+15.0d0*2.50d0; altitude(4) = 0.0d0+1.0d0;
    call dam%edit(x=x, altitude=altitude)

    ! 保存
    call dam%msh("土居池")
    call dam%stl("土居池")




end program main
