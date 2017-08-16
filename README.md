# FOPD-tunner
Fractional order proportional derivative controller tuner

# Related Publications:
Bo Shang, Jianxin Liu, Tiebiao Zhao and YangQuan Chen, "Fractional order robust visual servoing control of a quadrotor UAV with larger sampling period," 2016 International Conference on Unmanned Aircraft Systems (ICUAS), Arlington, VA, 2016, pp. 1228-1234. [PDF](https://github.com/cnpcshangbo/FOPD-tunner/raw/master/Fractional%20Order%20%20Robust%20Visual%20Servoing%20Control%20of%20%20A%20%20Quadrotor%20UAV%20with%20%20Larger%20Sampling%20%20Period.pdf)

# 1. License
FOPD-tunner is released under a [MIT license](https://github.com/cnpcshangbo/FOPD-tunner/blob/master/LICENSE).

If you use FOPD-tunner in an academic work, please cite:

    @inproceedings{shang2016fractional,
      title={Fractional order robust visual servoing control of a quadrotor UAV with larger sampling period},
      author={Shang, Bo and Liu, Jianxin and Zhao, Tiebiao and Chen, YangQuan},
      booktitle={Unmanned Aircraft Systems (ICUAS), 2016 International Conference on},
      pages={1228--1234},
      year={2016},
      organization={IEEE}
    }

# 2. Prerequisites
We have tested the library in **MATLAB 2016b** and **Windows 7**, but it should be easy to run in other platforms.

## Control model
<img width="433" alt="screenshot 2017-08-15 17 51 47" src="https://user-images.githubusercontent.com/4831029/29342990-04fdb158-81e3-11e7-82b1-55edb5378ec8.png">

## MATLAB System Identification Toolbox
Convert the identified model to this format:

<img width="170" alt="screenshot 2017-08-15 20 25 37" src="https://user-images.githubusercontent.com/4831029/29346105-f81f3aaa-81f7-11e7-9510-2267dedcafc9.png">

Then we can get the parameter k and tau.

## FOTF toolbox

## Oustaloup

# 3. Downloading FOPD-tunner library and run examples
##Clone the repository:
```
git clone https://github.com/cnpcshangbo/FOPD-tunner.git
```

# 4. Run examples

## Tune IOPID controller
Enter the folder named "1. iopid_tune_pid", open "iopid_tune.m", update the plant parameters, then run it to tune IOPID controller and get related parameters (integer order PID parameters, cross over Frequency omega_c and phase margin) 

## Tune FOPD controller
Set lambda to -1~0, update the parameters k and tau, run first cell of "cal_lambda_ki_kp_bode.m" and see the figure. Check the curve to find cross point.

Note: When lambda is negative, a PI controller becomes a PD controller.

