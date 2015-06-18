use Test;

plan 21;

use-ok 'Math::Trig';

{
    need Math::Trig;
    import Math::Trig;

    ok &rad2rad, 'rad2rad sub is exported by :DEFAULT';
    ok &deg2deg, 'deg2deg sub is exported by :DEFAULT';
    ok &grad2grad, 'grad2grad sub is exported by :DEFAULT';
    ok &rad2deg, 'rad2deg sub is exported by :DEFAULT';
    ok &deg2rad , 'deg2rad sub is exported by :DEFAULT';
    ok &grad2deg, 'grad2deg sub is exported by :DEFAULT';
    ok &deg2grad, 'deg2grad sub is exported by :DEFAULT';
    ok &rad2grad, 'rad2grad sub is exported by :DEFAULT';
    ok &grad2rad, 'grad2rad sub is exported by :DEFAULT';
}

{
    need Math::Trig;
    import Math::Trig :radial;

	ok &cartesian-to-spherical, 'cartesian-to-spherical is exported by :radial';
	ok &spherical-to-cartesian, 'spherical-to-cartesian is exported by :radial';
	ok &spherical-to-cylindrical, 'spherical-to-cylindrical is exported by :radial';
	ok &cylindrical-to-cartesian, 'cylindrical-to-cartesian is exported by :radial';
	ok &cylindrical-to-spherical, 'cylindrical-to-spherical is exported by :radial';
}

{
    need Math::Trig;
    import Math::Trig :great-circle;

	ok &great-circle-distance, 'great-circle-distance is exported by :great-circle';
	ok &great-circle-bearing, 'great-circle-bearing is exported by :great-circle';
	ok &great-circle-direction, 'great-circle-direction is exported by :great-circle';
	ok &great-circle-waypoint, 'great-circle-waypoint is exported by :great-circle';
	ok &great-circle-midpoint, 'great-circle-midpoint is exported by :great-circle';
	ok &great-circle-destination, 'great-circle-destination is exported by :great-circle';
}
