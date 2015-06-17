use Test;
use Math::Trig;

plan 2;

is-approx(deg2rad(90), pi/2, '');
is-approx(rad2deg(pi), 180, '');
