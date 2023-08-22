# ANTs用法

## 用法

`antsRegistrationSyN.sh -d 图像维度 -f 参考像 -m 需要做配准的图像 -o 输出文件前缀`

## 举例

`antsRegistrationSyN.sh -d 3 -f fixedImage.nii.gz -m movingImage.nii.gz -o output`

## 必要参数

     -d:  ImageDimension: 2 or 3 (for 2 or 3 dimensional registration of single volume)
    
     -f:  Fixed image(s) or source image(s) or reference image(s)
    
     -m:  Moving image(s) or target image(s)
    
     -o:  OutputPrefix: A prefix that is prepended to all output files.

## 可选参数

     -n:  Number of threads (default = ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS if defined, otherwise 1)
    
     -i:  initial transform(s) --- order specified on the command line matters
    
     -t:  transform type (default = 's') # 变换方式
        t: translation (1 stage) # 仅平移
        r: rigid (1 stage) # 仅刚体变换
        a: rigid + affine (2 stages) #刚体变换+仿射变换
        s: rigid + affine + deformable syn (3 stages) # 刚体变换 + 仿射变换 + 非线性变换SyN
        sr: rigid + deformable syn (2 stages) # 刚体变换 + 非线性变换SyN
        so: deformable syn only (1 stage) # 仅非线性变换SyN
        b: rigid + affine + deformable b-spline syn (3 stages) 
           # 刚体变换 + 仿射变换 + 非线性 B-spline SyN 变换
        br: rigid + deformable b-spline syn (2 stages) 
           # 刚体变换 + 非线性 B-spline SyN 变换
        bo: deformable b-spline syn only (1 stage)
           # 非线性 B-spline SyN 变换
    
     -r:  radius for cross correlation metric used during SyN stage (default = 4)
          # 在 SyN 阶段使用的互相关度度量的半径（默认值 = 4）
     -s:  spline distance for deformable B-spline SyN transform (default = 26)
          # 非线性 B-spline SyN 变换的 spline 距离（默认值 = 26）
     -g:  gradient step size for SyN and B-spline SyN (default = 0.1)
          # SyN 和 B-spline SyN 的梯度步长（默认值 = 0.1）
    
     -x:  mask(s) for the fixed image space, or for the fixed and moving image space in the format
          "fixedMask,MovingMask". Use -x once to specify mask(s) to be used for all stages or use
          -x for each "stage" (cf -t option).  If no mask is to be used for a particular stage,
          the keyword 'NULL' should be used in place of file names.
    
     -p:  precision type (default = 'd')
        f: float
        d: double
    
     -j:  use histogram matching (default = 0)
        0: false
        1: true
    
     -y:  use 'repro' mode for exact reproducibility of output.  Uses GC metric for linear
          stages and a fixed random seed (default = 0).
        0: false
        1: true
    
     -z:  collapse output transforms (default = 1)
        0: false
        1: true
    
     -e:  Fix random seed to an int value
    
     NB:  Multiple image pairs can be specified for registration during the SyN stage.
          Specify additional images using the '-m' and '-f' options.  Note that image
          pair correspondence is given by the order specified on the command line.
          Only the first fixed and moving image pair is used for the linear resgitration
          stages.