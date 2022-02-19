[![Actions Status](https://github.com/raku-community-modules/Math-Trig/workflows/test/badge.svg)](https://github.com/raku-community-modules/Math-Trig/actions)

NAME
====

Math::Trig - Trigonometric routines not already built-in

SYNOPSIS
========

```raku
use Math::Trig;
```

DESCRIPTION
===========

Subroutines for coverting between degrees, radians, and gradians; converting between different coordinate systems (cartesian, spherical, cylindrical); and great circle formulas.

SUBROUTINES
===========

Available with `use Math::Trig`;

  * sub rad2rad($rad)

  * sub deg2deg($deg)

  * sub grad2grad($grad)

  * sub rad2deg($rad)

  * sub deg2rad($deg)

  * sub grad2deg($grad)

  * sub deg2grad($deg)

  * sub rad2grad($rad)

  * sub grad2rad($grad)

  * sub cartesian-to-spherical($x,$y,$z)

Available with `use Math::Trig :radial`;

  * sub spherical-to-cartesian($rho, $theta, $phi)

  * sub spherical-to-cylindrical($rho, $theta, $phi)

  * sub cartesian-to-cylindrical($x,$y,$z)

  * sub cylindrical-to-cartesian($rho, $theta, $z)

  * sub cylindrical-to-spherical($rho, $theta, $phi)

Available with `use Math::Trig :great-circle`;

  * sub great-circle-distance($theta0, $phi0, $theta1, $phi1, $rho = 1)

  * sub great-circle-direction($theta0, $phi0, $theta1, $phi1)

  * sub great-circle-bearing($theta0, $phi0, $theta1, $phi1)

  * sub great-circle-waypoint($theta0, $phi0, $theta1, $phi1, $point = 0.5)

  * sub great-circle-midpoint($theta0, $phi0, $theta1, $phi1)

  * sub great-circle-destination($theta0, $phi0, $dir0, $dst)

BUGS
====

  * This is a work in progress. Caveat emptor.

  * Perhaps rename this module since it's less about trigonometry and more about angular conversions and great circles?

AUTHOR
======

Jonathan Scott Duff

Source can be located at: https://github.com/raku-community-modules/Math-Trig . Comments and Pull Requests are welcome.

ACKNOWLEDGEMENTS
================

This module is shamelessly based on the [Perl module](https://metacpan.org/pod/Math::Trig) of the same name. Without the authors and maintainers of *that* module, this module wouldn't exist in this form.

COPYRIGHT AND LICENSE
=====================

Copyright 2015 - 2017 Jonathan Scott Duff

Copyright 2018 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

