program main
    use plantFEM
    implicit none

    type(FEMDomain_) :: dam
    real(real64) :: x(5),altitude(5),top
    integer(int32) :: i

    ! plantFEM用メッシュ生成スクリプト
    ! https://github.com/kazulagi/plantFEM

    ! 以下、メッシュ分割プログラム
    ! 要素分割数
    call dam%create(meshtype="Cube",x_num=30,y_num=30,z_num=12)
    ! 堤体寸法(上下流方向長,堤長, 堤高)
    call dam%resize(x=60.0d0,y=150.0d0,z=3.0d0)
    call dam%move(x=-5.0d0,z=-2.0d0)
    ! 上流からx(n) m 進んだ地点の高さがaltitude(n) m
    x(1) = 0.00d0; altitude(1) = 1.00d0;
    x(2) = 4.65d0; altitude(2) = 20.0d0 -19.0d0 + 1.0d0;
    x(3) = 49.05d0*0.45d0; altitude(3) = 30.0d0 -19.0d0 + 1.0d0;
    x(4) = 49.05d0*0.55d0; altitude(4) = 30.0d0 -19.0d0 + 1.0d0;
    x(5) =49.05d0; altitude(5) = 20.0d0 -19.0d0 + 1.0d0;
    
    call dam%edit(x=x, altitude=altitude)

    ! 保存
    call dam%msh("別曽池")
    call dam%stl("別曽池")




end program main
