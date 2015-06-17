use Test;
use Math::Trig :DEFAULT, :radial;

plan 3;

my ($r,$t,$f) = cartesian_to_spherical(1,1,1);
is-approx($r, sqrt(3), '');
is-approx($t, deg2rad(45), '');
is-approx($f, atan2(sqrt(2), 1), '');
