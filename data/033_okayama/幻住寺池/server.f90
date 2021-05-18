program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(7),altitude(7)
    
    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! メッシュの元となったデータ：
    ! 牧　隆泰, 1958, 日本水利施設進展の研究, 土木雑誌社

    ! 旧堤

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call dam%create(meshtype="Cube",x_num=40,y_num=30,z_num=12)
    ! 堤体寸法(上下流方向長 m,堤長不明（暫定54m), 旧堤高35尺,10.5m, 新堤高17.7m)
    call dam%resize(x=80.00d0,y=54.86d0,z=3.0d0)
    call dam%move(x=-1.0d0,z=-1.0d0)
    ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
    x(1) = 0.00d0;              altitude(1) = 0.0d0+1.00d0;
    x(2) = 17.70d0;         altitude(2) = 0.0d0+1.0d0;
    x(3) = 17.70d0*2.0d0;  altitude(3) = 17.0d0/2.0d0+1.0d0;
    x(4) = 17.70d0*2.0d0 + (17.70d0-10.5d0)*1.50d0; altitude(4) = 10.5d0+1.0d0;
    x(5) = x(4) + 0.60d0;   altitude(5) = altitude(4);
    x(6) = x(5) + 8.1d0*0.80d0 ;   altitude(6) = 2.40d0+1.0d0;
    x(7) = x(6) + 0.80d0;   altitude(7) = 1.0d0;
    
    call dam%edit(x=x, altitude=altitude)

    ! 保存
    call dam%msh("幻住寺池")
    call dam%stl("幻住寺池")




end program main
