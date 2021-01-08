program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(4),altitude(4)
    
    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! メッシュの元となったデータ：
    ! 牧　隆泰, 1958, 日本水利施設進展の研究, 土木雑誌社
    ! pp. 214 廻堰大池（青森県西津軽郡)

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call dam%create(meshtype="Cube",x_num=40,y_num=30,z_num=12)
    ! 堤体寸法(上下流方向長 m,堤長293m, 堤高7.7m)
    call dam%resize(x=70.00d0,y=293.0d0,z=3.0d0)
    call dam%move(x=-5.0d0,z=-2.0d0)
    ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
    ! 以下の内容は誤りです。正確なデータを問い合わせ中
    x(1) = 0.00d0;              altitude(1) = 0.0d0+1.00d0;
    x(2) = 7.7d0*4.0d0;         altitude(2) = 7.7d0+1.0d0;
    x(3) = 7.7d0*4.0d0+6.50d0;  altitude(3) = 7.7d0+1.0d0;
    x(4) = 7.7d0*4.0d0+6.50d0+7.7d0*2.50d0; altitude(4) = 0.0d0+1.0d0;
    
    call dam%edit(x=x, altitude=altitude)

    ! 保存
    call dam%msh("廻堰大池")
    call dam%stl("廻堰大池")




end program main
