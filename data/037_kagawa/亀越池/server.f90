program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(6),altitude(6)
    
    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! メッシュの元となったデータ：
    ! 牧　隆泰, 1958, 日本水利施設進展の研究, 土木雑誌社
    ! p. 212 亀越池（香川県綾歌郡長炭村)

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call dam%create(meshtype="Cube",x_num=40,y_num=30,z_num=12)
    ! 堤体寸法(上下流方向長 m,堤長90m, 堤高15.9m)
    call dam%resize(x=100.00d0,y=90.0d0,z=3.0d0)
    call dam%move(x=-5.0d0,z=-2.0d0)
    ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
    x(1) = 0.00d0; altitude(1) = 1.00d0;
    x(2) = 39.8d0; altitude(2) = 15.9d0+1.0d0;
    x(3) = 48.8d0; altitude(3) = 15.9d0+1.0d0;
    x(4) = 75.8d0; altitude(4) =  5.0d0+1.0d0;
    x(5) = 78.8d0; altitude(5) =  5.0d0+1.00d0;
    x(6) = 81.8d0; altitude(6) = 1.00d0;
    
    call dam%edit(x=x, altitude=altitude)

    ! 保存
    call dam%msh("亀越池")
    call dam%stl("亀越池")




end program main
