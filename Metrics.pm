# -*- Perl -*-
# Metrics.pm
# You may distribute this under the same terms as Perl
# itself.
#
package PostScript::Metrics;
use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
$VERSION = '0.04';


my %fonts = (
'NimbusSanL-Regu' => [
278,	278,	355,	556,	556,	889,	667,	221,	333,	333,	389,	584,	278,	584,	278,	278,	556,	556,	556,	556,	556,	556,	556,	556,	556,	556,	278,	278,	584,	584,	584,	556,	1015,	667,	667,	722,	722,	667,	611,	778,	722,	278,	500,	667,	556,	833,	722,	778,	667,	778,	722,	667,	611,	722,	667,	944,	667,	667,	611,	278,	278,	278,	469,	556,	222,	556,	556,	500,	556,	556,	278,	556,	556,	222,	222,	500,	222,	833,	556,	556,	556,	556,	333,	500,	278,	556,	500,	722,	500,	500,	500,	334,	260,	334,	584,	
],
'NimbusSanL-Bold' => [
278,	333,	474,	556,	556,	889,	722,	278,	333,	333,	389,	584,	278,	584,	278,	278,	556,	556,	556,	556,	556,	556,	556,	556,	556,	556,	333,	333,	584,	584,	584,	611,	975,	722,	722,	722,	722,	667,	611,	778,	722,	278,	556,	722,	611,	833,	722,	778,	667,	778,	722,	667,	611,	722,	667,	944,	667,	667,	611,	333,	278,	333,	584,	556,	278,	556,	611,	556,	611,	556,	333,	611,	611,	278,	278,	556,	278,	889,	611,	611,	611,	611,	389,	556,	333,	611,	556,	778,	556,	556,	500,	389,	280,	389,	584,	
],
'NimbusSanL-ReguItal' => [
278,	278,	355,	556,	556,	889,	667,	222,	333,	333,	389,	584,	278,	584,	278,	278,	556,	556,	556,	556,	556,	556,	556,	556,	556,	556,	278,	278,	584,	584,	584,	556,	1015,	667,	667,	722,	722,	667,	611,	778,	722,	278,	500,	667,	556,	833,	722,	778,	667,	778,	722,	667,	611,	722,	667,	944,	667,	667,	611,	278,	278,	278,	469,	556,	222,	556,	556,	500,	556,	556,	278,	556,	556,	222,	222,	500,	222,	833,	556,	556,	556,	556,	333,	500,	278,	556,	500,	722,	500,	500,	500,	334,	260,	334,	584,	
],
'NimbusSanL-BoldItal' => [
278,	333,	474,	556,	556,	889,	722,	278,	333,	333,	389,	584,	278,	584,	278,	278,	556,	556,	556,	556,	556,	556,	556,	556,	556,	556,	333,	333,	584,	584,	584,	611,	975,	722,	722,	722,	722,	667,	611,	778,	722,	278,	556,	722,	611,	833,	722,	778,	667,	778,	722,	667,	611,	722,	667,	944,	667,	667,	611,	333,	278,	333,	584,	556,	278,	556,	611,	556,	611,	556,	333,	611,	611,	278,	278,	556,	278,	889,	611,	611,	611,	611,	389,	556,	333,	611,	556,	778,	556,	556,	500,	389,	280,	389,	584,	
],
'URWGothicL-Book' => [
277,	295,	309,	554,	554,	775,	757,	351,	369,	369,	425,	606,	277,	606,	277,	437,	554,	554,	554,	554,	554,	554,	554,	554,	554,	554,	277,	277,	606,	606,	606,	591,	867,	740,	574,	813,	744,	536,	485,	872,	683,	226,	482,	591,	462,	919,	740,	869,	592,	871,	607,	498,	426,	655,	702,	960,	609,	592,	480,	351,	605,	351,	606,	500,	351,	683,	682,	647,	685,	650,	314,	673,	610,	200,	203,	502,	200,	938,	610,	655,	682,	682,	301,	388,	339,	608,	554,	831,	480,	536,	425,	351,	672,	351,	606,	
],
'NimbusSanL-ReguCond' => [
228,	228,	291,	456,	456,	729,	547,	182,	273,	273,	319,	479,	228,	479,	228,	228,	456,	456,	456,	456,	456,	456,	456,	456,	456,	456,	228,	228,	479,	479,	479,	456,	832,	547,	547,	592,	592,	547,	501,	638,	592,	228,	410,	547,	456,	683,	592,	638,	547,	638,	592,	547,	501,	592,	547,	774,	547,	547,	501,	228,	228,	228,	385,	456,	182,	456,	456,	410,	456,	456,	228,	456,	456,	182,	182,	410,	182,	683,	456,	456,	456,	456,	273,	410,	228,	456,	410,	592,	410,	410,	410,	274,	213,	274,	479,	
],
'URWGothicL-Demi' => [
280,	280,	360,	560,	560,	860,	680,	280,	380,	380,	440,	600,	280,	600,	280,	460,	560,	560,	560,	560,	560,	560,	560,	560,	560,	560,	280,	280,	600,	600,	600,	560,	740,	740,	580,	780,	700,	520,	480,	840,	680,	280,	480,	620,	440,	900,	740,	840,	560,	840,	580,	520,	420,	640,	700,	900,	680,	620,	500,	320,	640,	320,	600,	500,	280,	660,	660,	640,	660,	640,	280,	660,	600,	240,	260,	580,	240,	940,	600,	640,	660,	660,	320,	440,	300,	600,	560,	800,	560,	580,	460,	340,	600,	340,	600,	
],
'NimbusSanL-BoldCond' => [
228,	273,	389,	456,	456,	729,	592,	228,	273,	273,	319,	479,	228,	479,	228,	228,	456,	456,	456,	456,	456,	456,	456,	456,	456,	456,	273,	273,	479,	479,	479,	501,	800,	592,	592,	592,	592,	547,	501,	638,	592,	228,	456,	592,	501,	683,	592,	638,	547,	638,	592,	547,	501,	592,	547,	774,	547,	547,	501,	273,	228,	273,	479,	456,	228,	456,	501,	456,	501,	456,	273,	501,	501,	228,	228,	456,	228,	729,	501,	501,	501,	501,	319,	456,	273,	501,	456,	638,	456,	456,	410,	319,	230,	319,	479,	
],
'URWGothicL-BookObli' => [
277,	295,	309,	554,	554,	775,	757,	351,	369,	369,	425,	606,	277,	606,	277,	437,	554,	554,	554,	554,	554,	554,	554,	554,	554,	554,	277,	277,	606,	606,	606,	591,	867,	740,	574,	813,	744,	536,	485,	872,	683,	226,	482,	591,	462,	919,	740,	869,	592,	871,	607,	498,	426,	655,	702,	960,	609,	592,	480,	351,	605,	351,	606,	500,	351,	683,	682,	647,	685,	650,	314,	673,	610,	200,	203,	502,	200,	938,	610,	655,	682,	682,	301,	388,	339,	608,	554,	831,	480,	536,	425,	351,	672,	351,	606,	
],
'NimbusSanL-ReguCondItal' => [
228,	228,	291,	456,	456,	729,	547,	182,	273,	273,	319,	479,	228,	479,	228,	228,	456,	456,	456,	456,	456,	456,	456,	456,	456,	456,	228,	228,	479,	479,	479,	456,	832,	547,	547,	592,	592,	547,	501,	638,	592,	228,	410,	547,	456,	683,	592,	638,	547,	638,	592,	547,	501,	592,	547,	774,	547,	547,	501,	228,	228,	228,	385,	456,	182,	456,	456,	410,	456,	456,	228,	456,	456,	182,	182,	410,	182,	683,	456,	456,	456,	456,	273,	410,	228,	456,	410,	592,	410,	410,	410,	274,	213,	274,	479,	
],
'URWGothicL-DemiObli' => [
280,	280,	360,	560,	560,	860,	680,	280,	380,	380,	440,	600,	280,	600,	280,	460,	560,	560,	560,	560,	560,	560,	560,	560,	560,	560,	280,	280,	600,	600,	600,	560,	740,	740,	580,	780,	700,	520,	480,	840,	680,	280,	480,	620,	440,	900,	740,	840,	560,	840,	580,	520,	420,	640,	700,	900,	680,	620,	500,	320,	640,	320,	600,	500,	280,	660,	660,	640,	660,	640,	280,	660,	600,	240,	260,	580,	240,	940,	600,	640,	660,	660,	320,	440,	300,	600,	560,	800,	560,	580,	460,	340,	600,	340,	600,	
],
'NimbusSanL-BoldCondItal' => [
228,	273,	389,	456,	456,	729,	592,	228,	273,	273,	319,	479,	228,	479,	228,	228,	456,	456,	456,	456,	456,	456,	456,	456,	456,	456,	273,	273,	479,	479,	479,	501,	800,	592,	592,	592,	592,	547,	501,	638,	592,	228,	456,	592,	501,	683,	592,	638,	547,	638,	592,	547,	501,	592,	547,	774,	547,	547,	501,	273,	228,	273,	479,	456,	228,	456,	501,	456,	501,	456,	273,	501,	501,	228,	228,	456,	228,	729,	501,	501,	501,	501,	319,	456,	273,	501,	456,	638,	456,	456,	410,	319,	230,	319,	479,	
],
'URWBookmanL-Ligh' => [
320,	300,	380,	620,	620,	900,	800,	220,	300,	300,	440,	600,	320,	600,	320,	600,	620,	620,	620,	620,	620,	620,	620,	620,	620,	620,	320,	320,	600,	600,	600,	540,	820,	680,	740,	740,	800,	720,	640,	800,	800,	340,	600,	720,	600,	920,	740,	800,	620,	820,	720,	660,	620,	780,	700,	960,	720,	640,	640,	300,	600,	300,	600,	500,	220,	580,	620,	520,	620,	520,	320,	540,	660,	300,	300,	620,	300,	940,	660,	560,	620,	580,	440,	520,	380,	680,	520,	780,	560,	540,	480,	280,	600,	280,	600,	
],
'NimbusRomNo9L-Regu' => [
250,	333,	408,	500,	500,	833,	778,	333,	333,	333,	500,	564,	250,	564,	250,	278,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	278,	278,	564,	564,	564,	444,	921,	722,	667,	667,	722,	611,	556,	722,	722,	333,	389,	722,	611,	889,	722,	722,	556,	722,	667,	556,	611,	722,	722,	944,	722,	722,	611,	333,	278,	333,	469,	500,	333,	444,	500,	444,	500,	444,	333,	500,	500,	278,	278,	500,	278,	778,	500,	500,	500,	500,	333,	389,	278,	500,	500,	722,	500,	500,	444,	480,	200,	480,	541,	
],
'URWBookmanL-DemiBold' => [
340,	360,	420,	660,	660,	940,	800,	320,	320,	320,	460,	600,	340,	600,	340,	600,	660,	660,	660,	660,	660,	660,	660,	660,	660,	660,	340,	340,	600,	600,	600,	660,	820,	720,	720,	740,	780,	720,	680,	780,	820,	400,	640,	800,	640,	940,	740,	800,	660,	800,	780,	660,	700,	740,	720,	940,	780,	700,	640,	300,	600,	300,	600,	500,	320,	580,	600,	580,	640,	580,	380,	580,	680,	360,	340,	660,	340,	1000,	680,	620,	640,	620,	460,	520,	460,	660,	600,	800,	600,	620,	560,	320,	600,	320,	600,	
],
'NimbusRomNo9L-Medi' => [
250,	333,	555,	500,	500,	1000,	833,	333,	333,	333,	500,	570,	250,	570,	250,	278,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	333,	333,	570,	570,	570,	500,	930,	722,	667,	722,	722,	667,	611,	778,	778,	389,	500,	778,	667,	944,	722,	778,	611,	778,	722,	556,	667,	722,	722,	1000,	722,	722,	667,	333,	278,	333,	581,	500,	333,	500,	556,	444,	556,	444,	333,	500,	556,	278,	333,	556,	278,	833,	556,	500,	556,	556,	444,	389,	333,	556,	500,	722,	500,	500,	444,	394,	220,	394,	520,	
],
'URWBookmanL-LighItal' => [
300,	320,	360,	620,	620,	800,	820,	280,	280,	280,	440,	600,	300,	600,	300,	600,	620,	620,	620,	620,	620,	620,	620,	620,	620,	620,	300,	300,	600,	600,	600,	540,	780,	700,	720,	720,	740,	680,	620,	760,	800,	320,	560,	720,	580,	860,	720,	760,	600,	780,	700,	640,	600,	720,	680,	960,	700,	660,	580,	260,	600,	260,	600,	500,	280,	620,	600,	480,	640,	540,	340,	560,	620,	280,	280,	600,	280,	880,	620,	540,	600,	560,	400,	540,	340,	620,	540,	880,	540,	600,	520,	360,	600,	380,	600,	
],
'NimbusRomNo9L-ReguItal' => [
250,	333,	420,	500,	500,	833,	778,	333,	333,	333,	500,	675,	250,	675,	250,	278,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	333,	333,	675,	675,	675,	500,	920,	611,	611,	667,	722,	611,	611,	722,	722,	333,	444,	667,	556,	833,	667,	722,	611,	722,	611,	500,	556,	722,	611,	833,	611,	556,	556,	389,	278,	389,	422,	500,	333,	500,	500,	444,	500,	444,	278,	500,	500,	278,	278,	444,	278,	722,	500,	500,	500,	500,	389,	389,	278,	500,	444,	667,	444,	444,	389,	400,	275,	400,	541,	
],
'URWBookmanL-DemiBoldItal' => [
340,	320,	380,	680,	680,	880,	980,	320,	260,	260,	460,	600,	340,	600,	340,	360,	680,	680,	680,	680,	680,	680,	680,	680,	680,	680,	340,	340,	620,	600,	620,	620,	780,	720,	720,	700,	760,	720,	660,	760,	800,	380,	620,	780,	640,	860,	740,	760,	640,	760,	740,	700,	700,	740,	660,	1000,	740,	660,	680,	260,	580,	260,	620,	500,	320,	680,	600,	560,	680,	560,	420,	620,	700,	380,	320,	700,	380,	960,	680,	600,	660,	620,	500,	540,	440,	680,	540,	860,	620,	600,	560,	300,	620,	300,	620,	
],
'NimbusRomNo9L-MediItal' => [
250,	389,	555,	500,	500,	833,	778,	333,	333,	333,	500,	570,	250,	606,	250,	278,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	333,	333,	570,	570,	570,	500,	832,	667,	667,	667,	722,	667,	667,	722,	778,	389,	500,	667,	611,	889,	722,	722,	611,	722,	667,	556,	611,	722,	667,	889,	667,	611,	611,	333,	278,	333,	570,	500,	333,	500,	500,	444,	500,	444,	333,	500,	556,	278,	278,	500,	278,	778,	556,	500,	500,	500,	389,	389,	278,	556,	444,	667,	500,	444,	389,	348,	220,	348,	570,	
],
'CharterBT-Bold' => [
291,	340,	339,	736,	581,	888,	741,	255,	428,	428,	500,	833,	289,	833,	289,	491,	581,	581,	581,	581,	581,	581,	581,	581,	581,	581,	340,	340,	833,	833,	833,	487,	917,	651,	628,	638,	716,	596,	552,	710,	760,	354,	465,	650,	543,	883,	727,	752,	587,	752,	671,	568,	603,	705,	635,	946,	637,	610,	592,	443,	491,	443,	1000,	500,	255,	544,	577,	476,	596,	524,	341,	551,	597,	305,	297,	553,	304,	892,	605,	577,	591,	575,	421,	447,	358,	600,	513,	799,	531,	515,	495,	493,	500,	493,	833,	
],
'NimbusMonL-Regu' => [
600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	
],
'CharterBT-BoldItalic' => [
293,	340,	339,	751,	586,	898,	730,	261,	420,	420,	500,	833,	292,	833,	294,	481,	586,	586,	586,	586,	586,	586,	586,	586,	586,	586,	346,	346,	833,	833,	833,	492,	936,	634,	628,	625,	702,	581,	539,	693,	747,	353,	474,	653,	529,	894,	712,	729,	581,	729,	645,	553,	584,	701,	617,	921,	608,	586,	572,	449,	481,	449,	1000,	500,	261,	572,	556,	437,	579,	464,	325,	517,	595,	318,	297,	559,	307,	883,	600,	550,	565,	562,	449,	403,	366,	599,	492,	768,	510,	494,	465,	487,	500,	487,	833,	
],
'NimbusMonL-Bold' => [
600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	
],
'CharterBT-Roman' => [
278,	338,	331,	745,	556,	852,	704,	201,	417,	417,	500,	833,	278,	833,	278,	481,	556,	556,	556,	556,	556,	556,	556,	556,	556,	556,	319,	319,	833,	833,	833,	486,	942,	639,	604,	632,	693,	576,	537,	694,	738,	324,	444,	611,	520,	866,	713,	731,	558,	731,	646,	556,	597,	694,	618,	928,	600,	586,	586,	421,	481,	421,	1000,	500,	201,	507,	539,	446,	565,	491,	321,	523,	564,	280,	266,	517,	282,	843,	568,	539,	551,	531,	382,	400,	334,	569,	494,	771,	503,	495,	468,	486,	500,	486,	833,	
],
'CharterBT-Italic' => [
278,	338,	331,	745,	556,	852,	704,	201,	419,	419,	500,	833,	278,	833,	278,	481,	556,	556,	556,	556,	556,	556,	556,	556,	556,	556,	319,	319,	833,	833,	833,	486,	942,	606,	588,	604,	671,	546,	509,	664,	712,	312,	447,	625,	498,	839,	683,	708,	542,	708,	602,	537,	565,	664,	590,	898,	569,	562,	556,	421,	481,	421,	1000,	500,	201,	525,	507,	394,	523,	424,	292,	481,	551,	287,	269,	514,	275,	815,	556,	502,	516,	512,	398,	370,	333,	553,	454,	713,	477,	475,	440,	486,	500,	486,	833,	
],
'NimbusMonL-ReguObli' => [
600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	
],
'CenturySchL-Roma' => [
278,	296,	389,	556,	556,	833,	815,	204,	333,	333,	500,	606,	278,	606,	278,	278,	556,	556,	556,	556,	556,	556,	556,	556,	556,	556,	278,	278,	606,	606,	606,	444,	737,	722,	722,	722,	778,	722,	667,	778,	833,	407,	556,	778,	667,	944,	815,	778,	667,	778,	722,	630,	667,	815,	722,	981,	704,	704,	611,	333,	606,	333,	606,	500,	204,	556,	556,	444,	574,	500,	333,	537,	611,	315,	296,	593,	315,	889,	611,	500,	574,	556,	444,	463,	389,	611,	537,	778,	537,	537,	481,	333,	606,	333,	606,	
],
'NimbusMonL-BoldObli' => [
600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	600,	
],
'CenturySchL-Bold' => [
287,	296,	333,	574,	574,	833,	852,	241,	389,	389,	500,	606,	278,	606,	278,	278,	574,	574,	574,	574,	574,	574,	574,	574,	574,	574,	278,	278,	606,	606,	606,	500,	747,	759,	778,	778,	833,	759,	722,	833,	870,	444,	648,	815,	722,	981,	833,	833,	759,	833,	815,	667,	722,	833,	759,	981,	722,	722,	667,	389,	606,	389,	606,	500,	241,	611,	648,	556,	667,	574,	389,	611,	685,	370,	352,	667,	352,	963,	685,	611,	667,	648,	519,	500,	426,	685,	611,	889,	611,	611,	537,	389,	606,	389,	606,	
],
'URWPalladioL-Roma' => [
250,	278,	371,	500,	500,	840,	778,	278,	333,	333,	389,	606,	250,	606,	250,	606,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	250,	250,	606,	606,	606,	444,	747,	778,	611,	709,	774,	611,	556,	763,	832,	337,	333,	726,	611,	946,	831,	786,	604,	786,	668,	525,	613,	778,	722,	1000,	667,	667,	667,	333,	606,	333,	606,	500,	278,	500,	553,	444,	611,	479,	333,	556,	582,	291,	234,	556,	291,	883,	582,	546,	601,	560,	395,	424,	326,	603,	565,	834,	516,	556,	500,	333,	606,	333,	606,	
],
'CenturySchL-Ital' => [
278,	333,	400,	556,	556,	833,	852,	204,	333,	333,	500,	606,	278,	606,	278,	606,	556,	556,	556,	556,	556,	556,	556,	556,	556,	556,	278,	278,	606,	606,	606,	444,	747,	704,	722,	722,	778,	722,	667,	778,	833,	407,	611,	741,	667,	944,	815,	778,	667,	778,	741,	667,	685,	815,	704,	926,	704,	685,	667,	333,	606,	333,	606,	500,	204,	574,	556,	444,	611,	444,	333,	537,	611,	333,	315,	556,	333,	889,	611,	500,	574,	556,	444,	444,	352,	611,	519,	778,	500,	500,	463,	333,	606,	333,	606,	
],
'URWPalladioL-Bold' => [
250,	278,	402,	500,	500,	889,	833,	278,	333,	333,	444,	606,	250,	606,	250,	296,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	250,	250,	606,	606,	606,	444,	747,	778,	667,	722,	833,	611,	556,	833,	833,	389,	389,	778,	611,	1000,	833,	833,	611,	833,	722,	611,	667,	778,	778,	1000,	667,	667,	667,	333,	606,	333,	606,	500,	278,	500,	611,	444,	611,	500,	389,	556,	611,	333,	333,	611,	333,	889,	611,	556,	611,	611,	389,	444,	333,	611,	556,	833,	500,	556,	500,	310,	606,	310,	606,	
],
'CenturySchL-BoldItal' => [
287,	333,	400,	574,	574,	889,	889,	259,	407,	407,	500,	606,	287,	606,	287,	278,	574,	574,	574,	574,	574,	574,	574,	574,	574,	574,	287,	287,	606,	606,	606,	481,	747,	741,	759,	759,	833,	741,	704,	815,	870,	444,	667,	778,	704,	944,	852,	833,	741,	833,	796,	685,	722,	833,	741,	944,	741,	704,	704,	407,	606,	407,	606,	500,	259,	667,	611,	537,	667,	519,	389,	611,	685,	389,	370,	648,	389,	944,	685,	574,	648,	630,	519,	481,	407,	685,	556,	833,	574,	519,	519,	407,	606,	407,	606,	
],
'URWPalladioL-Ital' => [
250,	333,	500,	500,	500,	889,	778,	278,	333,	333,	389,	606,	250,	606,	250,	296,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	250,	250,	606,	606,	606,	500,	747,	722,	611,	667,	778,	611,	556,	722,	778,	333,	333,	667,	556,	944,	778,	778,	611,	778,	667,	556,	611,	778,	722,	944,	722,	667,	667,	333,	606,	333,	606,	500,	278,	444,	463,	407,	500,	389,	278,	500,	500,	278,	278,	444,	278,	778,	556,	444,	500,	463,	389,	389,	333,	556,	500,	722,	500,	500,	444,	333,	606,	333,	606,	
],
'Dingbats' => [
278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	278,	
],
'URWPalladioL-BoldItal' => [
250,	333,	500,	500,	500,	889,	833,	278,	333,	333,	444,	606,	250,	606,	250,	315,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	250,	250,	606,	606,	606,	444,	833,	722,	667,	685,	778,	611,	556,	778,	778,	389,	389,	722,	611,	944,	778,	833,	667,	833,	722,	556,	611,	778,	667,	1000,	722,	611,	667,	333,	606,	333,	606,	500,	278,	556,	537,	444,	556,	444,	333,	500,	556,	333,	333,	556,	333,	833,	556,	556,	556,	537,	389,	444,	389,	556,	556,	833,	500,	556,	500,	333,	606,	333,	606,	
],
'StandardSymL' => [
250,	333,	250,	500,	250,	833,	778,	250,	333,	333,	250,	549,	250,	549,	250,	278,	500,	500,	500,	500,	500,	500,	500,	500,	500,	500,	278,	278,	549,	549,	549,	444,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	333,	250,	333,	250,	500,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	250,	480,	200,	480,	250,	
],
'URWChanceryL-MediItal' => [
220,	280,	220,	440,	440,	680,	780,	240,	260,	220,	420,	520,	220,	520,	220,	340,	440,	440,	440,	440,	440,	440,	440,	440,	440,	440,	260,	240,	520,	520,	520,	380,	700,	620,	600,	520,	700,	620,	580,	620,	680,	380,	400,	660,	580,	840,	700,	600,	540,	600,	600,	460,	500,	740,	640,	880,	560,	560,	620,	240,	480,	320,	520,	500,	240,	420,	420,	340,	440,	340,	320,	400,	440,	240,	220,	440,	240,	620,	460,	400,	440,	400,	300,	320,	320,	460,	440,	680,	420,	400,	440,	240,	520,	240,	520,	
],
);
sub new {
    my $class = shift;

    my $self = {};

    bless($self,$class);
    return $self;
}


sub stringwidth {
   my ($string, $fontname, $fontsize) = @_;
   my $returnval = 0;
  
   foreach my $char (unpack("C*",$string)) {
       $returnval+=$fonts{$fontname}->[$char-32];
   }
   return ($returnval*$fontsize/1000);

}


sub listFonts {
    my @tmp = %fonts;
    my @returnval =();
    while (@tmp) {
        push @returnval, shift(@tmp);   
	shift @tmp;
    }
    return sort( {$a<=>$b;} @returnval);
}


1;

__END__

=head1 NAME

PostScript::Metrics - helper module for PostScript::TextBlock

=head1 SYNOPSIS

Fix me.

=head1 DESCRIPTION

Fix me.

=head1 AUTHOR

Shawn Wallace (shawn@as220.org)

=head1 SEE ALSO

PostScript::TextBlock, PostScript::Element, PostScript::Document

=cut

