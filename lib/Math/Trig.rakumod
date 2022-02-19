unit module Math::Trig:ver<0.0.3>:auth<zef:raku-community-modules>;

sub rad2rad($rad)    is export { $rad % tau        }

sub deg2deg($deg)    is export { $deg % 360        }

sub grad2grad($grad) is export { $grad % 400       }

sub rad2deg($rad)    is export { $rad * 180 / pi   }

sub deg2rad($deg)    is export { $deg * pi / 180   }

sub grad2deg($grad)  is export { 360 / 400 * $grad }

sub deg2grad($deg)   is export { 400 / 360 * $deg  }

sub rad2grad($rad)   is export { 400 / tau * $rad  }

sub grad2rad($grad)  is export { tau / 400 * $grad }

sub cartesian-to-spherical($x,$y,$z) is export(:radial) {
    my $rho := sqrt($x*$x + $y*$y + $z*$z);
    $rho, atan2($y, $x), acos($z / $rho);
}

sub spherical-to-cartesian($rho, $theta, $phi) is export(:radial) {
    my $sin-phi := sin $phi;
    $rho * cos( $theta ) * $sin-phi,
    $rho * sin( $theta ) * $sin-phi,
    $rho * cos( $phi   )
}

sub spherical-to-cylindrical($rho, $theta, $phi) is export(:radial) {
    my ($x, $y, $z) = spherical-to-cartesian($rho,$theta,$phi);
    sqrt( $x * $x + $y * $y ), $theta, $z
}

sub cartesian-to-cylindrical($x,$y,$z) is export(:radial) {
    sqrt( $x * $x + $y * $y ), atan2( $y, $x ), $z
}

sub cylindrical-to-cartesian($rho, $theta, $z) is export(:radial) {
    $rho * cos( $theta ), $rho * sin( $theta ), $z
}

sub cylindrical-to-spherical($rho, $theta, $phi)  is export(:radial) {
    cartesian-to-spherical |cylindrical-to-cartesian $rho, $theta, $phi
}

sub great-circle-distance(
  $theta0, $phi0, $theta1, $phi1, $rho = 1
) is export(:great-circle) {
    my $lat0 := pi/2 - $phi0;
    my $lat1 := pi/2 - $phi1;
    $rho * acos( cos( $lat0 ) * cos( $lat1 ) * cos( $theta0 - $theta1 ) +
                 sin( $lat0 ) * sin( $lat1 ) )
}

sub great-circle-direction(
  $theta0, $phi0, $theta1, $phi1
) is export(:great-circle) {
    my $lat0 = pi/2 - $phi0;
    my $lat1 = pi/2 - $phi1;
 
    rad2rad(2 * pi -
        atan2(sin($theta0-$theta1) * cos($lat1),
                cos($lat0) * sin($lat1) -
                    sin($lat0) * cos($lat1) * cos($theta0-$theta1)));
}

our constant &great-circle-bearing is export(:great-circle) =
  &great-circle-direction;

sub great-circle-waypoint(
  $theta0, $phi0, $theta1, $phi1, $point = 0.5
) is export(:great-circle) {
    my $d := great-circle-distance( $theta0, $phi0, $theta1, $phi1 );
 
    return if $d == pi;
 
    my $sd := sin($d);
 
    return ($theta0, $phi0) if $sd == 0;
 
    my $A := sin((1 - $point) * $d) / $sd;
    my $B := sin(     $point  * $d) / $sd;
 
    my $lat0 := pi/2 - $phi0;
    my $lat1 := pi/2 - $phi1;
 
    my $x := $A * cos($lat0) * cos($theta0) + $B * cos($lat1) * cos($theta1);
    my $y := $A * cos($lat0) * sin($theta0) + $B * cos($lat1) * sin($theta1);
    my $z := $A * sin($lat0)                + $B * sin($lat1);
 
    atan2($y, $x), acos($z)
}

our constant &great-circle-midpoint is export(:great-circle) =
  &great-circle-waypoint;

sub great-circle-destination(
  $theta0, $phi0, $dir0, $dst
) is export(:great-circle) {
    my $lat0 := pi/2 - $phi0;
 
    my $phi1   := asin(sin($lat0)*cos($dst) +
                      cos($lat0)*sin($dst)*cos($dir0));
 
    my $theta1 := $theta0 + atan2(sin($dir0)*sin($dst)*cos($lat0),
                                 cos($dst)-sin($lat0)*sin($phi1));
 
    my $dir1 := great-circle-bearing($theta1, $phi1, $theta0, $phi0) + pi;
 
    $dir1 := $dir1 - 2*pi if $dir1 > 2*pi;
 
    $theta1, $phi1, $dir1
}

=begin pod

=head1 NAME

Math::Trig - Trigonometric routines not already built-in

=head1 SYNOPSIS

=begin code :lang<raku>

use Math::Trig;

=end code

=head1 DESCRIPTION

Subroutines for coverting between degrees, radians, and gradians;
converting between different coordinate systems (cartesian, spherical,
cylindrical); and great circle formulas.

=head1 SUBROUTINES

Available with C<use Math::Trig>;

=item sub rad2rad($rad)
=item sub deg2deg($deg)
=item sub grad2grad($grad)
=item sub rad2deg($rad)
=item sub deg2rad($deg)
=item sub grad2deg($grad)
=item sub deg2grad($deg)
=item sub rad2grad($rad)
=item sub grad2rad($grad)
=item sub cartesian-to-spherical($x,$y,$z)

Available with C<use Math::Trig :radial>;

=item sub spherical-to-cartesian($rho, $theta, $phi)
=item sub spherical-to-cylindrical($rho, $theta, $phi)
=item sub cartesian-to-cylindrical($x,$y,$z)
=item sub cylindrical-to-cartesian($rho, $theta, $z)
=item sub cylindrical-to-spherical($rho, $theta, $phi)

Available with C<use Math::Trig :great-circle>;

=item sub great-circle-distance($theta0, $phi0, $theta1, $phi1, $rho = 1)
=item sub great-circle-direction($theta0, $phi0, $theta1, $phi1)
=item sub great-circle-bearing($theta0, $phi0, $theta1, $phi1)
=item sub great-circle-waypoint($theta0, $phi0, $theta1, $phi1, $point = 0.5)
=item sub great-circle-midpoint($theta0, $phi0, $theta1, $phi1)
=item sub great-circle-destination($theta0, $phi0, $dir0, $dst)

=head1 BUGS

=item This is a work in progress.  Caveat emptor.
=item Perhaps rename this module since it's less about trigonometry and more about angular conversions and great circles?

=head1 AUTHOR

Jonathan Scott Duff

Source can be located at: https://github.com/raku-community-modules/Math-Trig .
Comments and Pull Requests are welcome.

=head1 ACKNOWLEDGEMENTS

This module is shamelessly based on the L<Perl
module|https://metacpan.org/pod/Math::Trig> of the same name.
Without the authors and maintainers of *that* module, this module
wouldn't exist in this form.

=head1 COPYRIGHT AND LICENSE

Copyright 2015 - 2017 Jonathan Scott Duff

Copyright 2018 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
