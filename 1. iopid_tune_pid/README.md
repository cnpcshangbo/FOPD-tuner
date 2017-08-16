# IOPID controller tuning
## Update the plant transfer function to "p_tf" and run the code
The output should be like this:
```shell
C =
 
             1          
  Kp + Ki * --- + Kd * s
             s          

  with Kp = 2.89, Ki = 1.04, Kd = 1.79
 
Continuous-time PID controller in parallel form.


info = 

  struct with fields:

                Stable: 1
    CrossoverFrequency: 2.5085
           PhaseMargin: 83.8783
```
So we know its integer order PID parameters, cross over Frequency omega_c and phase margin.
![image](https://user-images.githubusercontent.com/4831029/29347903-9e23a506-8204-11e7-98ca-bc6e6bb74f18.png)
