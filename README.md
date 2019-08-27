# Physics-Pendulum

This simulation solves the accurate differential equation for a simple (mathematical) pendulum numerically in earth's field of gravity. Made with Godot Engine (no physics engine involved).

A video by 3Blue1Brown about differential equations inspired me to create this project. Have a look at the video on Youtube: https://www.youtube.com/watch?v=p_di4Zn4wz4 It's really nice to watch!

---

The mass and moment of inertia of the pendulum are neglected and no small angle approximations are involved. We don't do that here. This leads to the following equation, which of course is a harmonic oscillator:

![thetaDOUBLEDOT + g / L * sin(theta) = 0](https://wikimedia.org/api/rest_v1/media/math/render/svg/36e0d601a33a7562dfb162abd7e58859a40ccff1)

You can also set the boundary values for the pendulum which are:
* Initial angle, ``phi_0`` [°]; arbitrary.
* Pendulum length, ``L`` [m]; L > 0.
* Initial (tip) velocity, ``v_0`` [m/s]; arbitrary.
* Damping constant, ``µ`` [ ]; µ >= 0.

The program auto-saves all your set config parameters to a file called ``settings.cfg`` in the user directory (AppData). This way all the parameters are reloaded if you start the simulation or reset it.

On the top left corner you can also find some stats to your pendulum motion such as angle, tip velocity, angular velocity and time. Furthermore, you can find the harmonic graph being drawn as the pendulum is oscillating on the bottom of the screen.

---

Note: This should run in pretty much any browser, but if it doesn't try to download the source code and give it a try in Godot OR create an issue.
