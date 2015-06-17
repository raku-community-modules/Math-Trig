unit module Math::Trig:ver<0.01>;

constant two-pi = pi * 2;

sub rad2rad ($rad)  is export 
{
    return $rad % two-pi;
}

sub deg2deg ($deg) is export
{
    return $deg % 360;
}

sub grad2grad ($grad) is export 
{
    return $grad % 400;
}

sub rad2deg ($rad) is export
{
    return $rad * 180 / pi;
}

sub deg2rad ($deg) is export
{
    return $deg * pi / 180;
}

sub grad2deg ($grad) is export
{
    return 360 / 400 * $grad;
}

sub deg2grad ($deg) is export
{
    return 400 / 360 * $deg;
}

sub rad2grad ($rad) is export
{
    return 400 / two-pi * $rad;
}

sub grad2rad ($grad) is export 
{
    return two-pi / 400 * $grad;
}

sub cartesian-to-spherical($x,$y,$z) is export(:radial)
{
    my $rho = sqrt($x*$x + $y*$y + $z*$z);
    return $rho, atan2($y, $x), acos($z / $rho);
}

sub spherical-to-cartesian($rho, $theta, $phi) is export(:radial)
{
    
}

sub spherical-to-cylindrical($x, $y, $z) is export(:radial)
{
}

sub cylindrical-to-cartesian($rho, $theta, $z) is export(:radial)
{
}

sub cylindrical-to-spherical($rho, $theta, $phi)  is export(:radial)
{
}

sub great-circle-distance($theta0, $phi0, $theta1, $phi1) is export(:great-circle)
{
}

sub great-circle-direction($theta0, $phi0, $theta1, $phi1) is export(:great-circle)
{
}
# TODO: how to export this symbol?
constant great-circle-bearing = &great-circle-direction;

sub great-circle-waypoint($theta0, $phi0, $theta1, $phi1, $point) is export(:great-circle)
{
}

# TODO: how to export this symbol?
constant great-circle-midpoint = &great-circle-waypoint.assuming(:point(0.5));

sub great-circle-destination( $theta0, $phi0, $dir0, $dst ) is export(:great-circle)
{
}
