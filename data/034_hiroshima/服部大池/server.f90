program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(4),altitude(4)
    
    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! メッシュの元となったデータ：
    ! 牧　隆泰, 1958, 日本水利施設進展の研究, 土木雑誌社
    ! pp. 212-213 服部大池（広島県芦品郡服部村)

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call dam%create(meshtype="Cube",x_num=40,y_num=30,z_num=12)
    ! 堤体寸法(上下流方向長 m,堤長135m, 堤高15.7尺)
    call dam%resize(x=150.00d0,y=190.0d0,z=3.0d0)
    call dam%move(x=-5.0d0,z=-2.0d0)
    ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
    x(1) = 0.00d0;              altitude(1) = 0.0d0+1.00d0;
    x(2) = 47.6d0;              altitude(2) = 23.8d0+1.0d0;
    x(3) = 47.6d0+24.0d0;       altitude(3) = 23.8d0+1.0d0;
    x(4) = 47.6d0+24.0d0+42.84d0; altitude(4) = 0.0d0+1.0d0;
    
    call dam%edit(x=x, altitude=altitude)

    ! 保存
    call dam%msh("服部大池")
    call dam%stl("服部大池")




end program main
